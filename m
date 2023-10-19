Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F417CF446
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619064.963620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPbr-00074I-DC; Thu, 19 Oct 2023 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619064.963620; Thu, 19 Oct 2023 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPbr-00072K-AT; Thu, 19 Oct 2023 09:46:31 +0000
Received: by outflank-mailman (input) for mailman id 619064;
 Thu, 19 Oct 2023 09:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zn2w=GB=citrix.com=prvs=649eed31f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtPbp-00072C-5i
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:46:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0451a3-6e64-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:46:27 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2023 05:46:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5284.namprd03.prod.outlook.com (2603:10b6:a03:223::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 09:46:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 09:46:20 +0000
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
X-Inumbo-ID: 5e0451a3-6e64-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697708787;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n6JJKzY9FqJkru6q/jkF+UMYl3sFsnuZmbBb/HLK8HE=;
  b=At7p8vz0mzOZMqo7M9X/rNjIZGOT+wqYBddR1V9EI6XbuP2TvFUG0QH7
   RNh8N17rhZPuTT8Uf+HS6jY5TGObAd6U8yOeDTCzDBeIHlOaMTG43+6O9
   BT1P5EXpV3O/Xy5WQ0XOeJVjH9Rw/OdqyZOhHHNliyhjmnKaLfH1sL92J
   4=;
X-CSE-ConnectionGUID: qqXRGR1JShGBiO2V7bUzQg==
X-CSE-MsgGUID: KWF8TvopQ7yoh0paXrJUTQ==
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 126473897
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tnPhy6N0VeWTZv/vrR1hlsFynXyQoLVcMsEvi/4bfWQNrUoj0jFWy
 jNJCG2Hb/qPZmKgKNwib4W09UNT7JDUz9EyGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5wxmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v9uMVthz
 6U6EzAiRBGk3dzpyo+pc+Y506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjy2rCUzXKkMG4UPJ6H2K5WnlqL/zMCDx1OTVKLu9uEtnfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O8037hucjJXd5QmxD3IBCDVGbbQOt8IoRDpsy
 l6AmfvoAyBitPueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WGqXY4jrBK18oTjfzlrBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:mXiD/qFD95aHHpOypLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-Talos-CUID: 9a23:Rpm3ZWNCCdDdw+5DQTBXzmEuQ+IeclL3zVCKHRCyNHRQR+jA
X-Talos-MUID: 9a23:tDAQFAtsvJQweAWSdc2npw5MZPt25LyXV1EKkc0esvmeFxFMAmLI
X-IronPort-AV: E=Sophos;i="6.03,236,1694750400"; 
   d="scan'208";a="126473897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+f0d43+7qcvV7Yobubm1In5JXNPXg4f4P8VfvB+6JjiQvz4mXNQotaH7w65/7ecCTtFMIOaqGOEPDhZVy9lIjmsy0kz7fYUKfYARgIiIyaWxA1puv10CYYIrJYrdYKqnM5n6P3xedClqD2qDrxFtAVzfE49+ykM4+U8vV+035htoGP2xvqHMByIx7fPPnzTgZ/hMCsUmFk96xya+MPzfrSYlqiPukEuwTJuL/DG55yn3K3RFbToEMc20Pn5LSNTjmYC8GDAq8k1klk9f1xFVYjjSflIYNhblEerbGqb+q160sKU4loC6rDC96qsB8FUFuunXfwoVkBuZehW/9qPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QirGQsxmnxCJFOtgMr79yOeTAgQqECVNZ8Q3BTeM8Es=;
 b=mdNeuyN260dLh/oOtmz7lqCahiHFMsz2fk/5XY6opPcywj6DLPNVYR9WET5/tbQPKSSMCaBYKm0OAqp+Vj/UXaEGxHOEvVJ8wFf4H8W9nFMZ8nfVbkwyv4InKdEdVUdfDzDcvyxyMsThsMmIUICbeXkvkI5ehM6E4y4fwaEQm4+GtTQJcMqTIZvcSoQFucRkgs/nwYSjBZbyIRoWKrioYYTkVgkCskiZ9xIzCOB7Ilef7ABjFwbSagJ0XgUCSNz6JfRa2ETCpzoVgNRM+HWOaTDqoImOOZXwe/+5z2+7/mKmfjHk0tyddNDbhIjtE34zZgu2S0aijMV1trR8aqr8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QirGQsxmnxCJFOtgMr79yOeTAgQqECVNZ8Q3BTeM8Es=;
 b=bAVKDZschTVu03OOE/VBCffQMSHQPLVkQOoLB+gEhIF2NFUC0EmzRp7VGxHiE4AsFTNtcfWA4K5Et6QmWtUF9eTxfvd2cfpGuUyAJCy5XbfEisf/INwEBUNclwqlXpFc8DgKUqlEzDV5/uFFQx64AY8y4zQ+iKquQuOJogVMOT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 Oct 2023 11:46:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Message-ID: <ZTD65qLQcQSAnr2X@macbook>
References: <20231018160733.24655-1-roger.pau@citrix.com>
 <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
 <ZTDlm_msZrFlhubr@macbook>
 <45b73e35-29b0-99dc-ff91-251fe38d78ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45b73e35-29b0-99dc-ff91-251fe38d78ed@suse.com>
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f1c1d4-709c-4d8e-dd63-08dbd0883f68
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+EsmLByVsGtYuidVQ64NM5kzBmNKbMmLDKW0OIpxddOLfOrr5E2AA0AOWQKwS2Wk0pXE8fI7ViEBY1MZyp9qQPCxlbvC64H7OI0og+uGTWKaOmzdXBzI+dCcG3g7hprpLVNv1AEwM3ubj6D1SXG/tiE+mMpTcQxk2S8Q5Py+xX3JDByuYu0aO4nQDK7rp3+vUFXBifQHI5CTdKoJZ6xKiDiaULUSlom7wHjIlnnvfx3SDGxcWTW+KRcwFeqaktCPhm5NEuwV4l2Vn9v20MDMrr4CaLSxBEAIBnnGhC3QvCB4pN9cEIGFoLo5Eu3/uxpMKG68UoG3eI/ZVnWmr6YylYpM4H/LGXN5pWqkyrFt7dr1qQS+bvc4mGoF5aayRYUlTDFcV1duYk0Y1C1h2KgzHHL6cYgTDbS8Y7qYSvyqG5Q3xdgHzSjUIVSCD3WrP2lNVPY568t15hNidSTlwNhOagtm/IqMarVacBCr7b1chKrdvx+Iy6rXDGUnKFdbMujIxEW/9HfQwctHxWTm+N2jGcKYoP3mtmBzm5mRMqayqBDN369rowTzCvKhsE5yvh0F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(33716001)(66899024)(86362001)(38100700002)(41300700001)(5660300002)(4326008)(2906002)(8676002)(83380400001)(82960400001)(9686003)(6512007)(26005)(6506007)(53546011)(8936002)(478600001)(85182001)(6486002)(6666004)(66476007)(66946007)(54906003)(6916009)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am9HYmh5UXYzMUlxOFd3VHFzWGcreTBaT1hLS2hpaTBRS0RrTndiTXFzVWFr?=
 =?utf-8?B?Y1dpR3pWeFZnMDlxaFAzd0FRZE5JM3Y5YlcvWlEzZWl2d2NpQWFML1pKR0Vk?=
 =?utf-8?B?TWg5OUh4c1lDSWhyM2RBNkpGQjM3Y0pEVjVUbm1sUWhETlp3YktuUlRsbnVX?=
 =?utf-8?B?Zk9DWjd2VTFIN2s0S0VKY3piUm03dFRRckdKR0tBSytjUXVnb1hjeGh5WXcx?=
 =?utf-8?B?UzdVVXY2M3VjdEFaNzRqV3VNWVpvOFhwNk5QbXFtWCtJc1dEcStoMnN0elpY?=
 =?utf-8?B?a1pJWGFIbExGV2pBVXFrT2tBNk1GaDQvNWtlUEp5VzBvZ0M2Qy9WbGpEckl0?=
 =?utf-8?B?ekQzL3dDdkZ0NDBoUWkwOStPU3hYcnlnblBNeUk3cklmNEg0SGVjM0JGMWZQ?=
 =?utf-8?B?ZndlT2xLbDQ1azh2anJyMlNiOFF5WVVDRzc1Slh2V3hySUd0MmViVVY1aEZp?=
 =?utf-8?B?NWVGVmJlWFQ4U2orTS9wRjhuSlpoSm1pWkR1dmc3a2JBQ2lQb090eDBqV1Rh?=
 =?utf-8?B?djJ3QjlzdmRKdkp6TWxEU01KL29TSjJIck1YQUJiWHB4MFFFUytwU1RlbUJP?=
 =?utf-8?B?KzRVVEtkZUlYbHZTelRoN0V3OTVqeEgrbGZPbVdiWk5aaG8xRDNMYUorejBk?=
 =?utf-8?B?NitJQ1padTlHMTBGbXJlNlI1QzFpZW9IS1cveW1qbElTSm94LytGTnNzZnY1?=
 =?utf-8?B?U1FDZFh1NU5vNHh5U1dxN09TU1dEVGtYRUNleEhpcFMwcFhmaUpTV0xXblIv?=
 =?utf-8?B?V1lKWlgyNWorMk5qVnEvRDhjanE3OVJIbUs2ZmNXMlF6cDRZRkg1MG1pZDNW?=
 =?utf-8?B?R1Y2U3AwMUU1SUZTTmRBbTV2TnpJMVptY3VmNW1PbWt3aTNKWG1nSGtnTFBy?=
 =?utf-8?B?ODhhKytFNExXNXpoa3ppS01kTGw1QWZzR3NWa0UvakpQQmh0Zlo4S2YzeHR5?=
 =?utf-8?B?QldTbXJIZVN5ejEwUEY1TTJXOGdHM2ljODFJTVp0THdUOHlKYXRNQWRJVjd4?=
 =?utf-8?B?U2tlM0w5M04xMlozZVA4d0FVeHhDYkhTNDZNZUVPVjZveHhBcmpncFEwNWJk?=
 =?utf-8?B?RDdrT0liejVWN0NXbTVBTmVleHdKSTFySEZKd0NMVDlxQnRmN2ovQ2M0NmE2?=
 =?utf-8?B?WnhxNW14NFV5Zzltc1Q1S2UyYzJBaWNNOUhsUzVrdk1MZEtxNWhaN1B0bFVR?=
 =?utf-8?B?RDVqMjRHTVVzRnNtTUxtUTJlZTNLOVBFTXIvcjZpaFIvMkg4SGN2NHBWUzNU?=
 =?utf-8?B?cFMxdzNlVGlJWTRKVWgwblBmeXNMV1BhTWhIT1E4dEg3ZUo4MittVDRxNUdB?=
 =?utf-8?B?RnNTUFFwUmpYemdud1k2V0ZaQm1XbXlNZm5FWk5taGwyZG9pWnYzeGNwTGpI?=
 =?utf-8?B?QWxJeXFsOTJDTmZJK1VsL3lka25CaWE4QnFpTlg4RzVQZzdXUGM3N21wc3lq?=
 =?utf-8?B?Q0Vyd2t2QkczY0dLYkRnS0svQk9ZdUJHU2t3ZlY0LzVIY0NYc0ZxNW5Sd0U0?=
 =?utf-8?B?TzdOMG5EcFRYUVl4amR1Q3d0VHd5K3dHN2RQSjk2U3VwOUpmNTJtNTZySEJS?=
 =?utf-8?B?VWx0V0pJaEk3SWcrVkE2SnZsQU1aS1UzSlFtWUFaeTJQMEtvR25ON0l1aVdu?=
 =?utf-8?B?Zi9yR1hPN01yR05mcTg3Ykt0aU8rUC9uWHlvTjB1OHlQL0FZZExHN2IwSnlV?=
 =?utf-8?B?MmMyeXNFR3E5YnlqZXBzMGdXb0tIQWEyZTVTS2ltQmJmeDhMTWZHWlJNYk1p?=
 =?utf-8?B?ZDd1M05JaEFaZ210c2JObmlrQjVSTzllNHRET21paEIwc3dBRVpUbTFOdFVI?=
 =?utf-8?B?aVRhV1RJUlU2cVYxL3o1VW9ZWWRvRldpcWZVYzJQNTVJSjFHc3VJVTZ5WjBw?=
 =?utf-8?B?QnRoSFRwL0lxRVF1WFhKMlhpQUsvcERNZzRuNXFlTWNwVEJ2cmc0SFZveFQz?=
 =?utf-8?B?TkRTMkFiRTJGYlBrWVVrWHNYNHdRbTdNY0h6dk9rRnFWVkNsY245S0RrR0Nw?=
 =?utf-8?B?QXpld1didUNaNmxHYVlXTWJvVERnZXhXVHFlNnNOYlcvdGcvM1RIc3lmMVln?=
 =?utf-8?B?YXFnaFlVZWdZMTBMcDZuQVliUS9Gck1sM1o4MzNnTkJRM3RURDAwSE1JVjhs?=
 =?utf-8?Q?l2iSqkpS98s9YhTEfxBAQT3Zn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WDoRDofLbgv00/BwrzFQq/fuxZKbRpoZ1dTDqdeDRCbqPo9zzykhUeoVDNeVCEIIAPwGsFOngT0xGl2I9isUlpc+Hv2mDB7MS3q+aTE0umS9frJwdBhuw5RT/7czXHUcTBT+T3aNh+GIUmjo3f+AnhJTAnJAzuMuikWRE1ISko37s05PoQxL2ugrVMHZD3dvDIU4iCdfcrNs33UZkreq8JXsxK0Vkj9o6hOGKp8XvMaNeyoh5/9PPau3laPANyoeVdpquxIJI8FqeqDCmNBZp78s6odLVc+8zFhV4TSEmB9RHe+hcQxSIWyJP6xyGuuiN2NZdP0RzxPCA08EcXs4gWJq4+rlmm5/YGXXNGjawUm0GyxJHx7Bo0k+FRyu/JcEkuE4p2iPyAspOeEi0QsWuu4/nivg2SS/thhbjtFotNohDqReGwIiSxqf61Y8w/0eDIVIx/E62RFgCQAAl8cLgH3Jq9wfV3KkzeVUnnxyEZusgXPEGrrBSJjF0pdtzCWF1XvPDqLQTLOy3QM0412H5Z6AkZWgcuNHFN6lgsEXukTQ5OVKAWdZvV7GLz17yhRpmbs0kGIAt9egbjaZhrt1r5+esYZtVHZW/6/UBbjwyu3NedhdGf7V4MWtsPe6sb7JaBPRJd/EzmrY4iNBm16TutmyOzUYLNhbX2kEHCu1xm2nn9uQ0XpQJfirVEPFPNoptMf8xF0Z56TyHARfSgoEOtenf/9I+pOY0/66Su5kgRqR5uItsCjlW+9lYKcOxRM0R9JSN8n789W7w99Y+eumD204zqNU9GPM/GLA2B9BPcLPRR9ttj15ttjxEIiaxsxIZS21L53h/4XP2FZQmKZ6tCnaQMH4UeoCINn+5TyzAU4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f1c1d4-709c-4d8e-dd63-08dbd0883f68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:46:20.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJdIJxll5U6u6mwqTyt2Fy6QmtIuSOLUJyH0xcroUSZDNP91kM+nJCgrr3T7Sb4nVPHpCC/S85ejXx0V/VORrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284

On Thu, Oct 19, 2023 at 10:49:29AM +0200, Jan Beulich wrote:
> On 19.10.2023 10:15, Roger Pau Monné wrote:
> > On Thu, Oct 19, 2023 at 09:41:41AM +0200, Jan Beulich wrote:
> >> On 18.10.2023 18:07, Roger Pau Monne wrote:
> >>> SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
> >>> level page tables respectively.  According to the Intel VT-d specification, an
> >>> IOMMU can report multiple SAGAW bits being set.
> >>>
> >>> Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
> >>> it's actually replacing an open coded implementation to find the last set bit.
> >>> The change forces the used AGAW to the lowest supported by the IOMMU instead of
> >>> the highest one between 1 and 2.
> >>>
> >>> Restore the previous SAGAW parsing by using fls() instead of
> >>> find_first_set_bit(), in order to get the highest (supported) AGAW to be used.
> >>>
> >>> However there's a caveat related to the value the AW context entry field must
> >>> be set to when using passthrough mode:
> >>>
> >>> "When the Translation-type (TT) field indicates pass-through processing (10b),
> >>> this field must be programmed to indicate the largest AGAW value supported by
> >>> hardware." [0]
> >>>
> >>> Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
> >>> and signal such support in SAGAW bit 3.
> >>>
> >>> Enabling 5 level paging support (AGAW 3) at this point in the release is too
> >>> risky, so instead put a bodge to unconditionally disable passthough mode if
> >>> SAGAW has any bits greater than 2 set.  Ignore bit 0, it's reserved in the
> >>> specification but unlikely to have any meaning in the future.
> >>
> >> May be worth mentioning that in earlier versions this indicated 2-level
> >> paging support.
> > 
> > Oh, that's not even present in my copy of the spec from 2016.  I guess
> > it was removed very, very long time ago?
> 
> Indeed, as mentioned in the commit you're fixing. Version 1.3 of the
> spec still has it. Judging by the document numbers 2.2 may have been
> its direct successor (i.e. no further 1.x and no 2.0 or 2.1).
> 
> >>> --- a/xen/drivers/passthrough/vtd/iommu.c
> >>> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >>> @@ -1327,15 +1327,24 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
> >>>  
> >>>      /* Calculate number of pagetable levels: 3 or 4. */
> >>>      sagaw = cap_sagaw(iommu->cap);
> >>> -    if ( sagaw & 6 )
> >>> -        agaw = find_first_set_bit(sagaw & 6);
> >>> -    if ( !agaw )
> >>> +    agaw = fls(sagaw & 6) - 1;
> >>> +    if ( agaw == -1 )
> >>
> >> Would you mind making this "< 0" or even "<= 0"? The latter in particular
> >> would already cover the likely future change of dropping the masking by 6.
> > 
> > My plan wasn't to drop the masking, but use 0xe if we support AGAW 3.
> 
> But we will also need to deal with bit 4 (at which point applying a mask
> is going to be useless code). We can either guess that it's going to mean
> 6-level paging, or we need to treat it as having unknown meaning when set
> (implying that we'd then still need to either fail initialization or
> disable pass-through mode).

I wouldn't enable support for AGAW 4 unless we have a way to test it.
It's safer to just disable passthrough mode if SAGAW bit 4 is set.

> > I'm fine with using < or <= if you think it's more robust.
> 
> Good, will do so then.
> 
> >>>      {
> >>>          printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
> >>>          print_iommu_regs(drhd);
> >>>          rc = -ENODEV;
> >>>          goto free;
> >>>      }
> >>> +    if ( sagaw >> 3 )
> >>> +    {
> >>> +        printk_once(XENLOG_WARNING VTDPREFIX
> >>> +                    "IOMMU: unhandled bits set in sagaw (%#x)%s\n",
> >>
> >> I think IOMMU: is redundant with VTDPREFIX (or alternatively iommu->index
> >> would also want logging). Also note that VTDPREFIX (bogusly) has no
> >> trailing space. (I realize both apply to the other log message in context
> >> as well, but still. I'd be inclined to adjust that at the same time,
> >> including switching to %#x as you have it in the new log message.)
> > 
> > Oh, I didn't realize VTDPREFIX had no trailing space.
> > 
> > Since it's a printk_once(), not sure iommu->index is really useful
> > here, as we would report just one IOMMU has having an unhandled SAGAW.
> > IMO if we switch to printing iommu->index we must also use a plain
> > printk.  But I don't see a lot of benefit in printing this for likely
> > each IOMMU on the system, and hence I would rather use printk_once()
> > and not print the index.
> 
> Well, logging the index in printk_once() has the benefit of identifying
> the first IOMMU with the issue, which may help further analysis if not
> all of them have bits beyond 2 set. But I'm not going to insist on this
> aspect.
> 
> > Feel free to drop the IOMMU prefix, but I'm not sure what to do with
> > VTDPREFIX and the missing trialing space, as some users of VTDPREFIX
> > already account for such missing space.
> 
> I'd simply insert a leading space in the string literal.

Ack.

> >>> +                    sagaw,
> >>> +                    iommu_hwdom_passthrough ? " disabling passthrough" : "" );
> >>
> >> May want a leading comma (or some other separator) in the string.
> >>
> >>> +        if ( iommu_hwdom_passthrough )
> >>> +            iommu_hwdom_passthrough = false;
> >>
> >> No real need for if() here.
> > 
> > Not really, but also no need for a write to iommu_hwdom_passthrough
> > every time an IOMMU is initialized if the condition is removed.
> 
> This is init-time code, and hence the excess writes aren't going to be
> noticable.

I don't have a strong opinion, TBH I used to have it without the
conditional and added it later.  If you prefer to drop the conditional
I won't oppose.

Thanks, Roger.

