Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B87B17DF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609412.948494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlngO-0003zo-DB; Thu, 28 Sep 2023 09:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609412.948494; Thu, 28 Sep 2023 09:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlngO-0003xO-AH; Thu, 28 Sep 2023 09:51:44 +0000
Received: by outflank-mailman (input) for mailman id 609412;
 Thu, 28 Sep 2023 09:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlngN-0003xI-9I
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:51:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecb0957-5de4-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 11:51:40 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 05:51:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:51:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 09:51:08 +0000
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
X-Inumbo-ID: 9ecb0957-5de4-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695894701;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q7bXhaynD8VoyBY+kc8ve/t3fP4Gu3xyePfX39ALNCY=;
  b=P/Je7JdufDsGvZOaAn6MeaLQFynnI6GnFpCxbozqaCgWf8Jo+1mD8PMb
   +Md14y9vz6Hda1CAJXqeVFe61U3m2rI5Z7wN3mofnQXtYipoQdk1kjU6F
   KwR/KOk5HKnlRLp2r8oDeQZONoOLLnSMToVmwBOvjNKnkNzum8yKgM4qZ
   o=;
X-CSE-ConnectionGUID: 5NpCtRbDRPuNWDyquNNwCw==
X-CSE-MsgGUID: Do31LC3ZRpmThV3vnTKjig==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 124469974
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:2vD5GKOh3J5u2RbvrR1UlsFynXyQoLVcMsEvi/4bfWQNrUoq02RTy
 WMXWmuPbvyJZjGjf98nYIW2pxtVsZLUxoM2Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42tJ5AxmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rtRGUpSz
 /Y0EggQSC+vlvur5pSkYfY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjw2rGezHynMG4UPJG/radOqwah/HQWNB0oDkW9ndq7i0HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBByFrsbCTYWKQ8PGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLGxps34H3f32
 T/ihAgzga8Cy/EC0aqT9ErCxTmro/DhUgcw7x7/QmGh4wV2dYOhIYev7DDmAe1oKY+YShyLu
 igCks3HtuQWV8jTxGqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7YhNGsYcfj1qNNvkX
IronPort-HdrOrdr: A9a23:nnrXq6p6dQCV+uvgG6wXJvgaV5tKLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl7x6T33KQwVmUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYDw9jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiq7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjeseMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCU2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJuncw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2CfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOgNSS35uwKzvnxehT/Ydy0ofsupaSR+4eMCIYDCBfzCWzHyKCb0rAi6s6yYY
 fABHsZOY6mEYLUI/c54+TPYegsFZAgarxqhj8aYSP7niuZEPycisXrNNDuGZHKLREIHkvCP1
 prZkmBGCwH1DHnZkPF
X-Talos-CUID: =?us-ascii?q?9a23=3AwnTLsWn+C+OT5nfjWGyM5u2aLFfXOSD71FzMGUW?=
 =?us-ascii?q?UM150boK5WEaN3oV7uNU7zg=3D=3D?=
X-Talos-MUID: 9a23:znZJGgqCMlBeHfD/LCsezx1lb55MyP+cMlgIrZU44NeCCQ9yOjjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124469974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDcqFlAaDbGS/vaECUytldfg1mmBLDhfwYUUVifefHdVeziV/YHlWYLCaFGAfa4TSQL+loJQPiOXfWY5Yt1nYxCSlLIfujfjF+2CWebQNHfLRtJRFjJX5tZHUcbjhcIMpgUYj812I6V4nTlsuhSyIekr9aFWG9mkKT01srkCTb2nLKDjq6RiR0atxRz9phQTc0HbVdjzpdQD3LLT27+BuTbB9PtDK1si33MFP/VDb0/KRMg3UzH+KAX8jTb23nkQnL73WO/++Cke/xZrR6TxDDH6s3+DbFCvshfWJm3AOlHuc7IpNMO9CwEyPs3XQTa/+fSW2vDbiP2MiFkqCWA2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ1uQIXpe/xn1a+D3xk0No54WWaT+xVrl3zYj54YSVk=;
 b=McY9bWTUx4NPJ54cvFED2NTdok4ml4+FATObFbpJ+IbMAeb35h5hcJvxUHC8ozJgDjxhrVV3agl++Q9YWM8aVG2pZx276dIOYLVZ3E+0EhkQAr7sNKZQMswww+xsIXEJoe3ZtyYKMvCC0oFn1DYKeFmH8Du2qwGqZs7604++GelqJVKV/c2yt948xlcQMhazXtHtSbdiavVd6z46LKouugRU81DNgjpv7XqhPbJubA7XDeug2Ang2E0wZ4hzTWweOElue/F5YfuSO5XTCXiui+cqzIl/EB5LTnJD06evJY5hIn+G4sT2Ip7bqKUWO9nRVg2EAZDJxrWqiQ5dBAebxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ1uQIXpe/xn1a+D3xk0No54WWaT+xVrl3zYj54YSVk=;
 b=KK42UapYTIs1yGRGflVEzbgqSd5JQ+dL4X7NTiEZBuycI2i9wmIZ/fjbzrsq/hG1mB0gXH+eQri4beOm8pxYtrclP7fkHJfmL2Nnuylxe0MGHTaXaoz4ngkhqH7piE+q3Zj9Sak3uQOHVqB6O32sQngPM2Aq99TWDHWNKHZ6Cf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 11:51:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db81749-4ab1-4d1e-ee07-08dbc008703a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3tmrMkweBYBVXSqLPBDw3vdUpnxAAzLvUulqFNel+rm8ARPJnrbmKexEgDN2j2MLcctB8FgaFLxo77C/C9m18DE8wHnFa9/y9KtDJfs1CGwI6PX4hGe2X2OTBwYSxNblwYVFoDq4CKx0FSm6na9tbsN4yjZobpLqttrcBpe+dJlrCYcKw2zgO46akA53HlNlnp3avf+OU/iI7jqhAEJFMl1XWmAkT6wzqeirbCYJPNaPP8ZZ1DERrZnAbPqP7OOiDs+5XHPhG7hWnH0iJjjgCMnjxKev6Y2Ri5idLFAwzBRqVMqMNngYrjvaJHgyh7MpUN0Z0k+HwxCaid6eqkn56/Ly6nn+m3Eglav6LUdyUf0z09/3Htar037lKrd2itYrSAacqJOFFzvp9LjP6s0PFIJqFquMF8sEC6zYVSGmjb1v5zDikVmDmuC/DrdVkvUJH9XV1jVD9rFMCGLI98Fj4vqN51UuSl/4r31wlx7NyFEoQVlEVMYPTZqTj62IWFwcFbsi+MeshdQHpAwAJqpjjlmeds3SliO2GmV6m9oz08ZLd6rzOtxgShUqhML1XwME
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(33716001)(82960400001)(38100700002)(85182001)(86362001)(83380400001)(66946007)(6512007)(2906002)(5660300002)(9686003)(66556008)(41300700001)(316002)(54906003)(478600001)(6666004)(6486002)(6506007)(6916009)(66476007)(8676002)(66899024)(4326008)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUM2ZS9FQkZHbE8zMCtaZHYvb0grbkYvVytJK0JjL2xhS3dwdlBDdzhBNlNJ?=
 =?utf-8?B?cXRQby9ORDltS3BjS1djb2NjUTM0dlVieUVNK0VVRDRiOS9Wd0JLeUhSWCt2?=
 =?utf-8?B?a2FkSkc3dzNIcnd2ekl1cGQ1T3RIVDJ0YVFWdzFPUmxoUzkyMzFHZ0JyOFNT?=
 =?utf-8?B?b2xzMnJlUTB5RVZqQytKUzRSYWltdXRJTGNxUHViRGp1KzFSK0F2Q0RnRUdm?=
 =?utf-8?B?Nm9JdU0vbEl5NWNnMTNtb01FMzBiaEd3L3AyTis4ekRZT2ViRXJnQzVJclE3?=
 =?utf-8?B?MkFBWnRKTFhkUVZsVG9JVUFYODNmc3o0Si8xUUprOWdWYWVDbnpkMXllWlJo?=
 =?utf-8?B?MW4yZ1VCTDlxK2NYMWltaS9PUjVIaVpOYjdNTDdseVpnVVNXaEhQbVFlWEVZ?=
 =?utf-8?B?UjNyM3k3TFMyNSt5Y3BvbExxN0RrbXRZOUQyRUVkRHZJYXBId3BLY0FvQ3JC?=
 =?utf-8?B?RDVGRHlEMjMrbmU1MnhjVVY1QjFDSHB5bEZYSXNXRW8zaVJoWkdNanBBOWlh?=
 =?utf-8?B?Z0FxbnkwKzJ1cUk1S2ZHTHRaZ3E4NEpSdTZjOWwya3RRV0tMQXhVZEcwMURo?=
 =?utf-8?B?RlNzNU5aUlRNSnV0NURwZ0l3Y3VFRE9iR3ROcTdIYllaTm42cW5DSEZVdW0y?=
 =?utf-8?B?bUFncFpmamdnMVZyLzF0MUs4SExsTWdIUjZHQjg0ditLRXY4VjV5N01FM2lm?=
 =?utf-8?B?bEpMbzZUckVZcXNsTGpTZTlFd05EMW9aUytmVlZOK2YwL040cHVxOWlxRmVt?=
 =?utf-8?B?U2NMUjlyTVZsTDc2b2xOQ1FhdjNWK1RPb1JVNXhReGFSVnRCL240OGJiekpu?=
 =?utf-8?B?LzJFd0pVOXlYeDU4eWtCV0JVa2srbURsTTAzKzgzb1hPVGdSUmFjSGo0MUYw?=
 =?utf-8?B?SEpNZC8xQ3NvVU1vNnYxUFVzbzJ6OEo1cWV1d2tIU09zaEZWZDNvTVhvcGFZ?=
 =?utf-8?B?ME5zWnoxWGNJbkQrSExSb3lWUjY4UzQyVzhjSDRNcTNxbUVlNVgyeElxczhx?=
 =?utf-8?B?ajQ1MTliYXgzb2kzamJYdVRIVTlwL2M5Z09QY3pMcWhRWWVTYUdsVVA2RWlw?=
 =?utf-8?B?NTE5UmJ5OHZIL21wM3o5eDA1R0JkdzNvRWlaWkhGK2lYUlZ6czlvd3B5cFFt?=
 =?utf-8?B?cXBPWVFEUXQ5Mm5DMjJFSmtiMGtqOFlITkxDZUpsU1BLMWdiTlFDalZ2L3Jj?=
 =?utf-8?B?ek1qR2JJT1VuaDB2Y2VhZER2Q2VQTkJTSTBTV3AzUzFLVFpDbVIzZ2FnTmY3?=
 =?utf-8?B?OW9ENy9LU1Bjc29mY2JGUkZ3V0J1Z1I4eUtaTVpjYkU3TDc1NkRmQ3ZhY3BT?=
 =?utf-8?B?NEJid0YwL0dzSnlQdU03aFF6UE4rNTl6Sk43akltUEZBVUt6MjBXWXNJVGJB?=
 =?utf-8?B?Njd3QnJoMUl6dzVlVmhFMEJ1aDBwNThWVFJuZVFmWWlxdnp1NlN1VnNJZzNn?=
 =?utf-8?B?Y0JOWTVVYmdlWmszOFJGS09iMW5wZjRDcm14ZVl5Z1FtcE4xb3RQZzU0ckhq?=
 =?utf-8?B?OXVid0kyYkNPa1NkY3FwQmtZTVhIYzRXcitaZHRmSk1TMmtaUDMrcE8wSS9v?=
 =?utf-8?B?OHVlL0p0bVQrbllMWE5PMHBoTklMTU9OekdCY0lkTUhpb3oxSUFMdXIxK3dp?=
 =?utf-8?B?bXZtVXE3clpxZHMrNHNoaTROcEZDczBBNUhhTEJwZGFNbC90dEFObDF3Uzdi?=
 =?utf-8?B?b1h3V0s5TUQ4NzAxTm5MOWlmNy9PRDduc0hhWkozcURoMjV0RlBaSWh4WGdR?=
 =?utf-8?B?UE9BZTJvWXczc1RXdDFCSVdCQXA4dDA1SWg5bVdxcFVSNENwVC8wR1JzUjY3?=
 =?utf-8?B?bzM3YVk5Skt4M2dycDBPSTE3NmVYSFZ5UGtVQzhyQ2lKeWRhYzBWMm53M0dY?=
 =?utf-8?B?cTBkN0xxM1NCR3ZsM205dGxCdGw1NmppMjQyNVZLdUc2WXF1OGp4SUd6Q0Rq?=
 =?utf-8?B?MmZUOHUyM1NiRTk4eHVkUGFNdVdzL0NQK1pWaEg2M0N0TEwxcStia2ZuNUNp?=
 =?utf-8?B?c3pzSU16SWs5YWwwODVEMEp5OUw4aklBcnlCV3ZMc0Y4Tm8xSXc3cGYwYi9u?=
 =?utf-8?B?eWt0TmVSc3FrTUloSFhobDhKeEJyUjU1TFRnSlBrRnRqd0NPSzZTTklNaWVz?=
 =?utf-8?B?Rlo1bUV0WExXanJ4QWhLSFgvalI0dVAyd3JzN2h3bi91RnpWeCtUOVdiYnVC?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zh3bdaaFIfTi5no4DclMEib473Vxf9SBvfCNZGNUUJOV8Md6jeF2uP99B1DwSdP+akJDkWAfQmO6SqYkkF5Styp/OWoxApj0iUmBZljLH+apZd5opYLGgnh/Su+YyQXMxJzqrpACwHeT9sRk1JpJHPQ6OS+hxaeTmgyrgU6BPb4g8L5Qg4EgUtQiQC/HND+XYlwfgOaBGaaDCPt45W1LSSjRp9+yuN4tyO8OarN8nmURZtnmxzZfaduA5ELZyOx2j9m5RsVlpKsu5elNI0Nu9hT1rwNoxwemHykvcVdUbEyv5KbVP/3dbdINgTwbUDu3xUWCWt8lo1sn1PtF7u16p46ylPiNuGzyBwdE/DLzoACs94HEz9OhoH8pLziZd/2Hl9Tf27XX3lbNbpA0q75//2PhClULgBT5NoZr09XkCyf2VODDQ328dgSjAvYBLzcvj17DrbXRqqTcwZVdnKZ8Izvng0BxC/XKvY6sBW12LuJZqQTtXM4OtuMwLIQR2PzJHj76pp19lPyUQrM5x2ytopakYmqLAA+XhLiDJwmQsKva5YLG55WcPtQ+XeNT7+41xPzzOddj6LDuxeIfISBAj3APUcBp7dqpzQTvt/JndwNtE5M+ZgK2yO7CjjZoinW5cOOVM+qTzGjJ9/CNjxJP9Cbr366UGSPh24UKMDUOaxyFGKRg2li/etLXu1JOCKb3jlkUJ9aP7hg23OTCsDBKJ5BdoFX4qDXekf/cuwmuAJfXgdtcIQLsLTMc2fC4CVhQ7uN9q3Zv+qYopERIJDIvjL1dUSGx1inwd1XYObS24SQuzLBDPBAOfCY2JSDiJmYSP4RyWOqUPPcYQubCOzw6D2qvkHUtA0pxCDZY9FL9fCUc1wVYEbur2pAubhppu4lbVdJ/UcxUyHPjMqif7gsN9lcj1/SYrmQTPcxyVdE2/Bs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db81749-4ab1-4d1e-ee07-08dbc008703a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:51:08.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLGNOEV4vavx2eV2OsNiqVhQ3gQ723elwn1bLcx9dERG5BjgK9DDXNxDdVt9RUoLPNGBrS2G7qprqa2tCE4Z6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5372

On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary fork handling (with the
> backing function yet to be filled in).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Extend comment.
> 
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>  }
>  
> +static int copy_guest_area(struct guest_area *cd_area,
> +                           const struct guest_area *d_area,
> +                           struct vcpu *cd_vcpu,
> +                           const struct domain *d)
> +{
> +    mfn_t d_mfn, cd_mfn;
> +
> +    if ( !d_area->pg )
> +        return 0;
> +
> +    d_mfn = page_to_mfn(d_area->pg);
> +
> +    /* Allocate & map a page for the area if it hasn't been already. */
> +    if ( !cd_area->pg )
> +    {
> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> +        p2m_type_t p2mt;
> +        p2m_access_t p2ma;
> +        unsigned int offset;
> +        int ret;
> +
> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> +        {
> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> +
> +            if ( !pg )
> +                return -ENOMEM;
> +
> +            cd_mfn = page_to_mfn(pg);
> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> +
> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> +                                 p2m->default_access, -1);
> +            if ( ret )
> +                return ret;
> +        }

I'm still unsure why map_guest_area() shouldn't be able to deal with a
forked child needing the page to be mapped.  What happens when a
forked child executes the hypercall to map such areas against not yet
populated gfns?

Shouldn't map_guest_area() be capable of handling those calls and
populating on demand?

> +        else if ( p2mt != p2m_ram_rw )
> +            return -EBUSY;
> +
> +        /*
> +         * Map the area into the guest. For simplicity specify the entire range
> +         * up to the end of the page: All the function uses it for is to check
> +         * that the range doesn't cross page boundaries. Having the area mapped
> +         * in the original domain implies that it fits there and therefore will
> +         * also fit in the clone.
> +         */
> +        offset = PAGE_OFFSET(d_area->map);
> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> +                             PAGE_SIZE - offset, cd_area, NULL);
> +        if ( ret )
> +            return ret;
> +    }
> +    else
> +        cd_mfn = page_to_mfn(cd_area->pg);
> +
> +    copy_domain_page(cd_mfn, d_mfn);

I think the page copy should be done only once, when the page is
populated on the child p2m.  Otherwise areas smaller than a page size
(like vpcu_time_info_t) that share the same page will get multiple
copies of the same data for no reason.

Thanks, Roger.

