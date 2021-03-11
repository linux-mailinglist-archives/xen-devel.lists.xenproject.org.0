Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7A336FF9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96436.182435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIWq-0003AS-Js; Thu, 11 Mar 2021 10:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96436.182435; Thu, 11 Mar 2021 10:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIWq-0003A3-Gj; Thu, 11 Mar 2021 10:26:52 +0000
Received: by outflank-mailman (input) for mailman id 96436;
 Thu, 11 Mar 2021 10:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3i5=IJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lKIWp-00039y-Os
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:26:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::60e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55fd182b-1a82-4d64-b580-9ae95ffd812f;
 Thu, 11 Mar 2021 10:26:49 +0000 (UTC)
Received: from MR2P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::14) by
 PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 10:26:47 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::dc) by MR2P264CA0026.outlook.office365.com
 (2603:10a6:500::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Thu, 11 Mar 2021 10:26:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Thu, 11 Mar 2021 10:26:46 +0000
Received: ("Tessian outbound e7a0046930fb:v71");
 Thu, 11 Mar 2021 10:26:46 +0000
Received: from 885227bcc84a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75B14BD4-2501-46FB-A143-95AE2806733B.1; 
 Thu, 11 Mar 2021 10:26:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 885227bcc84a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Mar 2021 10:26:39 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3472.eurprd08.prod.outlook.com (2603:10a6:803:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 10:26:36 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 10:26:36 +0000
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
X-Inumbo-ID: 55fd182b-1a82-4d64-b580-9ae95ffd812f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuNJ2+CnWrPxceuoCyo1ZM+5HwsOBWqSU3aTw+TBMDc=;
 b=qdwgqxT7MDxMAKjxzGV3LkFEvRDP3kwhQokdqK+RmX3T2hA2mWuwIJqlH48SMuGF0Gngo47gaupHo6RrL5bNwQVBqbtEBFeW6I73k2cncNhId6Fsl/kUVNC9we4suCZ3+4DafF+nZqgOsCCFsfm/xTAT1y3/pXkjiO1y1c5BtHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1391520195a69b9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTndZl3nOnI2e/8MZmVnZzbyNqZq7+XDd0L4se0UB+oPfHP6h8+olXzB8rKfnlwOaQWqPKDs8psMmw55Jo4kkACZceHYOLH6jILOyeuz4ipxsFtK72BTnBz/R0KlYafoG1n7DdaE4b172+tpkUVAvz5f72Iq1b3My0Ll1A3cdkd722lBWBJUVjncvNQRLqke+m/6x0/knJKTouYX7oI5m2FLDHya15asx81rMkhlzfOtxnRtM1RlSZRR06psz/5+jq48QLWOTgvlo+DRbijVa3ib6BKffte1azW8Psd4BnAXpxfVB5xY7TgzQe5ZAzIuh97he/jsUmRxAeP47SuBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuNJ2+CnWrPxceuoCyo1ZM+5HwsOBWqSU3aTw+TBMDc=;
 b=HwPapKJnjRLgxoresQNDIFB2dGXeMFWjU5jzPEZbx8whmx6mWgkUNOr15okljeCflICXi3h6O6VEcoSliOIOm9Amo2KdM4n7EiILdspCG05YjZyFxMM2ngO65W2y1xyYlrrwSArgsH7u4V4YG5xRQMYK+AH55Emp/ZLl/Fz0Utj8T6LzYf+mMAtEvdwHrdBV0fxz4QVbo9rjEy0rzSBavSqnjfLG30dMihHOU90hYZVQqJgIGQURMEhN3DT8BlMvHb+XwdkyVGUU8m6AWnHzNTxUBYWeC0LJeilJPeXbhbchbCMLkte4Q++exqDi7UZePBX5QWyIcySfSQjiJjlyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuNJ2+CnWrPxceuoCyo1ZM+5HwsOBWqSU3aTw+TBMDc=;
 b=qdwgqxT7MDxMAKjxzGV3LkFEvRDP3kwhQokdqK+RmX3T2hA2mWuwIJqlH48SMuGF0Gngo47gaupHo6RrL5bNwQVBqbtEBFeW6I73k2cncNhId6Fsl/kUVNC9we4suCZ3+4DafF+nZqgOsCCFsfm/xTAT1y3/pXkjiO1y1c5BtHI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Topic: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Index: AQHXFFQNaLCX4oSw+0OC1jGtjtl2z6p7f0oAgAA8pICAAtmcgIAAA9UA
Date: Thu, 11 Mar 2021 10:26:36 +0000
Message-ID: <6CB45CBC-81CF-4855-9B6D-DAA0BC3E4057@arm.com>
References:
 <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
 <5bb482ff-a689-67e3-1bc7-30b9bf24034e@suse.com>
 <70193A3D-F169-41C3-96AF-D2C35ADAF1C9@arm.com>
 <6aa28aef-1d0e-393e-a9b8-c6b24cd19eb8@xen.org>
In-Reply-To: <6aa28aef-1d0e-393e-a9b8-c6b24cd19eb8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.243.24.187]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db3aea9a-a456-4fc9-825f-08d8e4782c7d
x-ms-traffictypediagnostic: VI1PR08MB3472:|PAXPR08MB6511:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB65110CCDC04FADD9F979A3479D909@PAXPR08MB6511.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6NTiwWNjQCRfkhKCY41/ZvMpKpbhiRYCNy4GKhCu+k5M0ubB/mMTVb+lgaE2REJn8Emc7jrl7nq3mWgAvXIb6SkRDQOfLCDfpi1Xn56ZfMzun4LugDS4qEifs2Fhcq5blwqOmaqUdwrLPWOTYXUBTHSqu0aNW7CIuoY9DHij7wF4GCml9bXyKhvOWtdobaJ1QhbzXrEMKdpZ6fBP994SoaAQVUXC82RY97a7Pi88mvpnOCmJUsc2SYZziKiaOZQYUihBpDpxDnOB7GobDT273fGf/R/0puPE0XaMgz0HDweZr6voWJH/ojvPYMPsfNHIIQxoi+7peDlr5elmZ8pNAxn1a1fOj+VNpijvbR/3lmsFI4QADxeYVdRlUhPP4yodUdbMZ6vAkXTRVotm7M3WGXelMBYk/u96pxY2f/3C/NBzC7p0thClMsru46BaKLnjqF1VRpQBwOGoQxYwuQDEFd06bhvjvX7FZF4rXtugnkBfgjq4hs4nNIAFRYv0XuoA6fPYfpLLCInvfRI2E1+N/szSB5uKF1xV816F/roXbaSPoHtw1/AJ3+I7Kuf1Ug4GijtTKDiVE47bwSEJN5oIOg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(91956017)(4326008)(5660300002)(316002)(6512007)(66556008)(66446008)(36756003)(83380400001)(33656002)(66946007)(186003)(26005)(76116006)(64756008)(86362001)(478600001)(71200400001)(6486002)(53546011)(2616005)(8936002)(54906003)(2906002)(8676002)(6916009)(66476007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?QO9+mveASftCvCQSouooqpK491gi2V2E5pauPvOxndrO/TOpavXlcluRMgDv?=
 =?us-ascii?Q?MvPJVTRQydDNm8tOO1D6l43i/TDIe5jPR/z/uTbsL9qSJrLoKPvuYHSt2U3g?=
 =?us-ascii?Q?5Y52avEPfSqlEGxxrVGBwApsD7ePRygB7KRr3+X6dZCzSxrM19MQt2Zon1G3?=
 =?us-ascii?Q?D7+TrLmiP+PVy0zRRdtz3E+7DedOSy7g5Xo43mnsngf6Uf/04z2c/cEATeDE?=
 =?us-ascii?Q?8vTyd4n6kBIrP8GgR/sSN3D8JdTRg0Is0dZLphP0EVgSIcf73PaRh4sUwDpU?=
 =?us-ascii?Q?fWmSDoWY5SZFDZulmnYxaqnmgfrQUbtfNiscsYWDeLYG2rM6GTf4SzHssM82?=
 =?us-ascii?Q?TOF9dcF50W7fjJLpgzYmkJ1YjUFpoqne+Mwg0pgTCU2fMt+re2kUtX8Y10H9?=
 =?us-ascii?Q?XHb2rp4d+8l4Ql/Q1SwrtZWN8jYjejB7sBdsCdh8E8y1X4CjxTloQf2uMA2y?=
 =?us-ascii?Q?kudgtQoVa8EBgwO2i/xOxIjk0VQHxZ4xshXFUHQGYjwgSWxB0dv9pH3YK0Lq?=
 =?us-ascii?Q?mZYmbz5WqIRxm+Z7UbLmHDvRuT8mZPGgVnJy/zpk7K9tLo4Z5d9f2L+i2RrV?=
 =?us-ascii?Q?ZhgR5vskJLWs0zGD6xviybnLSTQO7sspiSLske2YhcNvbei8j70uR2VfPmFK?=
 =?us-ascii?Q?F1zZ56EYD6tUl3q9W4CRFrWPP6tWm3NHzQlUdmv7E032Hs3oXb0Dr92ytHc1?=
 =?us-ascii?Q?k5+FXWkDpMIHcWk1flussSG96bpvfNcO2DqzjbvKYKZQTdIUhbS5k2uo6KoE?=
 =?us-ascii?Q?SiUtHdrDcBXABsnGi+6X34u14D72plbvwHivUy+CTEkm3pV6B0icjVgWwBCz?=
 =?us-ascii?Q?70NRroiNpO78IuRgxWUoZI4LgOUQPdRzwVP+6fgRvVxVt9rj48Z5X+dNs0nm?=
 =?us-ascii?Q?38KaUVqfLshjlhCESS+EFUgdWLWnky9vs3dYHhKh4CWa+VdqutmQvKJiDEzC?=
 =?us-ascii?Q?g+4LSgbwyt1YexiGuhvaAz42weC1XMTWzxLrszL7dK1WqaTMi9YmD/CImMFY?=
 =?us-ascii?Q?MqvnPg0s1c8rwFq45ncRSCDKne2mA122rCmDjJWEH4pUREmyQJWCDPOxCxkg?=
 =?us-ascii?Q?1ox3Bfll3UfVZSb0cuobSIjAE7TdJ4xLTJWBFE/Pjpw27X1sHGxHELe5OdZy?=
 =?us-ascii?Q?zgeqRxGIIpllIAjJSHzhY+oIHMF8lxVWp4nQoLYhZEw5aFm5XNTYguoEGm26?=
 =?us-ascii?Q?cckqC2x0T8oKI0cXFL2MTdwdUC3Ay3nK/9p6Scshf5fazVLp1bS3PIahbPPU?=
 =?us-ascii?Q?zwrMCKmhkhCENY51Bwb7aGGM2wrrxCO+/NCb2RQ+3fnWA39w6FlfLEtA2jX4?=
 =?us-ascii?Q?Qip6RsrrF3JBZzoUGcUaZ0G9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F14735A9F0607E479D0AB0AB7BF39E85@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3472
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fe050d2-cd09-41df-b713-08d8e478267d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QFfJfK+jcY8G9T47W4hsU3G2AknJIkAqUWtE/7YC1CqwDm7ROVhylpY81tDnIP+nW2PW12GFExpc9XUw34snlB8x8dXvK8l9PlU5cQNHZE+vl3PDYlqTexRYHBGeRonkjdirMRxx15pZ4brgI+p6o7aMAvWDjBWZvwd4wfXzvG6ksc4ElbQla417UtRNmdBJcuNqy5DDAkk0Ni18xpkz1SvgYA/Rg8Uwc5JV/JkVfmWP8XEfDXexpnttb9uAyBCXuegN92pPiG7LHimzs0OT3pjBvAVCHXFkr9Qw9b7ubDmeDVvbFC/6OhpLjM2Ecz80dN0SmvE2E6od7Prz/W05ETOg316oZeAZShcBP7Ezhe6S4o81k0RTTgJLkHqiEXtQFzCxYxFqvZJS/wwYfKRBvjutdwpViA5eaiDWQL7lSd5kb5XgL2IfkhAvyVkuFgwoujEWLJvM3mRQrHRx6JAk8cScXDeIrvIsjGDW4jPNGjT6h/L7cI3z9DW9JV2h4U41NbxcTrLbwilerseMk150HWkfZqK3anlisWsQh43MvP6y/UioE4IjCKmj8vfCAKX1DV/YKms5fGQmtmeAazbKFFyJ1vo7SmJdL94KemoVkktmtdNvisyX1YDleW6Ct1H1+021nckgACvn8j1SMHspMvFaNVvD1onAwKjSAMMMGcQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(8676002)(82740400003)(70206006)(336012)(26005)(8936002)(70586007)(81166007)(6512007)(2616005)(2906002)(6862004)(356005)(186003)(36756003)(6486002)(478600001)(54906003)(47076005)(82310400003)(86362001)(6506007)(53546011)(83380400001)(33656002)(316002)(5660300002)(36860700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 10:26:46.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3aea9a-a456-4fc9-825f-08d8e4782c7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511

Hi Julien,

> On 11 Mar 2021, at 11:12, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/03/2021 14:41, Bertrand Marquis wrote:
>>> On 9 Mar 2021, at 12:04, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 08.03.2021 20:48, Julien Grall wrote:
>>>> On 08/03/2021 17:18, Bertrand Marquis wrote:
>>>>> --- a/xen/arch/arm/smpboot.c
>>>>> +++ b/xen/arch/arm/smpboot.c
>>>>> @@ -321,7 +321,8 @@ void start_secondary(void)
>>>>>      if ( !opt_hmp_unsafe &&
>>>>>           current_cpu_data.midr.bits !=3D boot_cpu_data.midr.bits )
>>>>>      {
>>>>> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU=
 MIDR (0x%x),\n"
>>>>> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not ma=
tch boot "
>>>>> +               "CPU MIDR (0x%"PRIregister"),\n"
>>>>=20
>>>> For printk messages, we don't tend to split it like that (even for mor=
e
>>>> than 80 characters one). Instead, the preferred approach is:
>>>>=20
>>>> printk(XENLOG_ERR
>>>>        "line 1\n"
>>>>        "line 2\n")
>>>=20
>>> Except of course you want to repeat XENLOG_ERR for the 2nd line.
>=20
> Interesting, I always thought a single XENLOG_* was enough for multi-line=
 in the same printk.
>=20
>> Very right.
>> @Julien: feel free to tell me if you want a v2.
>=20
> I would prefer if you resend a v2.

Sure i will do that.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


