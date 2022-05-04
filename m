Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60E519CD1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 12:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320556.541345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmC7h-0006ji-Eh; Wed, 04 May 2022 10:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320556.541345; Wed, 04 May 2022 10:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmC7h-0006ht-B4; Wed, 04 May 2022 10:20:45 +0000
Received: by outflank-mailman (input) for mailman id 320556;
 Wed, 04 May 2022 10:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmC7f-0006hn-M6
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 10:20:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d89ee895-cb93-11ec-a406-831a346695d4;
 Wed, 04 May 2022 12:20:41 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 06:20:38 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4771.namprd03.prod.outlook.com (2603:10b6:408:99::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 10:20:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 10:20:36 +0000
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
X-Inumbo-ID: d89ee895-cb93-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651659641;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/usFWNuzcG3Q3EFBNOYA70Fulok3nugZlFrUxEbvFmM=;
  b=gC0DZU3sS+dBFV7WELRftaa2KgY9ewf3V3sx2W72+yAVfB5WwV8XAK1p
   KWAt3hkGWfm96rudKji0yTp2RTDfylO3UGOBpCmEycxr56UvuEIAapDXY
   gMOak3ckD/G44FmNusTGWN0CAeVWIwpbhah1fgkBuA9r+mPRtn64EOzeT
   g=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 70948050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HNEu8aKwHFL6yVLAFE+Rp5QlxSXFcZb7ZxGr2PjKsXjdYENS12cAy
 mcfC27VaPuKNGT8fdBxao6/8RgBvZ/VxoVmQVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Y02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M8dsLOcRgEjB4OSqP4xVzxjFQRHZ6ITrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2TjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGuL20A9Qr9Sawf6Df3wTJs1pzRMoDHUOLVYcBSoUeAn
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwKyL5Q+cXzAAVmQYMIVgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:L2UI+asChOn4jHNSSUhQ+Ptw7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,197,1647316800"; 
   d="scan'208";a="70948050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbBdCRg5mOYGqtST/69syEgcgP7QTcB6DAZTKBgewT+LSbsq3FREhz7dMhThcoo38u5U9bZ65vrN5RFqiOQYpILADsrcMmMc6LCRJrdoCAL2kSTJvANAjYzCbxQ0yEpwDwTtZVPQ3ACv9nt8oALnMaX++BtWRRklR3ZlJgsT7fVUuWrQ0ag4nTPSkJ14nqYV7XF2QtLb70ZLbhlvzJ5Z3Rvyl6nEJAfYhc8zkxA9DVVe+WZTNLRQlt1R3q2PfHs6BxLgbcv+wnMrW0DPxXmzkrkl4Iv4AnnvIokWirQwoPkbS0UIuk3KKKH/3dgVjCZyv5vF1FY+K1gFd6yt+3/Mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E5FA7lAZfXSsb7r4k/bPtnZb2F5xM7Rg4DOMiVNIW8=;
 b=Aw3fx4s1dG8KhrF3DY8IzbC/UJOf5xAOlJZjfaa8wbRmb6B0CYsObBxC07K4OcEkUUvYVq02//MDrshTME7Ud/SIM74QceaCQ1kgVKd9Q0gv2Vxi12yT8VdTH9I5Prx/O+K7SKRbsjcx38dX2mbbkNRAPA3aAKyrRR0xTIlN9XqhrYdFsBBC570ik4oLyfPPdP9WZDovaqoH+XcnjZf8r3I4ktnmAwC12fIPe2T5WSJ4e99BgNDVdd/g6bVmTUNfkCoFOsxjsmARB578aBcwN7l2u7HFnMrdVnbyfT/rQc6PAKJfFhtADMeOzvEZ/6gAnATbsmvbo3qdtJQGBL9aDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E5FA7lAZfXSsb7r4k/bPtnZb2F5xM7Rg4DOMiVNIW8=;
 b=fqympcUPKdMU+ksQR3vi49qEAIQItagulNn3PAvBc6sCjjXmON2wW/4VlcVB8e1p6xIj4JqHYu7OQrovx7fupT17EPMcPE+EZqHOe75/LLdluG9/wtY3EL/wGeTmWpJfgkBWPg9LRxingTrCqPJXRQbKiB+tYfxX6QZ6JZU23RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 12:20:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 04/21] IOMMU: have iommu_{,un}map() split requests
 into largest possible chunks
Message-ID: <YnJTblr01m/h6cNZ@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <227d0bd1-c448-6024-7b98-220271d9bf63@suse.com>
 <YnEiJKezb9X4X3Dg@Air-de-Roger>
 <03cf64c4-8ca8-3e13-a4d0-e8da9f309b38@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03cf64c4-8ca8-3e13-a4d0-e8da9f309b38@suse.com>
X-ClientProxiedBy: MRXP264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc8fd44-4271-44e4-57fa-08da2db7badf
X-MS-TrafficTypeDiagnostic: BN8PR03MB4771:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB47712075A8F6C9EC29855A8A8FC39@BN8PR03MB4771.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9xhrl8zTbHaVgPcKI+1Jdu6LvZrP3CseSReEDnVaSfFtmVtO45nkc9CD7wV1HZVi6digCbkJFjjIJ/dj7oZOaPIOCGCZ4FuhV80P9bIzd2jecENn/+BnTBJjdfhAre113tFEJoD/FuhaF5uuOz355mOWp5g/+nAbqCURzSTZSvq8mb/c/VBj6qXGVUeLzgdQ05KK+nUivhdSCURip3jT3sAhZbrTLhVuAQAQPHkeW2tMOafRF4XXzT2yc5kc4nZTU5W/lhWHuysHliePpGyzFffWTZnvb9mmFub9pmk2uH4eltX50m+qK8uhGhCMt1mJAEaz9EKY2Jiww0sW99015k5wqRRIg56xa3gCI/CtKO2QuM2+xEia51NKXO3uvtST+sVkiGEj0csqdt+tZMMU5jtcd44cPMjhoYEJLqXlxiYUI7GxACgmBnBsuMJm6gAV3wjdOfqb1VZDCofZjx/ZV45xdJAxzybqtcZEvQsU6CG+V7kC6eXtjj1xEIdGhzLx278wpQE5RVVU7EP6jB3cGJhFucEk0K4DFUJvz9SW9FEFzRBne4gB44E5ecSp/H+dhiuYqq4jPRkskR4CatH0DfU3z1VGqYBh4a6tdlU1t04DxP65U9dpvuNojkvoFj7trwS1xg6wwEkswJxBdu9ghw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(9686003)(6506007)(83380400001)(38100700002)(26005)(53546011)(82960400001)(316002)(86362001)(5660300002)(186003)(8936002)(85182001)(33716001)(4326008)(6666004)(8676002)(6916009)(66946007)(54906003)(66556008)(2906002)(66476007)(508600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm11RjFpemx4WC9uZXFwbHcyQ1I4Zk43NXp6S0xlcXZyV0R5RmN3d0doOG9v?=
 =?utf-8?B?UFI2MTkvVW5SUUJ6ekFVN0ZVcjFuNjlOK09DTThodUJxRC9Hb2p6NUpBbzdU?=
 =?utf-8?B?eHpZeFQ0TGNGNVRESVI2bE95SmE5K0FEeWJTRG44Y0tIV2NhZDFmVzMxZGdH?=
 =?utf-8?B?VzVabXlkMFp4MVVITGdhd2cvUjR2RWo0MlBxckx4eWhkWU5rNXZ1UDFYeWla?=
 =?utf-8?B?VmNMNmdpeml2WmIyZjFkM2lZRTgxNjNWSWxjTGU2TW5VTmNpMmdoUzhUN2lQ?=
 =?utf-8?B?WnBWVzNFd0U4MGZSS0lSbmRrMmR0RWJsbkE0WmV4ZDQyRlRPZUxLVDQ0NVAz?=
 =?utf-8?B?dllWTUdyK1hWa1orNDJvbDd3NGVERlYvQzRGdEVLdU0wR2tnT0tKZDRyY1gz?=
 =?utf-8?B?bFhvQXRJeW4zTTMwUlU5bzdOeXpNVFdiZTByVStCSiszS2p1a2pSNjFIZ0Fr?=
 =?utf-8?B?bWRMdDc4dzdhaDNsbmptMkVIT05sMHBCUk9vUkJiMWJIdlZhZGZGa2hXejRz?=
 =?utf-8?B?MEZmZ01IaVVrR1ozY3RrSUdXQzJKQ3FnME5RVTZBRzVtWU05M0tJYitHdDhI?=
 =?utf-8?B?c1FsazVwY0o5SGRxRUZrVk9vUWlCVHVURVVJSjNWQlhHREY5UzRyV1RueTZH?=
 =?utf-8?B?T2E3c0tXbHhFYnE0ekpoNk9NQitOU1crRmJ0MUkrNnNiTXFYa25PcVRwUFZ0?=
 =?utf-8?B?RjFGZWdzdDZ1Z040ZnFvdWxJV0ZMVEJQeU5LK3JyZTBBdHp2RHRCK09obU9P?=
 =?utf-8?B?KzFtdnBMbnNlYzU1SEYrZ0Z1V1VwbHJqTXJYLzNnVjRVMlZtT0NFbW9MVlhk?=
 =?utf-8?B?cXBjOUczclZJb21Sd2VQTEZpSjg3NWtYdGlaNFhHWlJRbUg1emI4VGZnbGRN?=
 =?utf-8?B?VVNubXJkclVGcGpIcnBYY2w5MTVTSWtRRFVVRlpyek4vS2V4am5WTk9KU21Z?=
 =?utf-8?B?eEZRKzlTdHN0NXpQeDdpY0dwYngvZ0k2TlVEbGpvS3dQdmFOYnFJaVdKTjJq?=
 =?utf-8?B?T3Y1UHM0aFZodXlvSWxWZGRvR0ErRFNyYTd1QkJkTXllNDhTTFpJN3RpSmkv?=
 =?utf-8?B?NjVmbkhLaFBRWUN3VDFaLzVibXNsajhFdVhSY2ZOK0hHS0U4QkQrVFNZRnp6?=
 =?utf-8?B?elJqYlhjc0Rwa01VOWlFazVPMm9LeEFzTmxWSDllamxoVjlOdnVkZFZDa3gz?=
 =?utf-8?B?aEJ5VjM5RGpzMytYR05NVC9IbXRMaFE5d3hqdW1wZm9VTFFuYnY1cERXM2cz?=
 =?utf-8?B?NFRkT3NMMWdyZXVWeHNKam5pdFV3MUFRbC96dmNHV24rYndoaFlSRzV3Qkd6?=
 =?utf-8?B?RHZ1WkU5YkluRGtWbTB0VU5EM1AzUlkwdVZJd2ZUNVlKTmlxZTJyZm5SbmRT?=
 =?utf-8?B?eDZ6TmRadyt6SHExR3Z6OWZwRGRDSHhTR3pISnlUc3JzcjlxUXFzbXdyVmtQ?=
 =?utf-8?B?L0JnOWZjSDkrWEE1bUFUcms1UElKTFBVTTIrUVUxSE5BalJhb0w5eEVINDNr?=
 =?utf-8?B?MUN1cUw3a05Sb1YySjk1Qk9yNlZnc0JpQ1I0SGhoZExwQWUrbkJWbXo0MnFS?=
 =?utf-8?B?Y1hlNThzS2U0MGdJQnZmZ0xubUNjcnBqR2dQRVlFK1BGL255d3pOY1c1cDU1?=
 =?utf-8?B?NEhDYWxkWWxKY0hLRlg1c0NiK2UyQnBHYUJnNjBKRDNBV0JlaDVRVjFTcjdK?=
 =?utf-8?B?OGJwMzVGeXNPN29tRjFtRitIVkkxY3c0Lzg5TGdyY01DU2ZMUWJJNm1NSFpI?=
 =?utf-8?B?M1FwTkRDTGc0TFpWamVtVFlsQ0lxOVlZK2txR2NjVFVEVjlBdUs5WGxHNGJL?=
 =?utf-8?B?dWtHQTJMbThrN1VRa3pQTDY1cU4wTG84Tk1sblJGYzF6Wm9jQnI2bXN1RWdt?=
 =?utf-8?B?TDhHcGsyWkhJeGl1cURXYnpPdEcycExmWXpRM2hRdURFRC9qMWZlbEJSUUN1?=
 =?utf-8?B?byt4c1dFNGRhd08yYUhKV3dCdXBuZDRlU1R2UUhuZlZJSm9yWU5BMnl0azZi?=
 =?utf-8?B?NkROS0dWeVdvWjJuRFFDeVFiWSs0ZHRqeXJvN0ZzdzcvWmk2SlNNRnNQQ1Ru?=
 =?utf-8?B?VkhLemNQeFVRT2I2aGZxdG5hcXUrL1ZDTEE3TlJ1SVNseCt6RGREUXRrdUpY?=
 =?utf-8?B?MDJWcVRiTkRrZnRxcVlXNTdpOGYyRzhva1hTOVM5V3RudDZ0UnJjRjBZTUt1?=
 =?utf-8?B?aXh5STlLaGdxR0VHZHU1ZXF2UXcrZ0RDM204N1VXUUI2VmlVa3RFWjk4THZU?=
 =?utf-8?B?SyttNEZLRkZRTXA2ZWtzN0JXbUpzRlNTWWNHenI5R3RwaDJqVWxmRC8ySEh4?=
 =?utf-8?B?R3drR0pyZWtBU3lIN0VxRWMzZ0V1UFFpMWxOaWRWbVc2MEExZzNYdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc8fd44-4271-44e4-57fa-08da2db7badf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 10:20:36.6454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfd2dXQqPZ+5aXLLg539Wnw/6+KCR6IPg4ulM36nKKl4qkoBchBa9KT7oevorCNfQtMTl7qSv07Ek3CBPTLEaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4771

On Tue, May 03, 2022 at 04:44:45PM +0200, Jan Beulich wrote:
> On 03.05.2022 14:37, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:33:32AM +0200, Jan Beulich wrote:
> >> --- a/xen/drivers/passthrough/iommu.c
> >> +++ b/xen/drivers/passthrough/iommu.c
> >> @@ -307,11 +338,10 @@ int iommu_map(struct domain *d, dfn_t df
> >>          if ( !d->is_shutting_down && printk_ratelimit() )
> >>              printk(XENLOG_ERR
> >>                     "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
> >> -                   d->domain_id, dfn_x(dfn_add(dfn, i)),
> >> -                   mfn_x(mfn_add(mfn, i)), rc);
> >> +                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
> > 
> > Since you are already adjusting the line, I wouldn't mind if you also
> > switched to use %pd at once (and in the same adjustment done to
> > iommu_unmap).
> 
> I did consider doing so, but decided against since this would lead
> to also touching the format string (which right now is unaltered).
> 
> >>  
> >>          /* while statement to satisfy __must_check */
> >> -        while ( iommu_unmap(d, dfn, i, flush_flags) )
> >> +        while ( iommu_unmap(d, dfn0, i, flush_flags) )
> > 
> > To match previous behavior you likely need to use i + (1UL << order),
> > so pages covered by the map_page call above are also taken care in the
> > unmap request?
> 
> I'm afraid I don't follow: Prior behavior was to unmap only what
> was mapped on earlier iterations. This continues to be that way.

My bad, I was wrong and somehow assumed that the previous behavior
would also pass the failed map entry, but that's not the case.

> > With that fixed:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but I'll wait with applying this.

I withdraw my previous comment, feel free to apply this.

Thanks, Roger.

