Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BD7B1821
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609441.948555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlo3U-0003Gm-PJ; Thu, 28 Sep 2023 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609441.948555; Thu, 28 Sep 2023 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlo3U-0003Dz-Ld; Thu, 28 Sep 2023 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 609441;
 Thu, 28 Sep 2023 10:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlo3S-0003Dp-Od
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:15:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ac46a6-5de7-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 12:15:33 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 06:15:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6202.namprd03.prod.outlook.com (2603:10b6:408:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.35; Thu, 28 Sep
 2023 10:15:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 10:15:27 +0000
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
X-Inumbo-ID: f4ac46a6-5de7-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695896133;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3JqlKKRkRzwQYWRaskagJZrOmAm1mnCTpra2w0CtNuY=;
  b=CXyh3LffqvxQzQMqAF+a7PVM4+Z4k2QtsKvWmnvOymVz8FuWgVjh9h7j
   e2pQDdBJs1PSmeKq6gptNTIAfU6LHhH4nrfTSBq6zfBHF1j25kPcH/sP4
   kX+svopXVCsEdANVw+uF9PhBaXTxyd8dbgfNSlg5p6rjQkW72PHOxOYN3
   8=;
X-CSE-ConnectionGUID: s4PbHL9qSLaKeaQV4z2Q3Q==
X-CSE-MsgGUID: eilT+yp0R+G1ZjheNqJbKQ==
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 124471991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8Hi82aCkXG6wxhVW/8ziw5YqxClBgxIJ4kV8jS/XYbTApDIr1WcCx
 mEbWWCDP/+CMTP2fItyO4/npxwGup6BydJiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4bpPC0Fqp
 OUjDDkuYxm6ub6kmovgc7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC7w2baezHqTtIQ6Gby8yr17mAWphUNKOh8WWH2ig/OasxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 FiisCE7jq47kc0P2qO07F3DxTmro/D0ohUd4wzWWieu6Vp/bYv8PoiwswGEtbBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:HmS5JKAxrT+kc1vlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:YjH6Km+2Xs21yEX1OXKVv1VIIsoFVizE91PZAEKxMFg1WuesEmbFrQ==
X-Talos-MUID: 9a23:djLT4QuC9rWzOwERr82niTBmCIR5+/yUS29Uo5cGtu+dFyZTAmLI
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124471991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNFBeb4liRa4uBU2tKTPh2NEhCbFqcjfAvWvxpnMjWwXDDk+C6ytWIjDK+cT8VQrFrl9b7sV89F7ZXx1U/yvkNZgqGA2ThKR930ysIcGEfw6Pis2H6rCa5bcx72OcIJ3wl5fE9v79PAwXmBYDpc7zXaaZbzKaUuv9VLbVfrnnTprPwXNKA4PdImt2yfeXaMZ7bYwR34M4ujQBK3wxUMOTC2ye9dlNj+MEC+H/piMW5kzajHq4ZKMz4lWOUpilh7umpdUbhcmNPdj6CmLGC9es56BZeMmn9HXJ2WcVcmhDhfUCJzeGkkU/9UcmZXPUhrM+YkJu6YuYHQvlRAfIh1I7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nH2Art6T4/MCklXzOTcMhEpuiaF1SYFMn0ATROEjgk=;
 b=BelfnvAKAxlD9IvqLFJUoDKgmHsdT+2uNbL0b8cLOIpSCYDE3ZIX9JzDKYrCelidLEwuK4LPpaoVUiJrY9F/WV24p0CfydpX5+K+dHkUzyTfWIbxEqi6+s+njyVYXq9U8/rikLoFiHP6X09SqwQsyvYQKtLOti3fLDh1zaRywDBeh2WzJno/uoRHoPMkmo5aTpmyumKrv0H4vf641iwGNS2kqOi3sNgcvWXtDStccN+WS3yIElEWVFH0/ymbq+LO2VBs17AMgZM0P46iDRrGiGc5UReEl7Ix/wxCpEmW+3kmUs3ep5K/RKMhtny46Q9PU7+NzYomeFBxJOk+lo9uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nH2Art6T4/MCklXzOTcMhEpuiaF1SYFMn0ATROEjgk=;
 b=waZEUQ0f5KcfdBrPZfE91D6R+GNDwhtUPH3okbURbIa8jjzlFSosI8sBiteXFliQmjhYHJxk5crkVjLVQCnVqGbaQR8+4gdj0fFUhPtegmP6Zh3BM/9EgRii7Q5usEymeTrB7JIVQSOQZVK97TpLsjO7JlRdzFLj+imbtg+eTJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 12:15:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 8/8] common: convert vCPU info area registration
Message-ID: <ZRVSOi-nPTagCWq9@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
 <ZRU4QQcFL5Le5cFz@MacBookPdeRoger>
 <c82494b6-d6c9-8252-4eac-5c50fdf7e477@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82494b6-d6c9-8252-4eac-5c50fdf7e477@suse.com>
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 835fba6b-aaf0-4881-1fc9-08dbc00bd63c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHwaM1QvfRqjNP8Kk2P0uiXkEcamaAamMRMOLAlHCZ8zP5JEk5g7kOvI2gjvfZ2p+EGWnOmmPK6cfCOelex+N5t6FDSfEVlnTUrR68G0gN6WmY/A7LGkE9vBh6uhshHRBhLEQiEHRcJJqgq/YAxqSUk8xkYYrbNSW7jT0b9sDOfrr0Bb0dQaXHnkxOpJr+V5sXFrd1uQD6boUZl2wTrnUqIw9L74iDFmb76vYoKW/I21c0D70TRJKdz/QFtoyO0QQzufl6Sqs/mqTdtuw8SuLH7AxVbWZ/mpy6mUEpnPoCDJDPWhWoN6+MV8hlZmJKemmgU3smJAdZt25hL3gZR5aAtYVJ9w1bBrvKyoZpqKC3IiTIh8IsYoozirZy7AL1WGLSLQu1hIIbK14R3xi82oTPhXDlw9CysNSRqGSF32PQ6vqK0seJLHPx8Y9CoHgxLp6WDASmJi/6rgxrwxbpu2392IpL5I5f0yKIlnwW/IrRTipnoCNyxQhgSJtldJQFOBT5LgDvePXX87XDbCFF8G520CX3Fm5GYNmIkiCxjKsrq94qDzw4Y1PPLn2llU1EO6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(66556008)(66476007)(6916009)(316002)(66946007)(54906003)(478600001)(38100700002)(6666004)(6486002)(2906002)(33716001)(85182001)(86362001)(41300700001)(4326008)(8676002)(8936002)(5660300002)(26005)(83380400001)(6506007)(53546011)(82960400001)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXBiQVRRc1kybE0xUU1QUG5BaENqUFNKU1NVOUU1NGhoS2YxenBUbEhPQW1r?=
 =?utf-8?B?TWk5bGF6VWpOY2M1Y1JFZmM4am50a21CWHJTOFZhZG9xZ1lpQzM0c3ZkV3Nz?=
 =?utf-8?B?WEhpY244TVFZZU1ISHE3NTRYK1hwUzVIWDE5VjlScjAxVVIxTGV0bndDMzBQ?=
 =?utf-8?B?LzlhSmphSk43K1dPMmJMSTdxSGovQndFeU5RdThGRWQrc3N5ME83ejFWM0lS?=
 =?utf-8?B?cXFrNjVGdWJVMUltNTM5Y1FKcHJvMWtRVTA5S2pzTzBhVnJQbThjb3VhdTJr?=
 =?utf-8?B?c3Y2NWZkUlBVSUNEbjNaTC9yVGVQTXh2MlFpUjhSZ0dNaHhuV0M0V0dsVElU?=
 =?utf-8?B?S2dkU3pkZFJEZGN6cTVZMUhUdEI4Z1ZsQmkzU0hrZVFwYitGWnE5ZW16NkU1?=
 =?utf-8?B?ZW8yVHZ1ZTJsbmk1MEpmbldwTUxLNFF1UGQyZUo3cFdFZG1GYXF5THIwZ3Vw?=
 =?utf-8?B?dUp1V1ZKbGhwQVJpenp4aC9hZlEwTnZ0OWlybmd0WFdDM0M1WVRDK3VEN3Nx?=
 =?utf-8?B?L0U3eEZWT1lCUDdXS2tqMUt6L0x1ZGhOZXNIVG1UVU96T0F6dXNqMmVRL2N5?=
 =?utf-8?B?c2F4ODJzSzlOUnN1dVFqUWZhODByWU5KdmlIMjM3QXFmci9nVEJBMVRLVWQv?=
 =?utf-8?B?OGtSRS96STg0Z0dQK3lNQlV5QWtwUTRSMnUrTkl1VlJJTVdXRVpNTXhqc2JK?=
 =?utf-8?B?T2dFZFhYTFMwQkZQZUJMSEJjb3FJaVg2c2owMzJaN2cwem1NRFl1bGpiOExv?=
 =?utf-8?B?RU85RTdZK2RiVUJTd1c5RWFYSTN3WkJMQUJNdVRnMjlHdkRQKy9SdlMwR2FE?=
 =?utf-8?B?a1Rxd0dCVWk3TThkNTgxZnZaQlV3MnRIRmoyOGo2RDFoc25rZGU2cFpSZXFz?=
 =?utf-8?B?UnJSbUZKN05YYkNCbnBaUXFWd3A5ZFhoYU1tSFRrNHMwaGZwTTNwcnBCNllw?=
 =?utf-8?B?TGMwVlhGaHdUOXhybXJIbkVlN2lJQWdvVzhXbjJlTTdRaU1XZXdqMlppYnRV?=
 =?utf-8?B?N1cvUFRJckFnMDBreWFOQkVBa1hTbDdQTDB4dUlCcjB2RGNOMi84L0s0K0Z5?=
 =?utf-8?B?OVhYVm1DMUpNaFRzaVQyTXg0KzJKSWVHU1BIS1ArWXZrM05ERDVuV0FnKzZ2?=
 =?utf-8?B?Y3lNdS85bXBWSHRHV3piQ21yNGMvR2hrWVdpb3VicDJ2b2VoZGRhdThHYVFO?=
 =?utf-8?B?TW1yVUJ1VERoR08vZ3lBZ1BzeEdKOFBpakxwOHJWY0IyM0MvdFVpMmhudDA4?=
 =?utf-8?B?Rm5aeENHQ0hmOUJEZ1VVVTlOZUwrZy9mYXR0YzJHQXFHMjVZbFFIWXY2dkNG?=
 =?utf-8?B?TjFSYkhDNmVkcWREd1ZGai9xWUFoUG1YdHZYZWpjdnJIK2RMcGFzRHM1ZUVZ?=
 =?utf-8?B?dzhDeGJ2TDV6aU9icWdBaUIxWC81NmdkbEZZenc0VC9aU3R2bkFPL1FTMU9T?=
 =?utf-8?B?RVFmSjA2dUVhdU9hMlhnTmxiMjh0UHo2ck0xQ0QxOWgyTGZJZjUyd1dtZnRn?=
 =?utf-8?B?aUxLc2UzajN2ZzJvdUZlZk9vSndIbnkzQU1YRDlPTElQNmZpU3RjRFZ3dU5J?=
 =?utf-8?B?aDVtMnBaM241ek9RdkMybzRoSWoxUjBLYjZwdFV2UWJlbmZJclNuR3dXc2Rq?=
 =?utf-8?B?U25DbzRPZVdZUVczMEtpcHhuS2E0K1QzNlE0YnpUa3RMT2ZHc21qUW1YeS9z?=
 =?utf-8?B?MzVkYS8zeFZXVVpNbjNJNjNPdVhlYnI4eTN0bW1COGY1ZndKTEFZV0ZlSlU5?=
 =?utf-8?B?dnBoY0lXUDNxQlo2VWh1elBISmkrMnlnZ1BSdEhtNlVVTXhIMjNNZGFLNFN5?=
 =?utf-8?B?ZlZoeEdwZGFERFN3OHMvQXFGQmlMZlcxM2JBTUdqUitJT1g2aHNmMVlGTGZU?=
 =?utf-8?B?V01FdzhZMllhQUkvTVlPSXRhekZTRUdOVmlibmw2TzdCVElxS3BjemMvS2l1?=
 =?utf-8?B?K1pLVVd2Q3k4RkxGQllrSWFKeDNocEhFT3p6bVhqd1NTN2R3M2NDL3BpbWJj?=
 =?utf-8?B?Nm5TQ1IwTEgxdXBCRVVEUkxtTjBkcTNNdUIwVEJ5ZHNWbkVuOUhOZVlpdzFK?=
 =?utf-8?B?ckdkYzhlMkJ6Uk1rcDdkSUtjOXQwQ1lQbk10aUl5bDF0ajVoU2hlLzlhNWpy?=
 =?utf-8?B?THNlbUlsT2FteVpMTGhjZEFMNWJwU2Jwem4vKzVzN0l6ZDZ1a1MwVzh0T0Z4?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YnQixJbroNPbknXwFR7IrRrGNhfuICz/7ZMX+zsOdZorjf5UfFO3X5wOzMcbJFc3xONdOt69b2K1nyNGScUAbNfkl0+ofw/0Gm2Xn4e5a68BC/V0zm27lSPMj15PXSMcjlW+fblWIg5O4TIFD8kRSd1V+4eukJ7wbpqLw2eua8OsBKz8sCJbPIq9Q/mTaicpUEHX6lrvbgkggP/UHFpoMmhdpf6V9y8jl2F0i5BgDxsLf1r/aDZXVSBfFjYd81ftVbD9h/w1EzdJH45g659qKcE6Lz6rcLC6ZXOzIbMqxTvxp837fToV3SE/n7y8k3xbfTs3/6v80h8sB27mZ0mW4k5m13kgVUuz+hjz8R+69vYDHgqg7WKIfGZe6ra5YrVTtWKgzToZZjWFV+o23ZJVM2CpM0HCxduOxR19EMHtFMeXHjZ2i0jLex+DiGBjcweq9IYPjlX+nnL213C1AEejpBUhulLTGxcgNdsWivydW0jBI3IajpRVDKZnVwawF/DEfNSMpfVBogsK3MpBFdcowZX+FhF+0kDPfZ/USE0CPexUg1kybx0rUcMZ7OVXbRM6CGkjsiVTocWd1gs+fC9G/NWPPh6XMKMorpfF/r4zwcGkWWONAQ11VLnyGBpapmmLC0BoU8vMrFMhMnEhRcbWQLtR1e5WzgTMyX218MryXgzb5GJwWYIAh6907OsEvbC3HDZTwqhnqut+2AmtsRaf+2ste+p0pDpdPM/ZjQ1x6RGtglmHa7T8M/KO8RA2Jj1tENxp5fJiQCA1QZu01mIrima/3CLHkAunsAvspZsv+RL3CJOonwfgWA0KCilMxT3YOuOLmPe1qGBuSvJvOR4mcYjQAdOIJNMJ62iN/0X+ijKIll8esDqZdYc2CcFh9kVUuh5wxd4lTg/vaHpNqjcUpg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835fba6b-aaf0-4881-1fc9-08dbc00bd63c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:15:27.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WGYjLdThjkrdcjODbkHzxCNyerqk5kbrdxMtRZ4j4QkUZl877jsiJu7i8hfIpooh9itVs5sKS0cs6bbVcMdJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6202

On Thu, Sep 28, 2023 at 11:53:36AM +0200, Jan Beulich wrote:
> On 28.09.2023 10:24, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 05:58:30PM +0200, Jan Beulich wrote:
> >> Switch to using map_guest_area(). Noteworthy differences from
> >> map_vcpu_info():
> >> - remote vCPU-s are paused rather than checked for being down (which in
> >>   principle can change right after the check),
> >> - the domain lock is taken for a much smaller region,
> >> - the error code for an attempt to re-register the area is now -EBUSY,
> >> - we could in principle permit de-registration when no area was
> >>   previously registered (which would permit "probing", if necessary for
> >>   anything).
> >>
> >> Note that this eliminates a bug in copy_vcpu_settings(): The function
> >> did allocate a new page regardless of the GFN already having a mapping,
> >> thus in particular breaking the case of two vCPU-s having their info
> >> areas on the same page.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Some minor comments below:
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
> >>  {
> >>      struct domain *d = v->domain;
> > 
> > d could likely be made const?
> 
> Probably, but this is just context here.
> 
> >> @@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
> >>  
> >>      domain_lock(d);
> >>  
> >> -    if ( map )
> >> -        populate(map, v);
> >> +    /* No re-registration of the vCPU info area. */
> >> +    if ( area != &v->vcpu_info_area || !area->pg )
> > 
> > It would be nice if this check could be done earlier, as to avoid
> > having to fetch and map the page just to discard it.  That would
> > however require taking the domain lock earlier.
> 
> In order to kind of balance the conflicting goals, there is an unlocked
> early check in the caller. See also the related RFC remark; I might
> interpret your remark as "yes, keep the early check".

Oh, yes, do keep the check.

> >> +    {
> >> +        if ( map )
> >> +            populate(map, v);
> >>  
> >> -    SWAP(area->pg, pg);
> >> -    SWAP(area->map, map);
> >> +        SWAP(area->pg, pg);
> >> +        SWAP(area->map, map);
> >> +    }
> >> +    else
> >> +        rc = -EBUSY;
> >>  
> >>      domain_unlock(d);
> >>  
> >> +    /* Set pending flags /after/ new vcpu_info pointer was set. */
> >> +    if ( area == &v->vcpu_info_area && !rc )
> >> +    {
> >> +        /*
> >> +         * Mark everything as being pending just to make sure nothing gets
> >> +         * lost.  The domain will get a spurious event, but it can cope.
> >> +         */
> >> +#ifdef CONFIG_COMPAT
> >> +        if ( !has_32bit_shinfo(d) )
> >> +        {
> >> +            vcpu_info_t *info = area->map;
> >> +
> >> +            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
> >> +            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
> >> +            write_atomic(&info->native.evtchn_pending_sel, ~0);
> >> +        }
> >> +        else
> >> +#endif
> >> +            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
> > 
> > Can't the setting of evtchn_pending_sel be done in
> > vcpu_info_populate()?
> 
> No, see the comment ahead of the outer if(). populate() needs calling
> ahead of updating the pointer.

I'm afraid I don't obviously see why evtchn_pending_sel can't be set
before v->vcpu_info is updated.  It will end up being ~0 anyway,
regardless of the order of operations, and we do force an event
channel injection.  There's something I'm clearly missing.

vcpu_mark_events_pending() and force_update_vcpu_system_time()
obviously cannot be moved to the populate hook.

> >> @@ -1801,6 +1729,27 @@ bool update_runstate_area(struct vcpu *v
> >>      return rc;
> >>  }
> >>  
> >> +/*
> >> + * This makes sure that the vcpu_info is always pointing at a valid piece of
> >> + * memory, and it sets a pending event to make sure that a pending event
> >> + * doesn't get missed.
> >> + */
> >> +static void cf_check
> >> +vcpu_info_populate(void *map, struct vcpu *v)
> >> +{
> >> +    vcpu_info_t *info = map;
> >> +
> >> +    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
> >> +    {
> >> +        memset(info, 0, sizeof(*info));
> >> +#ifdef XEN_HAVE_PV_UPCALL_MASK
> >> +        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
> >> +#endif
> > 
> > I'm not sure about the point of those guards, this will always be 1,
> > as we always build the hypervisor with the headers in xen/public?
> 
> That's the case on x86, but this is common code, and hence the build would
> break on other architectures if the guard wasn't there.

Ah, I see, sorry for the noise.

Thanks, Roger.

