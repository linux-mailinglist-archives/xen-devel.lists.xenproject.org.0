Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1FA31697F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83638.156142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qsp-0006Ao-54; Wed, 10 Feb 2021 14:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83638.156142; Wed, 10 Feb 2021 14:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qsp-0006AP-1Q; Wed, 10 Feb 2021 14:54:23 +0000
Received: by outflank-mailman (input) for mailman id 83638;
 Wed, 10 Feb 2021 14:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/qW=HM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l9qsn-0006AK-5a
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:54:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce0772a3-596f-4d46-a07b-2ccaf48fa9f1;
 Wed, 10 Feb 2021 14:54:18 +0000 (UTC)
Received: from AM5PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:203:90::29) by PR3PR08MB5689.eurprd08.prod.outlook.com
 (2603:10a6:102:90::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 14:54:16 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::28) by AM5PR0402CA0019.outlook.office365.com
 (2603:10a6:203:90::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Wed, 10 Feb 2021 14:54:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 14:54:16 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Wed, 10 Feb 2021 14:54:16 +0000
Received: from fe0c398f65a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0E7CD80-B764-4B47-9233-642ED3E15254.1; 
 Wed, 10 Feb 2021 14:54:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe0c398f65a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Feb 2021 14:54:08 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 14:54:07 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892%6]) with mapi id 15.20.3846.026; Wed, 10 Feb 2021
 14:54:07 +0000
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
X-Inumbo-ID: ce0772a3-596f-4d46-a07b-2ccaf48fa9f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT2L1fUBE9nlkNBPBTTteUVTdeWMoWNrWKJyimGsx7w=;
 b=XVwz+W5A1o85efI1tKE4bEVYvpi6y9E0yOeoPIpYajJTSlYI+ea0pgLA6KddiWkvZ03zoioNB0pISRmMzsZuq1EOU4eBh+uie+2NH5Wo6pTYSiLIj2rAUmqevpjiD7oeoD21DHm7NZcI7JYm8XJ7YPqzQa+WFXvWzQuy0LSTjYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61877e67ce2ba8fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfeWfZNezlDWy7bl3+JU2ilwg2KZ9RdK/jyfwL2o/MdKQ2U9DWd5beyhG44KI9cocLO9+Fdf/nIQF9VNWOEpTK7eYJJKDd0l6llssDTB8NF0tPg2dJhemA6U8OQYFTZyM3e03mw/2jcvO+CNqBhczxWYZbBJUUYdse4rY4Og93gdOd3CZvpQDx3O8IbflpwwY/JTTBLNC7veGzOxzReq19/hhd59qvcaVP/+whetn6610MxK5bh4snZmI+3+ECvsmShZAX9KdmE8I3XF3Ne4d5F9g6zYura8y4FSwHBj5+2wW31TszeOzx14RwTdoyTIecaRQQWI29wzk1aXb6xP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT2L1fUBE9nlkNBPBTTteUVTdeWMoWNrWKJyimGsx7w=;
 b=bY2Fs730fGB0bPw7zpcLdUBT5quGuQDFxS1pC6dzsjpdg5x0SyPdHAWveZum1VPCzK90qcTQm3p+RS3sKB0Q+43IdU7jyjIaBQ2DbJxtHYObyzg99DKa5u4zA4825hly63ZPf9s0VpTNELD2HPyPZ7AgM7IzjnHYXPHo91TA8OBi1fo2n/AbuzmUD54Wk4/uAnTgd5DKIKykMXwFI17LjDzANUald7gBhoCi05rw0fDni/kOHSaRruN68+Ogjsv3FMtpA2Txhfu9qpgwnBOROLmvmuFPNfM3vpZCpgxVCad3aajKjINGp1RiqsXF20KRuXfSDevZOzPDuGieEgTeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT2L1fUBE9nlkNBPBTTteUVTdeWMoWNrWKJyimGsx7w=;
 b=XVwz+W5A1o85efI1tKE4bEVYvpi6y9E0yOeoPIpYajJTSlYI+ea0pgLA6KddiWkvZ03zoioNB0pISRmMzsZuq1EOU4eBh+uie+2NH5Wo6pTYSiLIj2rAUmqevpjiD7oeoD21DHm7NZcI7JYm8XJ7YPqzQa+WFXvWzQuy0LSTjYk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "ehem+xen@m5p.com" <ehem+xen@m5p.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
Thread-Topic: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
Thread-Index: AQHW/x1qfHDypyDl2UmolBAclq6QOKpReu0A
Date: Wed, 10 Feb 2021 14:54:07 +0000
Message-ID: <8C76E543-25C1-49FD-A7B2-DB83F800AAB5@arm.com>
References: <20210209195334.21206-1-sstabellini@kernel.org>
In-Reply-To: <20210209195334.21206-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bafa2046-98da-46ab-1f63-08d8cdd3bcd8
x-ms-traffictypediagnostic: PR3PR08MB5785:|PR3PR08MB5689:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB56896591CDED69E5ACC919309D8D9@PR3PR08MB5689.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GfxZJSVf2m9/ex/SH+wEFFqrmKFa+PczWQZjCzpUp/C9SugXt3+anv+lC06UNOnRI//4c8zXmp8VRUKw0Hc5dfkiMUnTxB0uP5YnuTc4aGOFL7NCYKRmih7SB+4jnEmkJUsEEJ83OvNqc1Q81I+PdhvoQY3qAec5GsjsarnDnU3rypopOv6at9n4y6FSHaDNQLW77kUyrqrQEz/RxzmkMgU2Pteui9Kc7crwHgtu0JIT/Ld8392iQkU0GvVeUD1IBpBwWIrMjTa8EGSEsw4vfkBS81+7CqfXWoxo8zhuWgAtOYZ95sigm+2Ym/ImlDIpniZrI/RivYTYUMwvoIfr396puqHkwsJjYw+pcBNJhf8SuwNrDlwSOZouZF9ysH3XihIZP/V7bBZ6cGlBIwzB34k3ScevgL75fHgRcmX2XiRcsvSzkY8hlxi4R3zyhTwYcKrXuYl76yHbr6XoGBJsLH1PwgryRSxIJavIlI5hUqv0gPD6XLk/YN+2xaY9YeKNK7isbVBFQzHnNP4+ClNlsYY860yFeQylnFMZcutq/4qCQSpVPp8HJwCz59xt7ZwurP3SrZoQtRo5cN/rqdtjzRHQJwon9PFN2arNLPg6HfUL7rKem0V4ZHg8o9+e6cJSs6EdwJJACQ4rCTwi51YNc/v7qqXYihzYvgoEYLjNkBA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(186003)(6506007)(33656002)(6916009)(26005)(66556008)(36756003)(478600001)(2616005)(316002)(6486002)(55236004)(54906003)(71200400001)(53546011)(76116006)(66476007)(66946007)(91956017)(64756008)(66446008)(966005)(8676002)(6512007)(4326008)(8936002)(86362001)(2906002)(83380400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?Oqu07tk78c+XfhrIjHGSpLCPnEzmQloljSzwGvEslY/JREg4zrDU6PUAqLTQ?=
 =?us-ascii?Q?IyWelLeX7Ku8PyeTTgfbK/zOHloHP0Z2Q7sdD+SUzjpc9yHufYWSRa9gRRsY?=
 =?us-ascii?Q?0izHQhthIi6krDXOp9fOsdTay6os0DjkoVvNAGitCpN0C7DBt2vJueCtc8IG?=
 =?us-ascii?Q?dEgbOogM2tLJ7I9uJkeIFoM0RkVRdLXGVy2Rmut2kUBWRDW1+JvW/tuINo3b?=
 =?us-ascii?Q?ZccmAEXcGIKPjXYTfwH6nO+zP+3yutke1Trlb3Cccc/JpDGthi1Ds/Jt1Hch?=
 =?us-ascii?Q?9q0jOEetpORU3eOYrrmzhHM0CDuZLkNwTsI3aTIH/MTUJfj0i8OFJtFan7DA?=
 =?us-ascii?Q?rSsWdZacezyr2LzTlB6Uf2+JbLEN0Ba2NgJn8zdgWSaUgEXdj/yza9Tgnp7l?=
 =?us-ascii?Q?9qlssIAUVXV/qWlhPADdGcn8J7xqMgSbCV2K50PMn5JBEDPBCZ38HyjyCNXC?=
 =?us-ascii?Q?EhkA5SNnQdOJ7lF2+nGK7Hrgmy5Ar5FGfTq16t+mZQBgMl/gHLHk/Ti0YVNQ?=
 =?us-ascii?Q?asToGMct+oAVDjcsVpOGthLfTpknMDBBTJPyb3tHufA5wOVc2Lw7miAvUxkP?=
 =?us-ascii?Q?9EpA8NAy9VGr0VCYBaLykOOc9Wcbo9mqBXqqryBKVVlQhRVCU2UzZCsC0scz?=
 =?us-ascii?Q?83ipYfV8UBpSwacvmI1z3d5DA7SPjZakrzsYoOwJjtth+F/mqpNtw0r9Rsp4?=
 =?us-ascii?Q?dWimoN3EJxDXjx2xPPVJRtCo8Z1XBdmHCuwhUQA9V7LCeEwK5pzEGSWfYuUn?=
 =?us-ascii?Q?FAh0qym+ilQal0iN6pDEFzwgJb9RxwObHBgt25+EgLBSNSTGsUZ/i1HEqO0p?=
 =?us-ascii?Q?Wy4aKOetyWM5mPxt0v8QQo9KLMVQlJ/RAqlb4lCi3T7rL95u1gB1SzRcPZaH?=
 =?us-ascii?Q?d5lHJ/GMMmgduBk2Mt1MS+8k5tt77zRqWDHKagA7BgHETpF2uy+Yx74WDLQS?=
 =?us-ascii?Q?VfcWpDb1MgUgLALw8PCeqyj7y80/bggYe3Oa/fwfeTI+ye4QwZ3Gdj4Zvi7A?=
 =?us-ascii?Q?p7rPNL18SJ87yP4yA0Xda82S+SFgfxdfeSKVW9W7HaHlAjOIoLmwyZpp1X7l?=
 =?us-ascii?Q?DQWZqOnwUeoYydy89zCw3xlVQXStYRZfh1QXlZkx4IdJLHdii7GWaeBmFxHf?=
 =?us-ascii?Q?ZwiaiGn0/dBVN6Z38rNqsv5Tmm5E1ev9VVYAaQEvZMP3Q3Fc4J+PX2NgoYZj?=
 =?us-ascii?Q?QGikGAvrliZl4rmafdMldradvgy/2J50OnI1wFdrgyma8wxUVrS14+VUUD7C?=
 =?us-ascii?Q?OHScJOM1PVV8fRl2tpWrfwaccSYCrvQ0V02whZkUgWA6Zl9IF6nU5VLm1zqy?=
 =?us-ascii?Q?B8k4cRWpqHlk1f/qQAPmiVB7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41A31294881B734E9A6B2AD922E8DAAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5785
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a44bc0c7-90cf-4f47-ff59-08d8cdd3b76a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bb5yy3RZf14f6GZMp2QT5FDDf995YwsBdGgEYlkflFntyb46huOMGqdOQnjJMI78dizBt46eJQXfMD3GzWoMLGkBr0LbFO1GWq7vnt3Y/ozJsdgmn9Eo6z0mqkj2dadDWogv3QHbzK7iLgod9Kbs7o/3biykwZFCsWpDdrEnUZhteffVHolnTBTO28Jw1yMN6yQlbuVlmm5BhzAoGIkFwTYZ9zmvsgVLb+zUJzk5YpMjMbX1W/MHx3IgQSW9SWdIbiCRMajOfpigY3iFJsD9c3qK+CoVeBYneU6CWa5/VePZcL3tZ/s2rLX89h5tsV+Rc3/g1wsS9Txe5brXO7Qw/M3nov855aKMbKZKTDcnNcwZA2lGIyDc374BRnoNzOi4KK/8Pv7EOsr78OKi1mbX2v41+yqdnfg862oHiL/CPIpMdposYJUGXzG6rBpu1bdwls2LkcJqJdk6vaXAhnkYoIioD0AruZsEJLUYRx2ckT2paXH+a+Hr3vnlPk2zfhkavJJhOSyDW7BGGSFDEiDfuctzjghTMiVVrn8OXv5iYSFWXFH3CW1cBEMm2maU8Ny5giBfAXGg/PQRrwrqIzxi8R4DKI2pq/+DUxjo3sGG6JpzEQcQEB4ZSMy0gP4BhD57EfaMdxkChmav6N9stTRmLQGTdHcfUNdsL4FYlHc76BZgQF7JG4nudNSmMPw1lWAmfeoo/8edZ7eep+w84OZ/kkLZDIpg1q0HPmxZ5dukSt0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(46966006)(36840700001)(36860700001)(6506007)(55236004)(107886003)(186003)(26005)(2906002)(82740400003)(33656002)(47076005)(36756003)(82310400003)(53546011)(81166007)(8936002)(8676002)(356005)(5660300002)(70206006)(316002)(54906003)(478600001)(336012)(6512007)(83380400001)(2616005)(6486002)(86362001)(70586007)(966005)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 14:54:16.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bafa2046-98da-46ab-1f63-08d8cdd3bcd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5689

Hi Stefano,

> On 9 Feb 2021, at 19:53, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> PCI buses differ from default buses in a few important ways, so it is
> important to detect them properly. Normally, PCI buses are expected to
> have the following property:
>=20
>    device_type =3D "pci"
>=20
> In reality, it is not always the case. To handle PCI bus nodes that
> don't have the device_type property, also consider the node name: if the
> node name is "pcie" or "pci" then consider the bus as a PCI bus.
>=20
> This commit is based on the Linux kernel commit
> d1ac0002dd29 "of: address: Work around missing device_type property in
> pcie nodes".
>=20
> This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
> on their device trees:
>=20
> &pcie0 {
> 	pci@1,0 {
> 		#address-cells =3D <3>;
> 		#size-cells =3D <2>;
> 		ranges;
>=20
> 		reg =3D <0 0 0 0 0>;
>=20
> 		usb@1,0 {
> 				reg =3D <0x10000 0 0 0 0>;
> 				resets =3D <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> 		};
> 	};
> };
>=20
> The pci@1,0 node is a PCI bus. If we parse the node and its children as
> a default bus, the reg property under usb@1,0 would have to be
> interpreted as an address range mappable by the CPU, which is not the
> case and would break.
>=20
> Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com=
/
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
With the type, spaces and tab fixes already found:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks the commit message is more clear :-)

Cheers
Bertrand

> ---
> Changes in v2:
> - improve commit message
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 18825e333e..f1a96a3b90 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const =
__be32 *addr)
>  * PCI bus specific translator
>  */
>=20
> +static bool_t dt_node_is_pci(const struct dt_device_node *np)
> +{
> +    bool is_pci =3D !strcmp(np->name, "pcie") || !strcmp(np->name, "pci"=
);
> +
> +    if (is_pci)
> +        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name=
);
> +
> +    return is_pci;
> +}
> +
> static bool_t dt_bus_pci_match(const struct dt_device_node *np)
> {
>     /*
>      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen P=
CI
>      * powermacs "ht" is hypertransport
> +     *
> +     * If none of the device_type match, and that the node name is
> +     * "pcie" or "pci", accept the device as PCI (with a warning).
>      */
>     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
> -        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
> +        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
> +        dt_node_is_pci(np);
> }
>=20
> static void dt_bus_pci_count_cells(const struct dt_device_node *np,
>=20


