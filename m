Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1202716AF8
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 19:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541320.843964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43AB-0008QQ-3X; Tue, 30 May 2023 17:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541320.843964; Tue, 30 May 2023 17:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43AB-0008N5-0W; Tue, 30 May 2023 17:29:39 +0000
Received: by outflank-mailman (input) for mailman id 541320;
 Tue, 30 May 2023 17:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q43A9-0008Mz-AF
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 17:29:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a36eb98-ff0f-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 19:29:34 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 13:29:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5656.namprd03.prod.outlook.com (2603:10b6:5:2d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 17:29:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 17:29:20 +0000
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
X-Inumbo-ID: 8a36eb98-ff0f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685467774;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eGtQwqVhUh0OMGOjDWvkDnQgyxy1nP8PoWKXSd1uzaA=;
  b=dp42jGsWWtey1NPrv06d1WYe0U2CqSKhknn3fVM7FM3rsgFcwF717LC4
   OCMiS2MhkrN6I1ra1NqWzRZQbek3nYd1cVOrzSuGKyhpZ0cA4P2YUoFE+
   okXZith4gslVtqb3hhGBcU42UrJDSwidtEPDssUXn5u76AvScwNCToOhR
   c=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 110290678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:07DN16rqiW2lzocubRParvNJMFheBmLLZBIvgKrLsJaIsI4StFCzt
 garIBnTa/yDamOgf9x2YNy18E4Av5HWyIJrSVc6rSEzRn4W9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkMMSqsn9ux/PGySbRoxegfFtjnZ7pK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Yw0QXNmTx75Bs+XBy/jKKJlkeCHO1vb
 GAS3Gk+gZcy3Rn+JjX6d1jiyJKehTYVX9dSGus28gbL1KPQ5wubAUAPSjlcZJots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsUg8t89Tl5oYpgXrnTNl5F7WupsboAjy2y
 DePxAA8jbgOic8A142g4EvKxTmro/D0ohUd4wzWWiep611/bYv8P4iwswGDvbBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4ulmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:eVBmp68cO5MWRYxJerxuk+DiI+orL9Y04lQ7vn2ZHyYlFfBwWf
 rAoB17726WtN9/YhodcLy7UpVoIkm9yXcW2+cs1OyZLW3bUQKTRelfBO3ZrgEIcBeeygcy78
 tdmwcVMqyXMbDX5/yKgjVRsrwbsby6zJw=
X-Talos-CUID: 9a23:mEehN2NubzpwjO5DQSg4zmEMI8cZMXTekXOTD3OCGGoycejA
X-Talos-MUID: =?us-ascii?q?9a23=3A1Sv5KA9ig6ckMYU7MZyDMOOQf84v54n1OFwErdI?=
 =?us-ascii?q?5i46oMwozKxuijB3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110290678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUaUi3XnpdTmEKw5ZUWzRLrKkjQGHBMe0dXsnehs/fOi2yIp0o0c0ARGlHbIz9lnU+8qvMIA+MjBGTXhYGUwWmLQM1WEWjdcDAfmltqBN7T8+bdiyoDfwXcs2QRY1xI074KJSPnpONFZnZofbRtwkvvwoXpE8kiRe1iT6EsmeQs6JrnirYGLJYN3jmOr+36Ply4nOnnSCWBxFlkEGBlJbEG05Midwu3sKSWNTOgeEgypphirQUDTG+BJdJmRLgfEleGmiThHW26YZLKmAQf9JhPt/IA2/FjMd0+MmfRYS8ZMc4dsoLhOOew8CaZ/9dxol1BfySD8jy0jziCBXHi/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru31ZqSFBUGrduaSVqofp/33VcjaBYZ/bFaZiCXx+NI=;
 b=Mqv7wqwSqHf2PeisLVxd/67aXeWAZKZ+Xw5YxTrRlW1s+of8A1yOYQ/7BYG6+vva9sgS4GcAgNlw0fa5D9Mp7yfBLwChB2+uv9dREW1Sn0tWm0vpHxnWY+wg+ClltBSvkrAZ8T0DHZAO4GdchRgofCPy8mv/vbbf8FKv5H6iRv5FicMEsnnv1en/jwI7nk0Qba3djiKV0sT+ZuY90rwXWb70JdR8X2JLuBBdWW/QOIpnGfPOrAZ8uuMbLN2YtJceBLUO3MmMom1v6ILgRnhJX72+UItJOtnsECgQHRFGHchOUtTt24ZIWj8iwebXZtyr/xWJ8w2DvsJzVq/PGJm+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru31ZqSFBUGrduaSVqofp/33VcjaBYZ/bFaZiCXx+NI=;
 b=HjRJmhcxLgyRtP2q7WxnsKquILMrIr9YM5U76yJgojzFc9nVF7Df1S8jJrCHXuN0BWwo7ZlrwXHpBM9Ay+ppILYijDkDGAtC3TyrZ/3baBzXB5BAitoaVRNAoXlVhgM1QMS7IsJa/sE57u86w2dWThw+TkAL7LeQ8PJF1NGne2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bc209116-75ac-06d6-e4bb-eb77b10ac5bd@citrix.com>
Date: Tue, 30 May 2023 18:29:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86: Add bit definitions for Automatic IBRS
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230530135854.1517-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: be414ac7-a7ea-4b87-1c6b-08db613366ca
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hz/+BZdh7357iIakbP+WYmDHoPCHV2gcO+1SmHFFIPpkOyOG7ljUd/OBF3IjCR/qGi0l2VPEv9K3Dr8u1jmwD55lvs8JMSMgadAR6FIPO+6JJSg9cN5Yuk9DbSpL19M9a7qNCDxLmPg1MJHFPdNhxM3MInUi6H9h1Eq32eE23WowIsvSswpo+knlyKN2v8bl7BfniMDRN8lHHqMXLB0Cjhveek8NULgVJTXVsN5v2thXvYDVVB5ArVwOKXn43LaTwub33Q2TVQPAFb4ixkFavbW6GZqD7j59xbuUcGYHziBDSt94mTb8nFK0Z6VOVMgYbXFC3jcB15GxelfrY9F4ptEE5VZ7kqfovPz6SAuSq0gIe67tlKzm4cO927I5l5b0llOk68zOThGQUAdDWKvlJuvfH+5gtZ4pXeroQdqwx12R2TdpmhnZFBo2YepwOLlZgrfov8eor6k9WrxkXV6rNI8QWPhyYXBxVcR8VfDe7poyLpyahFZEBcSxi46s93L96eZkBucawOAFwF2K+TClv0Cf9dqDwWbTEu9uaq2Is0T3TiLtNlwGrdZxwX2DDU+TcFlIe156IXY4iltpb3nZr46TOLMXD5UEd3xXqoXfwmDf8RWSKwrEklXgFjK3gIcR32nWtH6WbqdMTYAlSU4blg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(107886003)(83380400001)(2616005)(38100700002)(41300700001)(6486002)(6666004)(31686004)(26005)(6506007)(53546011)(6512007)(186003)(478600001)(110136005)(54906003)(66556008)(66476007)(66946007)(4326008)(82960400001)(316002)(8676002)(8936002)(5660300002)(2906002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnhOZWlSZDJkRDdXMmtDYVZiK0k3SHU2T3dkUGFkcW1nMm9seCs4cFQzd0xj?=
 =?utf-8?B?WklSUG8yOE03Q01WeUdhUGZmV0QyVmdzM0ZKUC9kUDIyeE9iZkxvc3FzZjJR?=
 =?utf-8?B?OWpuZ3VFOVp5YytLMWxQWjQreFJ4K2hqWGZBcTdsalZ4OWVjMndySk9Ib2Iw?=
 =?utf-8?B?UVk5UFNXZ0pqcDdNaXE5Q1R4Um1zNDhnc2huNGpDSWFTQis3eGY1QXFqVTJB?=
 =?utf-8?B?VHdmTGdWczFxVUxDWldHSXRqbG9oekk1QVR6TjhnOHJIYTBLVE0wRWdXQXdh?=
 =?utf-8?B?VVh2clJTWEtKMmtzTElJaVQvb3N3VEZWZHZSNStMS1B5SXRvWXcwRzdBYW5H?=
 =?utf-8?B?bHlIU0xmRVhtZzNmaWdWWTZMUTMyREZvVXZiY3gvSmUyRzB4WlNlMTZ0VFJs?=
 =?utf-8?B?Z1BpZGVuTFVYdkVPL3Ivb25CNGQ5RUo1MFVtVUt6MFpvVjlOT0tkci9ZYitD?=
 =?utf-8?B?cWV0MlgwUE9mUHRiVTNnZlNnVXRqbXZtaC9tT0hDZCt2ZUIzUzc1elNLVzhH?=
 =?utf-8?B?d0ZHMGxDUkJURTNVUjZNV3J3RU9TRFVNakFkallLZXk1V3JRSHJyLzRMVzJk?=
 =?utf-8?B?emFBV0FGei9UNStub2FzdFNxZGJMbDhUcmg3SHpWdklBc0xZSGxodDJlaVU1?=
 =?utf-8?B?Y0c5K0xBQlVrdXhQVG9BdVFMcURCaWVnYUpuQU5oSmlWNVppakhxdURhUFAw?=
 =?utf-8?B?cTk4eVQ3NWtoYnAvZm1naDVaeHZKOXFiL3FXZ29vRkszd3lQYW9DSEpCTHVj?=
 =?utf-8?B?UjZqcGVYWWFlWnlvSTc4TnhoSGRQU0dUbDhpOFlwSTRrd1duWkNHWjZJTno3?=
 =?utf-8?B?V3FLbU5YQ0l0QmJhRUlQQy9sT0FxWGtMRGI4WERtR2hhYk9KOVBtaUZOMnhx?=
 =?utf-8?B?NDlkRCthV1lUcGdpcUNCaGphS1JjbVRIMWs5aDRpUW1LRVBWaFcxN3dnZG1I?=
 =?utf-8?B?RTBpSlpqNGV0dzJtMC9nanRoUys0Z1dFTmlxRWZZeCtoTVB2cmtrbitCTUNE?=
 =?utf-8?B?dUUxWUZwSHRPWXNraFUvZThVMXc2NUt0WE80ZFhXL3lkczhoOUU1NTVCZk9p?=
 =?utf-8?B?V0lScHpvUnVSSXVPSjZITjdTWVFvNW1QUHdxK29ra0Jvc2REaDJVZTFWbWor?=
 =?utf-8?B?SXBzN1JMcnZJY3RMYmlTYU5aTW8vd01lMytaLzBOdmtmMC9VbkMxTllabHhV?=
 =?utf-8?B?YkRKSEdQSEE3dXRBaFNUL3dlVm1Pdy9UcS9GUmVOalJsZC9aSDRxM2k0aERT?=
 =?utf-8?B?aWRmRjJuVXQ4OEU0eE44dFlpQUpZemNERGdtRDNQOGNXTXMrOGl2NDBDeU41?=
 =?utf-8?B?T3hXclcxK1FWVGs5NEcyN0xlbW1uN3VkMTFqdERFc1NVY0k0NU1tazRNRlFL?=
 =?utf-8?B?cU9sZkE1N0hjUTRMK3NhRVJURktnMit2TUUwYlg3djE4dGNFVWtaWHJ5bUM0?=
 =?utf-8?B?VXlGVWFESWVNZ01rYktrVUR3eEpuNk9YVWRGMGMvbmJBdjdXOTlnUlVmY3JX?=
 =?utf-8?B?U2I1QnNyQ1ZEaDh0WWY2cEVxdzBDUFN6eGNRSTNuc21UY29IZm8wU2cvQjRL?=
 =?utf-8?B?WkRwa2htNUR4M3g1cWg1OFE2NGpRTWtZZ3Vxd3N4UWRFc3BFV0VOc2pKMjl3?=
 =?utf-8?B?N0VtR2ZaYkFFYTJwTnJUZzJKK0JaVXR1N24zdm5nd3RidGx1Tng5TkFnckhM?=
 =?utf-8?B?RXdSTngwaHhSSCtvYXJwZUpWVmR4Q1hmMW9BY084dTZnUEd2YzMvUUdWb2NT?=
 =?utf-8?B?YjRXaVU4L3MvN29lekFBOGNSZWxpWGZ1MmQ0SXh0STBvdjhZVkdHUzFRVFN0?=
 =?utf-8?B?ejdRbFNkdnhVcUdJdThOSnZ0TWNWWjQrUTh4aWg3a2V5ejZvbHQ2bU1hMDNW?=
 =?utf-8?B?WkhLVjUwdkNsK0x1SDBQcGMzV0pIY3hvZFdpektwVHIzWEJFSWJVZ3QzSUYx?=
 =?utf-8?B?Rjh1eUNtNjJuTWtKc0ZvY1IrY1hLalJDQXJnNHFvbFJaOVJmeFZYMFBkdGJ1?=
 =?utf-8?B?azhkaEJ2OEQ0bEgwVWNIaG14N0dzUDI4NjdvOCs3Q2U4eWhycXhrQXlSVllD?=
 =?utf-8?B?VlNBdWMrTGlCMk5IVTJ0L0RWcXcxbjBnTElrK0F6YkVCVWk5OU5iYXk4cFA2?=
 =?utf-8?B?L0lmSC9qdXNvajk1Y3JBajU5ZHBzZzhPbDBrdXNJUFovQUphS3dOR0RZTk9w?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aVnjuntP5HUJ5umdJKIUSjQuQVoS1jYhzYPzlkPGgIMW2zlAAeOhihqoIO1KuxdvbqvGGccts9PFTO79QIXUNgzteWBhNbjS37K5Wp04nqLFBRuS+HIi2trVrSIPtCT0E0UjYgDtUFUzeFDow0VwtfaWAnRlbmwY41D2kPKoThsXZvtdd32Rfl06ZJLq/QeuLvqgZAfPocS9PktD1dQdZ5zyk/gtAtUgQv+RJB8a6dI8yQj5yKRSdNTyGj2EGChlr5G66IlH9ulCAA8OKSC/EAyef+XZuYmvCiKuqp5fAAnF1357LPrE04CXPD2I1Pvv+BaIgEz7IydtfnVvrlcv3wLKzAykCxHq3gaheEO/8uUTak8F7RZqFl/3nqeYdMcNsVNCG+QR4CEW2N2BYSLrdjohFn789pp38xYKbHwCK/DJdZs8fHzKQWtD/8OpGnh9J52Cio5sv3NCMSJe2Yqd36Ag6GirObWlG2/LKKYF2J8+8+S8wPFDDFVzYWAzKOCCt1slTQCldbR5vV0y7Bx8E3cwshG5mij3JPG0jkLjvgEdeMRfp9Qd0XEYxoyFPViY/vTooGEHbMi9AIX2MB+Kx0cfSKqOroUs7e+b5jFWZwDVs4mDejI4/LVijLrW+Ektu4dT0LpduXgq3O9kPcgfzE4dn/0h/L+ZcYyxBeHg2JsLAieew+nQan2ToeioDpLzIbgIB9AcRDpqkk3cZW+FJMlv9Hf5ZH6tSh3r06Hkqhsegjy4mKRnPaHItLG+VL6JYjac8hqg7WQGyWW0MpO+3J3nsSYS+uNFEV1WE/b7pT4epEQDvZNb5vdEzaw+72sZBgnQQR8UMUMv1jFWXI7l0oEGM9rVZ4zh7biZ6/RWE3c=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be414ac7-a7ea-4b87-1c6b-08db613366ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 17:29:20.4437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nPQ2KGIoNFTiKmcA+ikUdoa3IhNjcH0FN7w5J/DEmVJrqWtwUox/jERMMUfNyEQRW+KSndPBCft7H/31wxv2+0zNXksuVgGufpp0TOdTUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5656

On 30/05/2023 2:58 pm, Alejandro Vallejo wrote:
> This is an AMD feature to reduce the IBRS handling overhead. Once enabled,
> processes running at CPL=0 are automatically IBRS-protected even if
> SPEC_CTRL.IBRS is not set. Furthermore, the RAS/RSB is cleared on VMEXIT.
>
> The feature is exposed in CPUID and toggled in EFER.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, but...

> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 777041425e..3ac144100e 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
>  XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
> +XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*   HW can handle IBRS on its own */

... I've changed this on commit to just "Automatic IBRS".  The behaviour
is more far complicated than this, and anyone who wants to know needs to
read the manual extra carefully.

For one, there's a behaviour which depends on whether SEV-SNP was
enabled in firmware...

~Andrew

