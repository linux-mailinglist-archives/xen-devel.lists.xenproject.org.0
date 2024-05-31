Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884168D6159
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 14:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733684.1140000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD13e-0007mq-F8; Fri, 31 May 2024 12:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733684.1140000; Fri, 31 May 2024 12:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD13e-0007kl-BZ; Fri, 31 May 2024 12:08:30 +0000
Received: by outflank-mailman (input) for mailman id 733684;
 Fri, 31 May 2024 12:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAP5=NC=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sD13d-0007ke-Eh
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 12:08:29 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b89db31-1f46-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 14:08:26 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V9VaPq025198; Fri, 31 May 2024 12:08:09 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8p7tx8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 12:08:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44VAB7eR006340; Fri, 31 May 2024 12:08:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yd7c89dp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 12:08:07 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 31 May
 2024 12:08:01 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 12:08:01 +0000
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
X-Inumbo-ID: 7b89db31-1f46-11ef-b4bb-af5377834399
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3DXUmnzuXbv30y?=
 =?UTF-8?Q?x5U2wKdOOuX0y4eJ9Z+Fx4zUNeqmrA8=3D;_b=3DbLik8BL1kIRcvUaO5/XX8V9?=
 =?UTF-8?Q?auvdrZNNiQ1QpwjXBt7TJhhA/sQNCAG33ljPmHc7Me5G+_rhBJMNiOG8zxys8fP?=
 =?UTF-8?Q?ShUoCMKM65Sfz7+dV1hZiRQ06txwmaDpBK9O4PYDwOK2bMkbN6E_1PJZWk1mEIB?=
 =?UTF-8?Q?mi5nwgDqHhmnCavEi4wTlRcKoDfoJ7JcQj6yKtrWD202t2BcF4xTqVUsm_Ooyi0?=
 =?UTF-8?Q?CeOo0g/zbwersyHrysPfVpapLj4B2VqAXRl2B9Mx1tLOTHbmkPMZBPGUng/4yEl?=
 =?UTF-8?Q?_62e2e3sewab+EUKNDiPligSKKLhVNsKBKF6OeKY3fL8wHHERAyG+mEv+JRL+Tw?=
 =?UTF-8?Q?0nM1tp_iA=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8Qs0KgGt5BbEcDA7zEdaSCCWaMiB1jiFB4DBE+5MABoYB/YRaG8yzzpzL6KODm4m3BtsQj8+2ddAC/We+EsqMr1oiLxua1K2uXwcZq712xPNEe14RAOwY6SCIsvBki8QdYal7zoDWazK1XMbgI1QbvEbY8XpSfV7M+Ydt1VJoim1bmYkTCS6YsLfy++can89EU6/W+Bx/8RoeKMsW1rTwKjr5CagdEFxn2i3uPSWsEqGFCmIYz15bYCUMpKn1hvgASw52fQMCbju8k800XmwYDJ7EGt4KYsQ//zgnYtVdaJ6btcrypqTEGtR2vc8wSCm5T1HqNQfEB4VuApY2aBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUmnzuXbv30yx5U2wKdOOuX0y4eJ9Z+Fx4zUNeqmrA8=;
 b=a7bmNc1VaUDsa2Wan323773RDqh75STrNUy/Ai3fVokW0bVZLgDuAh1+bpfTT3gg0WlMkxDD08QlXAjAaoa9fvcHlnaVjZ827hpIND2KsuKgTKhBQZPEHhLtA4wZ5Mhhb9z9AgPkDlGiu3P+6soYlU5V++J1Qhj0Rywm/39dDJg8dHAmO6liKpjhWVb7cEY5Jc11dPAHrA6RcMsZ3y4PIuDuL/fRwVhFU8J33mn1AOPA9XgrY4qdc8MWF/7Li33BE9UAn9d3emFweeGgtwwBWpfNOWT3fjczGEVAQ9oZBzmzmuFVoZPlvSEmwVQzXTpxAtEXjPn+wirgcMABKS1y9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUmnzuXbv30yx5U2wKdOOuX0y4eJ9Z+Fx4zUNeqmrA8=;
 b=s4mzQLWgmqgVGzkyplSKscdbfLWAsDBRdSqWbV31dFtbw1XqMsHo+CExP5E0Aqjy4430twSFlRjHMnu/JXfrQ8fubLGCYpoFHNWTzL0QJVhWVDopUGqKvPX1VnGGZkvppNH5eZWoP5UyaCCHQsY467OYoKFv3NYIC9eFyugjwpo=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: convert the SCSI ULDs to the atomic queue limits API v2
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-1-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:47:55 +0200")
Organization: Oracle Corporation
Message-ID: <yq17cfadwd0.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
Date: Fri, 31 May 2024 08:07:54 -0400
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0232.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::21) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SA1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 15231c24-f371-4dc1-49b9-08dc816a5123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KGyupYCU+JuKBi4UuVZYwz9OLjYKekpeYkYcQo/cjZHH7Kuz4PUQyhEzPk7N?=
 =?us-ascii?Q?l24tI/1dCvAMiIc1xsIcTWpz93ph9ygSHtZYuQsALfFTDd5l3esC4ekZUCqV?=
 =?us-ascii?Q?WBpMIwFIBod021ZlfCCw4O8SUgKgDqcaiIzd8LLwkCvHKxPyLOfTtcyHo3UV?=
 =?us-ascii?Q?rb2U3sUKZTjgEm3iNLxCjvU2qzhi6tum3B9P6aY5C0ZdRRYxgXzIk68Ix1Lr?=
 =?us-ascii?Q?fhxhdHYpUz41KhWATzkCaLHEnNcre7833Yt48vqDRDvzDoONmpWIzIX0iLSL?=
 =?us-ascii?Q?qufkgdADy8d3LrB6sCMRAsFbS2cPX/W2jAgJR6Hgn5j/hEoAuFf75TnOYe6N?=
 =?us-ascii?Q?nYESmNVmJARlTgoCd8vxabgcPH1MlTx9+oFmS8whNRWmOo4xgQuY/BmJFv2G?=
 =?us-ascii?Q?iEJttOCUvl5tquX14Ys+gc85j4CFgFCYUAe0p1JumX+w9ReyH+oeBzL3/kYc?=
 =?us-ascii?Q?Jysnnpv/MTJMPSFxLWt0a1dvDLOezXUUi26b0vAZZmAkBMp3eM6rj8l0JaZC?=
 =?us-ascii?Q?QXk1Ok9PdtA1vrh/3X8Lobh6JoUv8AMoFO465u59yyL4NVosgI3i+RVPz7Ax?=
 =?us-ascii?Q?6VNqQ2A5ID4hdJCpLpqeJ+eJe+vddUHBCw0a3DDrsO5WByXHWO630N7zIEL7?=
 =?us-ascii?Q?P8VZtrKD15nZKogvMS//gUmvTsh96nsAKP38sq6hAEnFFSHEk8ua+qHL0gJg?=
 =?us-ascii?Q?OxPvEnDjOX8SmHyExo3I0ndprLUUhONvjDYxRj206TS6OraXzwQuh1OgDQCq?=
 =?us-ascii?Q?nFdMktnlmjIGfEUhkOgblel8E11Ew0pyPIN8N9QjkprHTT/uB9ttlfO6WLQT?=
 =?us-ascii?Q?58IzJvrcxxhGS7/krA1VRG2/R56r4pHRws0xtCOKL4HjFYCXI3JFZyeLnUpk?=
 =?us-ascii?Q?dib20rXzdVbygFJhjy4v+pgiW3JjrfnGGJd0s2w7Y8usMOYN0FguIC9pvRyU?=
 =?us-ascii?Q?oe+quvPlk+0QXwLXoO2C315ZDA37wOkMHH2NIwaOfg6K8/tD9wbHH/lAMdXP?=
 =?us-ascii?Q?8u1fAMcDiBb5zMIMnvat7ZRq2bmw+u3mJx5YvrkPLaNlOBHnGbq0sBFXrsTq?=
 =?us-ascii?Q?dRbMVSL1dlvcx2exNyagFF1utPjgkPMFTvqJcFHHuyH5lZC9z5v4ppl0CFpE?=
 =?us-ascii?Q?5EqEvICwS3k9gPSSzFmziywHgHpDe5CyK71XHSHs6jdxD5tOL5Ggga4+Z2Bu?=
 =?us-ascii?Q?RtSdKe8ahoyvfngWM2Jw1GkBQmpDNcooUk4b81i9CtmNV2Fuuy4h316dXB/1?=
 =?us-ascii?Q?BjhMKetb2ZyZi3tI54UnhFux5O6DV4l6HuWMB3HiJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iVzbOLNXq4lTV/BnQAAh0CCD/RpGP+lD4E47LNbEGKNd8R44TGNPsgkSEwWG?=
 =?us-ascii?Q?VwjViG8vklwn1fX5t9N99TuNtPe/ETCHLCGyNHjg7ZOwxgvc1u/PyRv0QSFZ?=
 =?us-ascii?Q?pvFDLTouoK/KPHvp1LgIxPfgb00mpG7qBSYGQ8OphG1fFmhanR3nkedSwCGN?=
 =?us-ascii?Q?Y4Ozu9Z2AyV58qlLM7n+5wp2oqJounr+nKgeZTECy+svTK+RmBYPUXU13Go+?=
 =?us-ascii?Q?wNZshNXhZYS/PRvQlA2nzYlIMpc4+5tamZoFKN1nO+lpKJfoFgRoHVXNxwoF?=
 =?us-ascii?Q?Ds23YiRAcPFRGSC1xX2YVBBDAJcV+tlULpQlKIcWdoNOoTZR7ZunwK3xK6i7?=
 =?us-ascii?Q?NNn9tqEXuKVPUPy3Zl95zKkaKznjX08KXCs7H8+0CXsUIaRcbyN3CKM59jDc?=
 =?us-ascii?Q?3b3QXZsKYmlxyjT59VlzttlhcUX2X/VFWidhzASGaVzWYu/Q1ocpgtNdDJak?=
 =?us-ascii?Q?JFxQXkMXK6a+GMphJw0ih9DFIC07pxJ5sMD8GyxNwDHuETiLVrCQFNlQyrzL?=
 =?us-ascii?Q?IKAq2qG/B1QeBmqAddjALuppMVZVXHDSHKajgDbg8KtU6VT66BM35zzPyvOJ?=
 =?us-ascii?Q?1JikWTCuY8HZXeto229WBA5bLxXo5GW9CZZwMJbO7UdNfY38MKbFmfoKvLLe?=
 =?us-ascii?Q?hGLUYO9q9xNbHPP9uiQBw85FWwSvd6e0fGDK2qxLPvY7HXPIiWEBOvwvCvHl?=
 =?us-ascii?Q?U7ER08nN9yvvT2FNTjT7RNpKe9G4mxIGXisI2YMdam6hQWLMYBrz1/KNpqhx?=
 =?us-ascii?Q?0kD15tbTjPOrXmb8KCai4bmr1XRtBMGOSd77hVCoVnnYM0p/dLEs8ELtmm9J?=
 =?us-ascii?Q?/qnI8R2W4dNQvSwEmWkIc5KwYLdGRzWmWFnBR/sK85F1k19UWoUtau4FuMWQ?=
 =?us-ascii?Q?66oLUfokPSGrq8HOpaEB2NbC3ZHuCd4NP00WEJvF2Q2Me694G7W5+P1uzA27?=
 =?us-ascii?Q?nZ/A9/r+FzS01UhWmjd8mbSMFD9wDr18MS7iP1yNyYl23TCr6B2GBJpCRSt9?=
 =?us-ascii?Q?gQ8mcINFj6gV6X+ixNk3IeOXWcuoXd2D/a0P41dXPDnfbWC8qRASLqMvogIL?=
 =?us-ascii?Q?jS+IJjZt76I6MiLcIR4hbsT+Ykr9ugsOK2wPb7Iu8P9PKDpea/yTChHUQ+qf?=
 =?us-ascii?Q?nMg7daxYnSQNsyOf9ushMhKeMzLh4go+R/VC+xWGB6FzxW2r77O8NlLoIhKm?=
 =?us-ascii?Q?p+tjypG4cW0ZzZWH4+qBV2jVphahthEdVfxflshGS+t5+riIUnQB3F2aqLtF?=
 =?us-ascii?Q?fhxv65iEHO1zNK0yIPWtSohdxmwIjh2D30gkn5nre6jPGvQQYARDo3GqaoWB?=
 =?us-ascii?Q?YK464ZqYg+sfskO8Hdx/ydAvrxzj7gx3r8k6giVeelf+bmoSpBn9MMRfBOqQ?=
 =?us-ascii?Q?ASZWa9dS8XpJDNy1hu70pMbANDc+ni87Mm9N5jHiiVpITRMMNcRSoN+F7lSx?=
 =?us-ascii?Q?z9YFvj2p4hBb/6ZleS5H0nOA9NSqhvpP9Y1VZwE0Kdroimuc/BkPf41VCDPf?=
 =?us-ascii?Q?D5cRgu+7OYqwavsYqjK+dYqK9YI/N4+oAnx9Sa93CEc5DqZnXg1VJvbXitdn?=
 =?us-ascii?Q?wmDAmLWhLXbTljcZJKMdrtbRXYlbMEiXjgOf0AC2MlDlufOn4CRGMEx15L7P?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lK8IfBr1SHHVS9FF5MD6gx/516EVDlcMO/iBC6yKlIZiINYPf85/ZRz1VS2hbm1Ou63LclIjZIDbzjnj8dxekW2nTtXLZ9RI5PUOF8kR9T/O8nhE3Kduqgd120Bs5xjdtenS18qKb1r8gq8RIbeufgXOvseUvcQUx1utpCpfoLvhzf0LRd8SxUN5xfLdsppahpvF574hV5JmVFZnN3s0nZ+eST9oH5WJDZr0JyoolfrGdcdXv+riG/CTg0pfdbPLXL0loXGndYqjERFUS5Z2foaNya6R03SopQDw8oy2IiXuE6QSWVy+dIkEDxDNji6EMTzuvKn2xfXAH3XpDwpcn5TjJRYt7RtVZPDCxcSUp35S4PUfnsj3vzAWG88roVeFKu1u0xoaqz4Xxwkvwl8jhDkUlBtMn6pHqGfGpj0kTbaRtQco30hIf2aWjLJ2dyCoZkAjs6GleH2QvAPpatNGJbT25sHZ144U3syrukMvw7pBE2G02NsHdAVEp1d5KIYPq12GHH0uFbwV0QcG+WGTlOsXhTmYlPoc8W2tv8iitK1de9PgZju7IjPy6AqFhHFvktbVLmwH/drpWv9e86p7mJJctskVKYYS4Vb847ESKGw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15231c24-f371-4dc1-49b9-08dc816a5123
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 12:08:00.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKFa9LSK9YuRCEEy2m6s2lnhPchFGR//EIwv63PomuICtEESvhe6cwDAuTJL7NFj0VHKV1vov6dfKgk6pxM7aSbPKewh4HNplkS6uYmumoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=923
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310089
X-Proofpoint-ORIG-GUID: kqo-xGx4FEW29fmZBsPEc76KzvlEFz3Q
X-Proofpoint-GUID: kqo-xGx4FEW29fmZBsPEc76KzvlEFz3Q


Christoph,

> The patches are against Jens' block-6.10 tree.  Due to the amount of
> block layer changes in here, and other that will depend on it, it
> would be good if this could eventually be merged through the block
> tree, or at least a shared branch between the SCSI and block trees.

If you have other block layer changes depending on this series we'll
probably need a shared branch. I'll need to make several changes to sd.c
to fix reported issues, including a couple in the zeroing/discard
department.

No objections to your series so far. Just trying to reconcile your
changes with mine...

-- 
Martin K. Petersen	Oracle Linux Engineering

