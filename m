Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3EC6073E4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427466.676549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloDI-0006WC-Rc; Fri, 21 Oct 2022 09:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427466.676549; Fri, 21 Oct 2022 09:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloDI-0006Sq-O4; Fri, 21 Oct 2022 09:21:12 +0000
Received: by outflank-mailman (input) for mailman id 427466;
 Fri, 21 Oct 2022 09:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oloDG-0006Sk-Gh
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:21:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16c24c4-5121-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:21:07 +0200 (CEST)
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by DBAPR08MB5655.eurprd08.prod.outlook.com (2603:10a6:10:1ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 09:20:54 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::7f) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 09:20:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 21 Oct 2022 09:20:54 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 21 Oct 2022 09:20:54 +0000
Received: from 9ec6fed39e22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99AC81E5-215A-4A45-9389-262DAA10E83F.1; 
 Fri, 21 Oct 2022 09:20:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ec6fed39e22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 09:20:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7449.eurprd08.prod.outlook.com (2603:10a6:20b:4df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 09:20:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 09:20:44 +0000
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
X-Inumbo-ID: b16c24c4-5121-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZvAgAvaUAOwpVpWI8hUaGyZkdfepUgRbE2c8mPiO6O8wT3nXggoizWtgODQwO2nojJvkTTfwBv517X3h9mKE5HV0aRVTgrzHdll5SEXiLNfhxCugqhrPqBpqrbvJyt+S6XRACcOSw6tyAubflqv4GPyHvHTNimwg7Rgp++3Z2nY5mhQTyv48pQW4jYeDW3Q5I5TdwB+l/+GjDt/WbhTgvOgFBeDi9wRj1SR1Sjnqqlt9Hz8BnR8+2usNYvMF/FBc6SPYUlZ6SrjeSeH9DrzWoLPFcDOwFVmoOBLdyPCfzljz9WoD/4vmK4wL43bv4i+odAFBJgbeJLmT1/BPhlVfnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRo9cwduNcbGQfH3paCPshEx6Ju0ep5rgG2LRB/zWkw=;
 b=I0IpfCdNf2bNF4gjy90ONzLHra8TjnBwThAFTlXBUlIOcWDBaGz2mBSFPhbRze3Xc/qA7WtTwsVM+LCwc6kSX8hrSEAwz4CoCwuE08PUn59ZFbAlLwp+sptMnMdIIErOrOFeiYIPZS+iF+w87ox5pV+Y5Ci3ekdD9hGBokaDmgOirsd17exohg5xzjAxZBYRu4ELlyZdmSlnlxIe2QEV8651daRmlcY2eqAu0IdD5J+ejNV7j2ut/0ifBmV09eqfQWHFwsXApKEmnc3yVzvL1vaRCoRN3PieF/Jca3c4ciiuCLGA+i2eHW39WW3j7bDzd7/Jd2aP56gUwtN4M3yBWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRo9cwduNcbGQfH3paCPshEx6Ju0ep5rgG2LRB/zWkw=;
 b=z32D9oA0uBzBPm9E+KFKlrHDvTliG8RimmgmVQXj0RHCzfkueb1SQ+msdpsdwLyJt+Ie8kUrFcKycLASGs78k/upqupSMAo1zDsRcNRRvC6VRuNBMzTnw6IWmx4JMAQC51kmr8uzeInBAqn+UwdKK7bpNLJmZhvJ8vZOkigbGTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR7TBROpEb1ItZ4TWgD2carUnzcDe/eg91Vv2pJQQKxmUAfeDhqalwpFo5u8pbWfVfRAQpA1QJ7I1gHKIu/pF0ozocgEt+nQoH4cy1+09Hv7apfn85dReOFkVd5TrK4qysqSjF/JIjP+tSWJmBuQH9kogASgLyqxhtdItygUECVBtPQrCNkjQ1cxeTtpj38/KDsJYSS2fMYtQcJ43GGAEvowQyhzizLkbvXvSkUgnSKdhpY/Arx6f+06kWryJl3iDwBlccLZGN3jA/gAfyGKQI/SzXwbkrYUB4qAStN5ljuQLahkz8fsGfChePnTqYARMCv7H0s8mjHYGWznRYNX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRo9cwduNcbGQfH3paCPshEx6Ju0ep5rgG2LRB/zWkw=;
 b=StR10vsICyyFPNrjqSmmHV6T14aS34Q9CssU0+wpqdsj0R+7hrLUmnoP1NBz5x/eodXgZv1SzUCo5ye7X8uB+ibDimmo9c0fMPfABjwJmyp23668qLL3vE0GQL3Y8VSY+LlebXuCsPUJI0yFVe7rexDh0KNFSsf7c6CnIkVVWPCX5Qwg67KxjIxRRYe0ZNiiq0Rk7DGY1lN8vIQ9t4aj16td3IRTh4lrlbu4ZeiHtqVSMCG/hKIuLrsSqYgLj/drWfK0il3Lozj+NMqhsfZ5ezXmvG69iawS/38MYOlAlNabUwAOycZkJ8vA1zcpLMr5LTsjbIkU+PXiJI3/BvP6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRo9cwduNcbGQfH3paCPshEx6Ju0ep5rgG2LRB/zWkw=;
 b=z32D9oA0uBzBPm9E+KFKlrHDvTliG8RimmgmVQXj0RHCzfkueb1SQ+msdpsdwLyJt+Ie8kUrFcKycLASGs78k/upqupSMAo1zDsRcNRRvC6VRuNBMzTnw6IWmx4JMAQC51kmr8uzeInBAqn+UwdKK7bpNLJmZhvJ8vZOkigbGTo=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: RE: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Thread-Topic: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Thread-Index: AQHY5RqBnzBJia4a50i9lxNo6dG1Ha4YknlQ
Date: Fri, 21 Oct 2022 09:20:44 +0000
Message-ID:
 <AS8PR08MB79915E4690AAB336937050DB922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221021065806.14316-1-jgross@suse.com>
In-Reply-To: <20221021065806.14316-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 40322221D150BB4995102D32E87D8A49.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7449:EE_|DBAEUR03FT048:EE_|DBAPR08MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c6708c-ff00-4231-e3c9-08dab3458e1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G8CXawUF/4KzphPGg8yyXtTR+eEc+UzY42/KfKWa8UjbrBdJ7bf2VUAi1M8BLc6hr0ndNTUGqwsLbRqXPLLQS3TCIqYMDiaAxze1wi4mryJC+fAC1zDCYAnm0JLWc1SWIITndbrVfbzywBZ3a+3fM3TkSOdtll8/cURPKztyzN0vhojlVAyJPe1qqMtcWJug8+aA65nyMou1LLZiaOwfhse6KuEExxN7/p/yxZmh3KHYLY66QaZ6VzYlAi6SZWeARMQNgd768KC4FjPoi81twXe/FIMu6Z8P7NKzEttE5CoIuGcwyhgGv6rs7KhFCDeAbY6DV2luUqObSFy/fMenWe1iuF2bRjzSjtPfWI2OdGbmDO1klJ+gs8Fy4SO4gck9JUFlobu3D8MNcBUgeb/Av/sA5Fqzs4OBTFvv6gxp6A0flBx3Z8Jm8VgMNhFXNo4iZYKIdjJctJwrsfKlaX1/w5Ue/UfTzdc6xf0TRNJ3nNOeGINU7MkQqW+L+cPaJuExAHuibcbg8NQuHdIpOH06JeZLEwOPbygUlYRrdPPWxRlJLuNlhrKDxdogjVh1QjvEQuayRPV/S87pNfhxMQ4nypz9VHztwXURSYmDPRaCbp4IC929i0I/RRz0Cal4MBC+n+3hqzOx+EL4SDAVYGmOSUbFL6Dz4Idtf7xdqNTo6XqfzYT/ZJJx9o3DPDKcaEWxqi6N3WOEj3pPbPHV9c8g7bMKO9+JN89M7YDRUtKCOz1pJhbTnYMk6QgwCM9Umdvbo4TUANNW/GnPXDNVcfhtew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(71200400001)(2906002)(33656002)(186003)(122000001)(478600001)(38070700005)(26005)(86362001)(66556008)(66446008)(66946007)(64756008)(66476007)(66574015)(4326008)(54906003)(38100700002)(8676002)(110136005)(76116006)(52536014)(8936002)(55016003)(6506007)(41300700001)(83380400001)(7696005)(9686003)(5660300002)(316002)(7416002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	56eb52c6-b15c-4749-0e89-08dab345884f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K4OWmAlp1fOkTJNlpMW8vcRsqXAAPAPKItGKPaBoYBOAotnHsocudGBjU8WrEN6P2iHTrQ6cvSLGoba/K0Q3M2MbqUPo4/XBkmONC9W/5ZY/s+p5N6+jLNISlbPdWXKUvkCjbImpRGnHK2xgFbMbiI1qCqhhX/C2Vr+q/KP5CV/JZrRbP94OQGivu1BPpzJpXSBmu0KXdGz2wQT69Uoa5qhH9dlipXyt4lA9HlW0GlSrM5z7T1pVnMH09Gx9Nii/rQmOP048M9egxjU5tVcxT6fV8NpBlCVwLfvbrRCKl+9FLShOy946zM+zV97OV02GvDknFPGl4uEZQTysRnWbZM//tPCjbroDaxy2h/86FtOGl7V7Pf/J5DaFMED+L96S0GkNt+KtbP6v56Xw2izDd4MYMNrxbtVFgevww9Zw0RDcuGEaRIhOadq4p0CkZXgDKw3L2CBdAiYHYaMx06Vwllb3aK9BzHGRDu9z4VjyeNL50NRKCDfLlPYV0YsT4DgOjNJKHgwhvPm/gql+YqNX1QfuYB8DqE0Ds+LshQElMTg11fOpN7Gti2QpU1nOk5BIv3Xz77gP30cgkCu3YwjmmiE/c0x3geUrTbKBkyWQ6b7NkXenxBej5JIVurXz0nGqRQ7Afj/hw4fe/pSjJ64uwQOZ92J2SvEcnjumqoH6+pGwGMjZK0dXmwelXb5rDeHwy5d+M6b1OkmTzocs0bCvIY32FPb/Ff1aRaO1SDXNl1ujmUVtAMW/ee+XXJdZqjWfLDoVUlae5EWwHEdnJjn0OQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(40480700001)(55016003)(6506007)(47076005)(33656002)(82310400005)(66574015)(81166007)(52536014)(8936002)(356005)(82740400003)(4326008)(7696005)(41300700001)(70586007)(40460700003)(70206006)(86362001)(26005)(110136005)(54906003)(9686003)(2906002)(316002)(107886003)(5660300002)(8676002)(186003)(478600001)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 09:20:54.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6708c-ff00-4231-e3c9-08dab3458e1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5655

SGkgSnVlcmdlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSC1mb3ItNC4xN10g
eGVuL3NjaGVkOiBmaXggcmVzdG9yZV92Y3B1X2FmZmluaXR5KCkgYnkgcmVtb3ZpbmcNCj4gaXQN
Cj4gDQo+IFdoZW4gdGhlIHN5c3RlbSBpcyBjb21pbmcgdXAgYWZ0ZXIgaGF2aW5nIGJlZW4gc3Vz
cGVuZGVkLA0KPiByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoKSBpcyBjYWxsZWQgZm9yIGVhY2ggZG9t
YWluIGluIG9yZGVyIHRvIGFkanVzdA0KPiB0aGUgdmNwdSdzIGFmZmluaXR5IHNldHRpbmdzIGlu
IGNhc2UgYSBjcHUgZGlkbid0IGNvbWUgdG8gbGl2ZSBhZ2Fpbi4NCj4gDQo+IFRoZSB3YXkgcmVz
dG9yZV92Y3B1X2FmZmluaXR5KCkgaXMgZG9pbmcgdGhhdCBpcyB3cm9uZywgYmVjYXVzZSB0aGUN
Cj4gc3BlY2lmaWMgc2NoZWR1bGVyIGlzbid0IGJlaW5nIGluZm9ybWVkIGFib3V0IGEgcG9zc2li
bGUgbWlncmF0aW9uIG9mDQo+IHRoZSB2Y3B1IHRvIGFub3RoZXIgY3B1LiBBZGRpdGlvbmFsbHkg
dGhlIG1pZ3JhdGlvbiBpcyBvZnRlbiBldmVuDQo+IGhhcHBlbmluZyBpZiBhbGwgY3B1cyBhcmUg
cnVubmluZyBhZ2FpbiwgYXMgaXQgaXMgZG9uZSB3aXRob3V0IGNoZWNrDQo+IHdoZXRoZXIgaXQg
aXMgcmVhbGx5IG5lZWRlZC4NCj4gDQo+IEFzIGNwdXBvb2wgbWFuYWdlbWVudCBpcyBhbHJlYWR5
IGNhbGxpbmcgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgZm9yDQo+IGNwdXMgbm90IGhhdmluZyBj
b21lIHVwIGFnYWluLCBhbmQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgaXMgdGFraW5nDQo+IGNh
cmUgb2YgZXZlbnR1YWxseSBuZWVkZWQgdmNwdSBtaWdyYXRpb24gaW4gdGhlIHByb3BlciB3YXks
IHRoZXJlIGlzDQo+IHNpbXBseSBubyBuZWVkIGZvciByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoKS4N
Cj4gDQo+IFNvIGp1c3QgcmVtb3ZlIHJlc3RvcmVfdmNwdV9hZmZpbml0eSgpIGNvbXBsZXRlbHku
DQo+IA0KPiBGaXhlczogOGE1ZDUwZGQwYjA0ICgieGVuOiBzY2hlZDogc2ltcGxpZnkgQUNQSSBT
MyByZXN1bWUgcGF0aC4iKQ0KPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpDQo+IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhl
bnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K
DQo=

