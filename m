Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fq5DHL6nWnLSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 20:22:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3318BFCC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 20:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240245.1541697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuxyB-0004k8-VH; Tue, 24 Feb 2026 19:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240245.1541697; Tue, 24 Feb 2026 19:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuxyB-0004h7-Qv; Tue, 24 Feb 2026 19:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1240245;
 Tue, 24 Feb 2026 19:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNA7=A4=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1vuxyA-0004h1-6Y
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 19:21:18 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a649b4-11b5-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 20:21:12 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61OIu0Wq359748; Tue, 24 Feb 2026 19:20:58 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf3m7vw94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Feb 2026 19:20:57 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 61OJ0IYL012544; Tue, 24 Feb 2026 19:20:56 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013014.outbound.protection.outlook.com
 [40.107.201.14])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4cf35ec6d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Feb 2026 19:20:56 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 CH3PR10MB6836.namprd10.prod.outlook.com (2603:10b6:610:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:20:50 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::21c0:ebf5:641:3dee%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:20:50 +0000
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
X-Inumbo-ID: f9a649b4-11b5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IgsceM7KoVsQTOcEoy
	KK1bM3/3qbvrJtkeBWprSgzgY=; b=g0PomlG+7WGXomb4LeEEkT8ZLFyPvlUufZ
	nULEAVe64Pmfe4hlF1X+/O2yYy0paDr3ujMaaJE5KeXCiE0jBFJI4P4qoe1tg/Jm
	e+noji21Sg+O+fyzY2YtA4A1rGfBAHZOS0iTiYeyI7eBnAK2m3Ru6a9aDPU3DTMo
	mbub/jQXc1n3GeG9zbpmNUdQY17VBX/XQm6YF1wpg/nlkwvzkB5M0Qla+/IBvpk5
	03GaZKvXt8fwEEi9s4SzkOu1fSTgURoKLeLLexC6EOM7mz3eiNAzmmlCy45KugGx
	oqfsdyXMo+XqoG55Wn4ndsTdimmosKT9BFaCWNzuM5P2HbmtftUg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COfwCAKromz9rVOiiOuNKjjZnvCORSTMIggEk1KTpwFt4IcQNPKtRCJKV+reP3f8z7DmzIwbhiEIwn41YyVE2I5Nosvm4Yh6qNa5P0+5jPYGiqq9QEZKi1iIBe+Iu7zErNAbBn4LGAqGem28kKSLmFcoKZvDgiVBIY2cceSKj/BlzJdcsmDzXMfV4EbtdeDYn94fmj5dOrW1NCLKynpLchJjbfRJ7MhKOkMfpF8WM4abW5vEWDefspUUvdBuG1+CrMc9nQkuFgvylUVmnJSaaIdtf/+JXRIIx3Fww7+fxBWCDI3cq89YSigHngN2QqC5Rqo7hphw+Tz2wo+PP/9XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgsceM7KoVsQTOcEoyKK1bM3/3qbvrJtkeBWprSgzgY=;
 b=FbihNHgxh41Rag6s0tnLOsNHLYG9jYO62Q5kb2wHkfs+/jM7bu1Y1TLMTbfF9j5XZZbZCWL8ekTIeJC/2FLYR9qCV9fLGgN5h03nbtGkz/Xbj/P+hEq7Ql0pBfili5CJjVMOdXORaIqFPkCdgq0qGswCwZlQsUtg/Ajje0wBvufMbRfA08bqIACwPpEgkhvxU7L36fmrvZXHM4BML5KTAcQ+EX70SUqspdBAoMG0jQZjzx7S96D35pYatQU1HNcFuZDZEsY5uSvuzUXhtBhduB970ZAaiT/SbNezhHb03Nchdb96RpcfPL6wDYBFgceiGLlw2CS438VeLHtcm5CT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgsceM7KoVsQTOcEoyKK1bM3/3qbvrJtkeBWprSgzgY=;
 b=m/9aqNNVHq0LsSr4xaRYCHUEeDH3J2420lELYPe2Oqzz/Ne8E4Te1krdSskmrj07TsQnl1/6SATKaVJo+tNw2rT5tlDWpNSD+cOmbKAajlfYx77Nl3OwEVYbkMov5shkNjmLVcinHHbgx35HDpl1qP1Vm9OF+oMThsLCOguNoPk=
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        xen-devel@lists.xenproject.org,
        Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/2] xenbus: add xenbus_device parameter to
 xenbus_read_driver_state()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260218095205.453657-2-jgross@suse.com> (Juergen Gross's
	message of "Wed, 18 Feb 2026 10:52:04 +0100")
Organization: Oracle Corporation
Message-ID: <yq1y0ki6j9d.fsf@ca-mkp.ca.oracle.com>
References: <20260218095205.453657-1-jgross@suse.com>
	<20260218095205.453657-2-jgross@suse.com>
Date: Tue, 24 Feb 2026 14:20:48 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::13) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|CH3PR10MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 365bcef8-b2d8-4724-0cf9-08de73d9d1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nAUMVaBUf8gSW9KHc6Jzt8XyiBFmmMKYPbTGZ8UVMA9nwOt6/WQxOimYuCPa?=
 =?us-ascii?Q?50DmTa0XRus16nmY/YB6t6klbzyiFjH/rHywbEj3pKLy9WQmK1142YucYcfp?=
 =?us-ascii?Q?XnoGeMO/ovl89mHMPUjqEsIC8/Weja/bT9Pf+096qixFoCsnY+2fGCDbAjGB?=
 =?us-ascii?Q?AnxhfXgp+BnRNKtNw7yf11cvw8Qf9AvwTNslz7e4ksppe7/9792ikbSh0eHR?=
 =?us-ascii?Q?iVuPFhQ0ul/Gy4jRlE7wMpJTPQ/3AWxKTdDQ0sn8dUZzv/QfSDh3V4yg7E24?=
 =?us-ascii?Q?e8LHb0aTmpXxCOt5cqrmxmsUyQQntULpQ6ZLjfGijOauoPEj6QaTWi6odB8T?=
 =?us-ascii?Q?CYtJ9Ommr6qVePM0e+t0kyjVEMSE///KTQXB8us0WZfqPjBeuD9b1/1BwNh5?=
 =?us-ascii?Q?MGtLDYKSypT7StAwhVPjsf+XW99qcWTDt1zqygVzyWE2Qr6b1ronfj0yGhr2?=
 =?us-ascii?Q?i8n2wEIPi2rFuIUZLL99ZfqaWm7/cpRKkD8TnuKsiuKo+MfEaycLJWyHygjE?=
 =?us-ascii?Q?070W1lRHsGI0VoCcpAS78wjMFAqZls7RRfmTHBx3Bh2l0KYSCfZiNtgOcJBv?=
 =?us-ascii?Q?h8e/Kd9RfKQdH1qekJ6v+gqFKwTyJbEHh7Sl1wvVG5lidjqh61xh7JXGnmY0?=
 =?us-ascii?Q?iSI+B9Mm/GGMB6zH9lQ7VfkhN9qisa9HTcoktGbjOHsQiBFWO3F5qvKegNQT?=
 =?us-ascii?Q?0SPEnYIiRtn4SHvJcdeAhRAZA3XsYwhBbKg01S27q+hOeqMDAI4NCfA1VBNo?=
 =?us-ascii?Q?8LpX8jR4j4fDpLEJ9a4hH+bOO5kZ5owcyHJ0uZlOQL7kUau4KLQG5SFMCo22?=
 =?us-ascii?Q?oD3NTeMa3vBqICc3ySU7lOJ0U2jgVM7pjB67cG45GnhjCC1+psIQB/4zDkqc?=
 =?us-ascii?Q?5pKvZPMIet+fAES3HpMdRZ7GB8BO8Nbzmde4vAWeBmkvcSpTHpeXNtxIAeNn?=
 =?us-ascii?Q?xey6e3qsBrCCJwhJaU0VSTXXWSFrkbkiNmy2Y+FDVBXx+YqYqD/2f9iR/SIA?=
 =?us-ascii?Q?bvIG424J6fuzgwI2oWyxNU3Q//zPm5/b1Vf+KsEtNon4lT20Ds1E/aFS+Npg?=
 =?us-ascii?Q?EL6TCaebaWkZGBXC0+urrrG4OvX+3gnIJAPwOQTnLHNjSGaW/CaMuDWkfgkq?=
 =?us-ascii?Q?cWTqTY9opVPFL2bEqlY7Wvg+F1aFrYLQodU+jVY9Un2+8wWfrIscl1LWTNxC?=
 =?us-ascii?Q?X3WGCsTCvg0rFtFLmO1W8PoUHo5qwWAHefmAOTxoqmD9rk1ml+U10k7JE4y+?=
 =?us-ascii?Q?BPFZRfmCVlKc0Kfb2Na7ww+hjVCXYIbzc88sn0mPkA2eFEgsXhGTVdYgSyrY?=
 =?us-ascii?Q?Zt9a6jN+Gn65TNqwlSRWd1txC+tRmrRN2e91WP/0LOrIim4XC5NW96h+nH6t?=
 =?us-ascii?Q?3Svy8ynFfdFZBehPpe/Nj+jbCm8hIdILTRD0ZgWdN2sJsKKQvYgNfqQu2vNo?=
 =?us-ascii?Q?NPyDfcbC2Nn/f8KulQv8LzB69G6/03sjfaElibUSH+KsHmGhlFdp+r7oQNHG?=
 =?us-ascii?Q?gj0Yk8s2QK2jQTyhm+W/wogzc/SfEgnw9qN+GT063KeZNgc18Dj4NRcNxYYB?=
 =?us-ascii?Q?Lj0bjG7ydC6fP+TmF3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fzaj6HHZmlqHKqbno9EMooJTD+sn0fMAV7oqS4PI8m9lM0Kyv2i9n+YF+GyA?=
 =?us-ascii?Q?NK4IbOmf8BcRbc5WsP3uxveqjNmSRw5dPWJNuU++9umzZpkurt3HWLc0vOuN?=
 =?us-ascii?Q?5FpqY9Hu+hXU3X1G6eP/GLLsbMDakCsEw4rTj0CczADpyTaDG4MQ+w+f5KWD?=
 =?us-ascii?Q?Y9GNAGEW+BPvp4slWrFfr+XFR42+mHuWaT9K7nqS/h7mBYsyJYFRzaiJIwtD?=
 =?us-ascii?Q?t9Cw+2P0OFOA2pdzvIitVg97/LN0wKFD4Op355K2L8Iy/7pjL0vKy25veVnT?=
 =?us-ascii?Q?gcOBWF5tHMY4IHrNYv3+Ccy7DvihZ9l95JYnvHEndYPNDkROIylutM6EZ0eq?=
 =?us-ascii?Q?vyANQTeq3D1fME+9nICV3oV9VKWgoPogCxUB/mSWC0/sad8V0qZRiw4NtYB3?=
 =?us-ascii?Q?nJYIFx9FOWI5NkxqWMzAlDEI45cEwx0WuI/C9ibcxSjNQplcsBfr5s5ofPYN?=
 =?us-ascii?Q?lVs8nVkt+lJ8ZMJakspRl607UNxjFMB35xiVOnAVPxzuIcKNcCgOT10aomh2?=
 =?us-ascii?Q?tRL8+B6H+Zr63fum1bxA+g5LLR1c8an8eKcVSRtGro1/ZVoGBHbctRMSaPWc?=
 =?us-ascii?Q?u7jX7FOaRtnecuUQzyI/hWd4cWArBRDY1cTdnm2YQ1HM6c7C1zQEQGpJ8SPV?=
 =?us-ascii?Q?UEbTNhq9NCJd38WSfu0l8GRaCcDGmimjxfsGLKi0iFWtilZ16QpEb3XXkpSK?=
 =?us-ascii?Q?UhsEoljkrjXif68JUvD++bW6yhT6XB3zKBY9dqfgouQ2NQXS8P9tT+KIIu8d?=
 =?us-ascii?Q?f1fFIoCqD2/cdRv/DEK4eIo7uvAE8MAIe2EhP/92mennMc8osJC/OaO6HE5q?=
 =?us-ascii?Q?Kfu2iwF7V5B1pNZ1ACGkKRQkQ8PLXbanP1ppTwVdjgwkeiCsAmcjvNorhnCO?=
 =?us-ascii?Q?zDZVG9BqlB1AoacIQurFxxW+q1t4/c46Ck2x3jyQMIYuzH72uexUfgt1IvIk?=
 =?us-ascii?Q?wB7y96T+fvgo/el7o3KmYqK2yLx/xAgNBuzO1rC3SoW/Um2MR7jj+RlytNAM?=
 =?us-ascii?Q?0a2JeeVSH42RGMyYmJlzCystanRgGwbQoCJh95xcOdsHD+81LNupleknf6d/?=
 =?us-ascii?Q?7ExAA06LKgfQtXX4Vic7A15sxNB1pUNnuvtPgorAUBQE8+pfeJd2nV6I2myd?=
 =?us-ascii?Q?RxyyWwRIL0CZgeGtJha1N15oVIQ7V4YM+GVboIWTm4I4BYv1jwAgD9/QEo3M?=
 =?us-ascii?Q?0AUPZel3besQRQRzjUCNqB42ZI3qsuGwQV7Di9gY/HS3J8mbyVFOMcILGxws?=
 =?us-ascii?Q?MGu3u9aX7nyHSQusUkrJJXOTEzeTez5Bjvk2IWG9VDsosP9/jY0w+OK+qvIv?=
 =?us-ascii?Q?2PzYERf7iZJt8Toj4E1dQEpJutNf1Sracgmu7yhki9TYPnGCnVeaO29jOEdH?=
 =?us-ascii?Q?heuYXPSY4rBk0tkv1bhPnaTvwjvgSrM/P2zJezDrC1gT2+/0X/O2Hej1PS9E?=
 =?us-ascii?Q?afKQcW9J5N4HTR3oleLAPskl/1OurrJUCErIDY4XEnz40ZwDNsEBfYcjhqTg?=
 =?us-ascii?Q?Z2oS5PFemBFszb5TuIQp0K7GlvJpf5evWkFyIudV/l9+CpKLOXLo8RjZtpNG?=
 =?us-ascii?Q?JIzEWr3iQ+rm9W2wPCSrZ1k1Ufef9nAP4DbtVIc4CrXKVr7mPqSNx+pyiAvW?=
 =?us-ascii?Q?DDmwRjVJYC7corJmW2UQT8JRMN7QHLIC2XKflb9Pw4yQ2Iy9Wmet3wXS08qC?=
 =?us-ascii?Q?nopgsNg12VniZw6lnVtAcFK78ZU6lSozA3AycCM6Jqa/KU2sJ0J+eK+jYVtE?=
 =?us-ascii?Q?Hx+BfixVJBq0xN3/32y35X07L5RJ2ao=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TINT7GD7/OXYS7Gukpnu3h2+omXNqGt7Y4AQ9rLRNP37u0jZpglVcAskCMbgRCx7emDWu1uQXpvNF5NZU4CfxB9Gh8G5I4qkxKLuiTYvibn4wO35pnB+BaTS4g29GpwfT4ZNgqeCuJVCH9DefC7DTQrDt02axFcp7yMVW+DTDLm4VHKJaS70Dk7qoaDv5lEnBrzMF7C8/uQU8I3YG1GakNwmi6MqjeoCIRqFW5lxiNWxxw4ICN5nWpu8/gqoPXruLuox/M0OmgqAIU9kNO7gZ1OUWmLOVmYczDCFJJLEMBx/WVS8zpTaJvZsjzCaGbXXbiBl7zK1P7quc3sz60p1qLoymecv4S6eDrZexcKagU/EaeANq18trW3kSROJg/FwD0AOj2wgUcUnmuL4+WOGeaGcGr7iJOdleupteWeoy978noq8h0iCl1n075axXKOk917oXfCExUZjXjPBWUUeR4/sKPGLmQCDNvpi87JjwJIzZioZiqR/ZrVGK5z07W6/5N3gyxRQnQwZsNkLuUCMUZmnME1bmC/2cLTslLbRNhyzSto9+uxiLHncbsoZfJ5IGTNHZMwSB1TXv4hLv7xBJtdOzpdaGAQDlQwBZkkgU2g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365bcef8-b2d8-4724-0cf9-08de73d9d1de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:20:50.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pIDsUSNBBbEEdbRLMhBHHwtC9QG2oognFI8ksnaPulWs9C1df/Pgqe4/dw2ARbRY9szaObhMsDXEk7lKwF8S5Depq6FvcUmzol0fLmFFw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2602240165
X-Authority-Analysis: v=2.4 cv=O5U0fR9W c=1 sm=1 tr=0 ts=699dfa19 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=wpu5ODVmw2F8npshYt0A:9
 a=MTAcVbZMd_8A:10 a=zgiPjhLxNE0A:10 cc=ntf awl=host:13810
X-Proofpoint-GUID: 361dM82ULZvU17ekq_QYlLqKlC2pJcSZ
X-Proofpoint-ORIG-GUID: 361dM82ULZvU17ekq_QYlLqKlC2pJcSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2NSBTYWx0ZWRfX6Eokb0vMHDDz
 gt+VLswIriZmkrkb0T/V17/FmWl9qjgkkFAK3wk28yI8EtJ+IoAba1Z7qSqPo1YdFgPwHRuCWLR
 sm1PGdXN0ZfaFQh8xX5aspPKErq0Is11hEH5PiKqe1EoKX+GXtqy2PG6K+JRMkvvxFv4qqaddgb
 52bhT29JGsElkoW1UmoLY9I9+NkIdVn/vyFhFf/6jEiHZBpoIi0WU4xG7l2lzRq6u1gSvH9Fur5
 Dc7ZNNrdCT9BAuU6zHzgV43NESqHBPWizkZEj73n/wOwXTzwA3S8osVR7woWQt8YQcfrqTYhDA0
 iT59x5wGMtBfk3I6L1fkqXwmQ11d0E2sfVwH5am4z/5vuvoBIgTv75bFKPuHZNdqeRy6I+et8t9
 ZE6kso9qKchp+zXaE0/Biw44i44Lo7xvKdw8nu0Qw806je4hEC9+Y7O2PJqLa6s9LKAHkrssdEj
 5IaogSKD7UlMxCmtjM87oru4d0WzD8tkWL8pfT90=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[ca-mkp.ca.oracle.com:server fail,oracle.onmicrosoft.com:server fail,lists.xenproject.org:server fail,oracle.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,oracle.com:email,oracle.com:dkim,ca-mkp.ca.oracle.com:mid]
X-Rspamd-Queue-Id: 83F3318BFCC
X-Rspamd-Action: no action


Juergen,

> In order to prepare checking the xenbus device status in
> xenbus_read_driver_state(), add the pointer to struct xenbus_device
> as a parameter.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI

-- 
Martin K. Petersen

