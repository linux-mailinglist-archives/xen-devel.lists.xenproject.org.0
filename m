Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732157B6812
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 13:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612201.952046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qndhD-0005it-6x; Tue, 03 Oct 2023 11:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612201.952046; Tue, 03 Oct 2023 11:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qndhD-0005gx-4D; Tue, 03 Oct 2023 11:36:11 +0000
Received: by outflank-mailman (input) for mailman id 612201;
 Tue, 03 Oct 2023 11:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/VM=FR=citrix.com=prvs=63394bc6a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qndhB-0005gV-AL
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 11:36:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e08b47-61e1-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 13:36:01 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2023 07:35:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5735.namprd03.prod.outlook.com (2603:10b6:510:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Tue, 3 Oct
 2023 11:35:31 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Tue, 3 Oct 2023
 11:35:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 05e08b47-61e1-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696332961;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KOEp1wLOEP3Pa4FfTtuVTdvJxQDJJAqzhykqFDbF5GM=;
  b=crpeOzU548hJqaZgVTafhkvvwQswuX8rH4nDlpAqhmWDdairtXSnoI0k
   FgZIUHBLQfmMv2WLbUJ+Yav8ikitFyjwTudGdUT5mPOpd3msYT0pnQhw5
   PBxvq22L7SF5bHeXr7CuLwgIEXqNVZtZzqVNcrItNQB501LPq4j5QXxPu
   Q=;
X-CSE-ConnectionGUID: Hcs18ohjSjadcT/Vj1BFeA==
X-CSE-MsgGUID: H+XmYVWTTyee9KnvvWUAnA==
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 123099344
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RXnswalVbZP4Sk1nsVc3xMro5gygJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWWmFMq2LZWP0LY91a9ywoEpT7Z6Hn9BhQVQ9rCgyECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5ASGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dwTM2ldaRCBvOC/zLmHDddu3+4NIeC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieeyWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmgANNDT+HknhJsqH3Q9mkiNiIqaUq2rKiajFCgZO92L
 WVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1xbXFI88T+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsgSzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:8bboR6OEEu+z8MBcTuOjsMiBIKoaSvp037BL7TETdfUxSKelfq
 +V/cjzuSWE7Qr5IUtQ4exoRpPwO080hKQU3WB5B97LMDUOl1HHEGgI1/qB/9SPIVybygZBvp
 0OT0DMZeeAdGSTxa7BijVRWb4breVuvsuT9IDjJ+YHd3ANV0mBhz0JcTqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AAwZwZWuoyUFXbqp/e/Y5rlZy6IsFeWaEnHDQIXS?=
 =?us-ascii?q?6AGpidPqrSwa61q5Nxp8=3D?=
X-Talos-MUID: 9a23:gXqKagXl+HCeUXPq/B+vtDRTCvhU37WjBREul4sYhPStMwUlbg==
X-IronPort-AV: E=Sophos;i="6.03,197,1694750400"; 
   d="scan'208";a="123099344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD3G4COI+sDEZgRl6GTRpW2wU7/5W9u8k/v+9OHWSg1ms/g24zK6RZtZwSuK7wKEemSP0oTJsexKJjUNy9dZcF3EFfK5xF9mE7k/AntER46LTB1qCRAM03hjToE3KIcs8BlW4w0oHRy+wTDvHW3bbziCkA8wcN92tD6THoSiSX4gNs7PZ8g1MTAdsL68mBEYyDvNhrl3J4qYs7RzkJyB/9sg5GfnC0SUChPrcoxju6Y3KApUobuDMFmcrMhrec/anDEx1lo3CM58k5bwm9jGupbhKaZ7lVeD34Z93q3+YPZvitPwwGT2eYvA7idFW02tKtcJEV+hE/lSP0Zoiasnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nxNyHYLGzv+R974aDBtvbrfosZ9EgYWNEetS75XAJA=;
 b=cITUcZEJHRIWoMNK7aAtQjEUj9qKpU0PzSU8eC98mUPQao3Q24Juu72oFmGVuA4AKxTAmN7mQNFrrGqvLCx4eerYdLM/hqnI7qPALxGq6855m/kEuDdrCDYVQBNjexTMPM4SGMm6umxbJQlJyHovmCI7nOGpSB2v8BflFOxlqqMOkvaCz8HWsEUloyApWn44r6cN0GGWCvLKU0CaSGsNBcly1hiIG454mI7PViJIUiRalEvvlnCWEheyVjRU2H65xO4+LWfOz1KTPPpqpSSO+CveAQDmjkLwlYtwWm9hRGyzMFe1x7kNfeuVKV2i2FErAaAo78NpalcZ1xIcl/C0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nxNyHYLGzv+R974aDBtvbrfosZ9EgYWNEetS75XAJA=;
 b=Y26G+dx2S1y9QqKDKGZW5ZjzHqQlmJnUtxeUWKWL4q/cjS/zsjk1LBcNDYJ8ubRkjZRDebczgIJMKQNWlHuei/6cT30ANySKK+LlLdMbFUvY3E7Ajgi/OOgAs2t6XIOV4Av/t2nLWk0S8nZEpgi7gMbhBZzKP52DPoANd4meHxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Oct 2023 13:35:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZRv8fRhYQrwU1H6q@MacBookPdeRoger>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <b045e8fe-ccf7-bbcd-ece8-036a13858d36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b045e8fe-ccf7-bbcd-ece8-036a13858d36@suse.com>
X-ClientProxiedBy: LO6P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 5805ed46-f7d6-4053-66bd-08dbc404d955
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a8v+peBYwuGnCLtOoyrnldPBTy4S22OeGYIM1xmN6XBoy7VKA+Vm6anPn2XRJA0bpctJYfQIDcwCnDkUdHN3Lk2bVBMbPPwUhdJJaZ16uajM60lu4AcdH0iv7yB6tyC5oiz5YnfZW6qQ6sFYhTYetIqqbAs6PFRUncwJpHPqm2PveWAP4TKMI/HtuamSBG3exF9LAGXQxSx6yhL3DoklAwfuxSKIekApZeCTCIoo1yk+zk4/aTSd8l40iDNEtXLVEW9vAZWlCRGTEoZ/QAg3X6mcylPwcYCo6LUnBEJXPoNqaGC8RMbvMmC/4Y51xAc9PoUfeHch6pJTV1XFXed6kf1f//wIdsSEQZn0KSGVpqN7b44snHZWcMIL3Z9nzzw3NtsxxgKDvEXLWZ8Hd3JjErWCRhuAm8LPWW8tcwdRq+LjkCTgyrvWa+mpczHi1A2x/AENtk9+dWOqAWCcyEb0lxrmMnsgFwXZYjjrtQTBFXe80SodrcI5cKHqnaKAElUA2Y8L/FgGw24kKiMUxN1iFThISXPCT8umcJj7KZgNsVjEKfliMhvK8AQEbFjBxfgt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(41300700001)(6506007)(478600001)(6486002)(53546011)(9686003)(6512007)(316002)(66556008)(54906003)(66476007)(66946007)(6916009)(8676002)(4326008)(8936002)(5660300002)(26005)(6666004)(83380400001)(2906002)(85182001)(33716001)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1I2K2NkSDg4UDFWdGZGdWgrZVUySnZlOW1kTGNZd3FOMWFwU2Rvc0RHUzJF?=
 =?utf-8?B?ZUZYOXRhSnFOWXdqN01PaXRHS1dBOGYyeUhFUklHb21TMkM0SjJlUHlUVE1n?=
 =?utf-8?B?NnVaWE41VStGeEIzanNPQXdieEFQTXVpMlJmSEVUM3RHbUxnZ0JpdDV1UDhP?=
 =?utf-8?B?YkhQNCszcDBmV3hQZ2JBNE5BOE1OSGJvelVMVmJqMHFJY3dZaVA3RnFxRzA3?=
 =?utf-8?B?eDVRZDkrUVIvdmcyQ0p2aXhTZndnMVZ2S3c3eEU5d2o0TC9PNVFOUWhtTFFB?=
 =?utf-8?B?d2UxTnlMdURXL1Y1blY5bktDY01Bd1Ftb2JrS3FVc1NEN1BqWXRzamNpQmJC?=
 =?utf-8?B?a3JFcUpLZklIVVhqSzFLTmJ5NWFzY2paTktsWjZ3RmZPcDRvNFJqNkwzMFMz?=
 =?utf-8?B?Mm4xdXczWmFUeldtYUFwaW1wZzJtOUVhSDBFV1AvL3J6QzBsUC9BMHovRitU?=
 =?utf-8?B?RkZIU3lsMUVUdUNpT1J2T3VKd3IrQ2dpMDFjODYyVFg5UGhrbGo3THgvbHd4?=
 =?utf-8?B?anM2Q2dUMmt2SFlreERYSURWR1kyZ2ZDbXBLeTA5ZVNXR1p1QWtyZTI3ODVD?=
 =?utf-8?B?RE9BLzZYVU5Zd29kVkV4aGFYbjAvZG5LcDIrSkI1ZjVUR1V5WnZDOFViTzBt?=
 =?utf-8?B?MHQ5ZXVKQSt2bzFiNy9kVHpJWVpBNTJid2pYNnBrdzY0T2xQRW1JTlJYZzRr?=
 =?utf-8?B?cnYvenE4b3JsUEpqZ3h3MDZ1QnZWTmxWRmRoOW9jaVNobSs4V1kvOW5jTitK?=
 =?utf-8?B?S3U2azlsc2xxNmFJNWhDQmVOODFKZzlKK3lQSU91SjhZWWdkd1ZiRzNQc2dE?=
 =?utf-8?B?bmNIdHlJUm1JZDUrS2MyeXVRSVJtUlRzdUh0Z01EelEyL1V2ZjNRem1mS01u?=
 =?utf-8?B?S0hlbkhaMmZkM3QwZWtNL0lmSjE5UHpLMUhiTWw0N2JvTXlwSWVaYUFNYitx?=
 =?utf-8?B?QmZMNDA4UTJQT3ZhWHZSRFhGaVNKektzaFk5UkV3K3ZnazIwK1JocXlKNjg5?=
 =?utf-8?B?T005cGRCc0owYVdFa2JuS3lMbjRXcUQvNWVHZWoyN3V6ejZNQ3Q2VTJ3VUNC?=
 =?utf-8?B?SHBBajN4OGJZWDRYVUxPRWxxbHFuS1JhM0R4V1dJOVdhTGp0L2dqc1N5WFVK?=
 =?utf-8?B?dWZxYTNaeVYveWJ3bGhoNWRvOGIzV1NSZkNia1grZThVM1dYbDI0M3luQTJ2?=
 =?utf-8?B?TFMxZlo5SEkyb3hrZE1FeEJWdGZESHpRWnhjZFR4dTU5bzI0emFkcGlUNEQ4?=
 =?utf-8?B?VmNrMjdJTlBVMVluM2srL1ZVQUZtcFMzR0RwU2VFNE5HWkVGNnlpRkpZSHhH?=
 =?utf-8?B?dUFiYmhUczFJd2ZxSWNHMEZFMEFYbm9UUGcrbEdlcXkrRTI4bEI2M1NxK3lz?=
 =?utf-8?B?cFVxTVBhWDZibHJBWXVVeUVaSW1sSGNLeEt6dmNtR3NzMTdWeDVyK1NLWnJu?=
 =?utf-8?B?K2pyME05TkJ3bnN3dGl1b1NFdnVUNFBJblRFbE0rMCswT21NTThJSGhBRDhl?=
 =?utf-8?B?UHdkOVJMQWc5RmVFaGVKNVlsallsejNmUXRDaWpmWS9xL3huNHFLSFVQa0J6?=
 =?utf-8?B?Q2JiNzZKeE9PdnVBTUgxSG5aQ2c5ZEhJRWxGbUVTWjFtUjBsOWlvUzFJVTVl?=
 =?utf-8?B?QXE0YW9UaUZSVVJPYjhSVnBjU3plb29Yd0twL3lOZjE5anBNRkFURE9RbmJK?=
 =?utf-8?B?OE9EY1Zuck9pRWoycUhnNEVxSC9kU2s0L3FtL1pqSmMvUWNIM2ZvSWZ2RG8v?=
 =?utf-8?B?TlY4YlB5MFI2ckJBWHpjdHpEZktlSjdvbmRNVmtQTG9VbDdhWkpsSDlBQ1FE?=
 =?utf-8?B?RG52dTh3eEJacVJvK1BNdm9zcFhLVm10d1RNbU0zYnVGSlJXTnNiQTJKSDFz?=
 =?utf-8?B?VitnMlNSM0c2SXhPOVFuMXRVOWFGenZKY3lDbDc2VlNYWFZ6L1QrS3ZkeU0w?=
 =?utf-8?B?SlRkOEdJaDd5UHI1dDFmNzFQcTJpS25MNFFPTExqKzY5dDJGaUpaUEUrRE5M?=
 =?utf-8?B?eEJGbG5CeW9pS3hDTVpNWVR5OENKc1BCQXFac2hCZllzZFZ1Z1FYdmR6dzFS?=
 =?utf-8?B?NnVuVG1sRkl3aU02dWt6Mi83SmQ1OHdSSXlHYndDcnRQNlVZTS95NWZZVXF4?=
 =?utf-8?B?Smhqc0dCMkc4THhyV2VMTythVjZLWStROG5LYXMzT3l5SGREZnlxeW01RlNT?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yz725L96YVaWY+fDunhWvqNiwGC7v1x2gxZRt8nGAsWB6qcx1/GrUzWmXOvuq9B7nJp29OQn8vj3axID0z0W26v92aGUJA7JfRWVu7IDo92qmYWSdFXHiB+4OOvXe65vaBPgFlvEQc+pFyDs94EAeGAu7agqnUxvnIxK6WdJ8TMW/LkXlOys+ve+BfcCYGeeNqiB/tJR3ctY9jn060w1Lrq8FEEAEca9j6x0NOYvbwOy/RQpj7mBL99DeBOf6ia+aqrwAjmKCG3JB0R4Ygx09ubg5gz/Yn6ML6xelXnyEryR3eNAzgdzQx3sxiF8ev2sEsDpPElhyHPwFQl3mc8/+Ugz5qBACBVj3X68OEOjMTeqockzHkWiApB5NSqih1AEBpprsaUJVCLaLidO3m1MocQ/A/J3SVrtoSQOTMOzr6uMkihioGQJnlFRdXGm2IjHnWilW3Kve7W8Jltc3Iz5eLLUxhFRU8V81vxR74u5DYIZYCmEOvci4ZNBnzPLPLWZCxg/skGhauwOtwRUTpugxJa3bKGF3iHgXl69r+zlbLwwBj5jyaKIuaQyRDw87mJYbnEigbTxEUf/ZN8fU3aAmvRh83MkY2IT8Np9+WsGSZcgTKf5H6Yo1T/Sp2kUdDsxK7Da+i+H1Fa+3ASfgvJ4Zwt85ZaLDktMRiGdg+PxVloFqEMO24q/OqXPfxQQtPYY+WIQpzbcJ0vqcdgSh4Acvrjw0f0RflyS1kU+oooNR/jGOhhHCl3RwQpBwPeSR4BDv6edDKEAbDyfnxPhw8xn9hbAPMbBZoGiCjU7BFc2nMVbuwbd5Pwh32WUblTDhPEeEcVIvPKirvfiBCu8HSVUdw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5805ed46-f7d6-4053-66bd-08dbc404d955
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 11:35:31.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDEJHB+KcRWiS+ZOwVO4pCjRH8AQIvSWeOkZyUMeV+Y4IBZE6GFk2LeXZWekNls9/zvWEuchkBYHKavf5BzuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5735

On Wed, Sep 27, 2023 at 10:21:44AM +0200, Jan Beulich wrote:
> On 15.09.2023 09:43, Roger Pau Monne wrote:
> > The current logic to chose the preferred reboot method is based on the mode Xen
> > has been booted into, so if the box is booted from UEFI, the preferred reboot
> > method will be to use the ResetSystem() run time service call.
> > 
> > However, that method seems to be widely untested, and quite often leads to a
> > result similar to:
> > 
> > Hardware Dom0 shutdown: rebooting machine
> > ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<0000000000000017>] 0000000000000017
> > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > [...]
> > Xen call trace:
> >    [<0000000000000017>] R 0000000000000017
> >    [<ffff83207eff7b50>] S ffff83207eff7b50
> >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> > 
> > ****************************************
> > Panic on CPU 0:
> > FATAL TRAP: vector = 6 (invalid opcode)
> > ****************************************
> > 
> > Which in most cases does lead to a reboot, however that's unreliable.
> > 
> > Change the default reboot preference to prefer ACPI over UEFI if available and
> > not in reduced hardware mode.
> > 
> > This is in line to what Linux does, so it's unlikely to cause issues on current
> > and future hardware, since there's a much higher chance of vendors testing
> > hardware with Linux rather than Xen.
> > 
> > Add a special case for one Acer model that does require being rebooted using
> > ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> > 
> > I'm not aware of using ACPI reboot causing issues on boxes that do have
> > properly implemented ResetSystem() methods.
> 
> A data point from a new system I'm still in the process of setting up: The
> ACPI reboot method, as used by Linux, unconditionally means a warm reboot.
> The EFI method, otoh, properly distinguishes "reboot=warm" from our default
> of explicitly requesting cold reboot. (Without taking the EFI path, I
> assume our write to the relevant BDA location simply has no effect, for
> this being a legacy BIOS thing, and the system apparently defaults to warm
> reboot when using the ACPI method.)

This is unfortunate, but IMO not as worse as getting a #UD or any
other fault while attempting a reboot.  We can always force this
system to use UEFI reboot, if that does work better than ACPI.

> Clearly, as a secondary effect, this system adds to my personal experience
> of so far EFI reboot consistently working on all x86 hardware I have (had)
> direct access to. (That said, this is the first non-Intel system, which
> likely biases my overall experience.)

I can try to gather some data, I can at least tell you that the Intel
NUC11TNHi7 TGL does also hit a fault when attempting UEFI reboot.
The above crash was from a Dell PowerEdge R6625.  I do recall seeing
this with other boxes on the Citrix lab, but don't know the exact
models.  I'm quite sure other downstreams can provide similar
feedback.

I think it's clear now that using ResetSystem() when booted from UEFI
is not mandated by the UEFI specification, so I still stand by this
patch and think we should select the default reboot method that has
the highest chance of succeeding.

Thanks, Roger.

