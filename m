Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A365EBBB2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 09:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412289.655541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od5Ab-0003jJ-C3; Tue, 27 Sep 2022 07:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412289.655541; Tue, 27 Sep 2022 07:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od5Ab-0003hP-8o; Tue, 27 Sep 2022 07:38:21 +0000
Received: by outflank-mailman (input) for mailman id 412289;
 Tue, 27 Sep 2022 07:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/4/=Z6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1od5Aa-0003gn-8l
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 07:38:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aac91ba-3e37-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 09:38:19 +0200 (CEST)
Received: from FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::15)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 07:38:14 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::ed) by FR0P281CA0142.outlook.office365.com
 (2603:10a6:d10:96::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 07:38:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 07:38:14 +0000
Received: ("Tessian outbound 88978e6d60db:v124");
 Tue, 27 Sep 2022 07:38:13 +0000
Received: from 425fed93396e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B07F808-6306-4788-8540-DCD43CDE2541.1; 
 Tue, 27 Sep 2022 07:38:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 425fed93396e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 07:38:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8061.eurprd08.prod.outlook.com (2603:10a6:20b:54a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 07:38:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 07:38:06 +0000
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
X-Inumbo-ID: 5aac91ba-3e37-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TsTtju7eGcpFykBJ5Q5gFecDg4U+SewgWiSGv6Nf7vOzXXuD3VqHEurabX3Hiz/Vo6kxnUe+wp/4v2D/PJ+nDFGb0AxZDkZJ6l7pNrMNPZuhjA3zfjSksy8SbIrJ0eXRGLHa8oEky+TM49kBTr5OSmBdIhotyD/tZV+P3fRjqUHGb3olTdc7MCuzc07GMW6TkqXmgoAju7yzG9voCVCQFoACGKD8z9vPc+e4sEkMVeH642dRQPOfEmtnN2P8oZAWw68dnQ/5N8bcB/hyvsToBkdlkR/BY86LOY+ui4HBvNWN7qa5jmEaob9BqsgenUacOV8eDX4Q23kRxr5VDZSHvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht4I+0YeiDPP0phOBIYrPc5ciYwDby1Kk4WiJzg+0og=;
 b=a0TtyYT2nuGhDZjGCnhlgxIo4/Z0GHsDwEghmI6BwZCRoYhNWuBMBBHwNxQ4xwUKq1erFgE9dnHlXNdVl4XkGmUKXtej5FJajH3JOYHTPvaqzkD7GyNemrqSb7p5z1G8UBg7xTIWPLHdmrJXjZ+uQGCuPpqtMbjgDcZP62yDLVmVSMYjGOAsdesNelMvksGTXRQsRplJnh+XHG+bF78hz4hNKwgKFccqgog0rJZLsxkT9zBG/Q3KO8WjxcLsDUxofDbz/5QyWXFJKevCnb+s6JhfSEYVqWKQMgfuRyONYGXq0z0jDYEAaa9iDQEgzeVXotmhI04gxvpEartxYVk/lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht4I+0YeiDPP0phOBIYrPc5ciYwDby1Kk4WiJzg+0og=;
 b=KfQM6rm42QKeHzcLnXdkcXY3I6Mm4DFcmv1xxDYOkDLkwuQxJ85DI5XmO422GJ6vz8cViexobr9i6Fn37ZXk6cqfh6Xh6ehBXjwkcdnpYpaL53sPpBMyPkdxgltzTgt3Qf2fyG1Foy19HmGQhD5QykkPZwGeQaVpBuMC/7e+z3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg/NnedCeHB6+P6rjkd3rAUn6U2KHa2Eif6fxoejogIwOr3U5rnRs3qFyZ5kgk4GsRWByCGxp+Dh79vczWzVswZzQurCdxI9ZDuIv8buTtiqNXSohUmEWSJkRaC2rV50xZ4iqF1hJqIdNcSeGgJhTIFr3MNp+Jfr+2EQC09yInNug+XLwxqK0gqVv9O44XvDn1q3Va7es2Gj9NV0ADhNAEeAnCCVGmHm97mjm2zJZWq0vvz3siLFkaSBesP2xImsQbnxLtM7OHxEHzaSznBGrYmKnFgKUf1T59de/LNoo0Fjso4dkolqiqirQ0AVIiszFKtH+3scKJK/sF01CYuMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht4I+0YeiDPP0phOBIYrPc5ciYwDby1Kk4WiJzg+0og=;
 b=n8zz4y1qjqFefBLL1+ObXiNJm6eVVrkGwaLkmBz1i2HVlcNKSvZzFLJr9Fx1ppYld3BFWbEwaPMmYwOxcgCUnhk8wgDP6VPV3YRYDtsSBoSLIltZJjTila8jChsOFj2qusl1HF+NtIvL6z5tcJnlKNtYltGhWKcMHzuo39S5NcmnWBcyjbjgzjTqzP3pcEwmnoErPydvcYYMfMDmi9RaovSDD1TNWkc5z/hTu3bcMgN3vh+smyBYXB4G7kiBja5iKwx9ojZUcC5lPBNaJTx1IKjk86ADx3z4DCXy814pRqqjJvd9kjO2iWDpH3Iwmp0Z3VA9H5zABGr5CJjGJ5Q1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht4I+0YeiDPP0phOBIYrPc5ciYwDby1Kk4WiJzg+0og=;
 b=KfQM6rm42QKeHzcLnXdkcXY3I6Mm4DFcmv1xxDYOkDLkwuQxJ85DI5XmO422GJ6vz8cViexobr9i6Fn37ZXk6cqfh6Xh6ehBXjwkcdnpYpaL53sPpBMyPkdxgltzTgt3Qf2fyG1Foy19HmGQhD5QykkPZwGeQaVpBuMC/7e+z3Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [for-4.17 v2] xen/arm: domain_build: Always print the static
 shared memory region
Thread-Topic: [for-4.17 v2] xen/arm: domain_build: Always print the static
 shared memory region
Thread-Index: AQHYzFcKT/X2LltF0EuIADJGc5zC763y7yBg
Date: Tue, 27 Sep 2022 07:38:06 +0000
Message-ID:
 <AS8PR08MB7991B0883D05C3AF6C56760A92559@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220919183737.14067-1-michal.orzel@amd.com>
In-Reply-To: <20220919183737.14067-1-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D9304B1C3367F44BB4DD03AED5985DD3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8061:EE_|VE1EUR03FT009:EE_|AM7PR08MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ced3e5-a5bd-43fd-ffde-08daa05b3c5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 llFFmXZJN0EIrODkI7kj9dUYK2RYJ+rQulSMIWrR0Zz9f0LU2qEkJQlxab2nwIdo1dV0qFuu6J2NbFbyyiEEolUeaipcc/h1wAW8O87xZG4sUKb57I0G9IKpLEl/yqoB/3GIZ8MpFyoe6/zVPKC/e21n2dUNMOcTB0nLQZrS16fo8FxMlxqNDwAdknqiYjiyLxKt8iulb9SHzb6IJfeP2HC8fkfMr79qinovb1rpy7Uzzc+CTFz/4dW6qGOWAZv+yuoKR5yQrZYkGRJTO4+P4LgPUN1SgTTDMuk5BGP18Lc/0xx7MXHhqC2s9+oxh2MFdShebuHcZp92ww+cyaUdNRuo9OKDt9LzJihRv4FaOPKBLUofqwkrxpH3YmK8ZCCQZ/1KWzq4PA15x/YIdg40aRxF266ukU2rwVg+8Wwr3FAAFUfQge5K0S3gPMygeLxToHB2YNm+i04Sdg8N1sdAu17DPCl8qlfJcRs4jD5W7r8OBY6OwyhAjOLy+iznzwzYgdLJcFh+K+KvusEVGcqgeQ1ZfNeJCyloead+MK2SKFdj5TQNT8b/bwJ6mOtorChhQvXHk+nfOU4qgZbRjM5h4BnzRbsO7Rx3jMv2ck2cyh+KdOa8lsCtttL1AaWL4v/NbPC8V9zK/+WC7hGZnwLZfRMR+Ri6YpnmbxZroLhU4mNponXzzQ4l8jcxU6EB30OZjazzqF1aIEJGY0WS0DsbmwtPRJnIaPZDyOki2h/SK77mcQa6mhEuCfBtZNklqlb3PFyilDeyhzYS9GuDAzi9zA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(33656002)(71200400001)(38070700005)(2906002)(478600001)(86362001)(110136005)(64756008)(186003)(54906003)(316002)(4326008)(41300700001)(66556008)(8676002)(76116006)(66476007)(66446008)(55016003)(66946007)(8936002)(52536014)(6506007)(122000001)(9686003)(7696005)(5660300002)(83380400001)(38100700002)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65fe047e-7c1c-41bc-0545-08daa05b3793
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/3/mavm1mW+gLcJopDDtXxgQYKphBkNNUBx0I8qHttoK2bMWW/smf732fIbY83vdGhe5/3iOTx9arqsVYMJmY0VINJe/uTpTm9yOsATyKTwurP34CbUvjvtM1V7567wnSmUcbYtPUt/aIWxdWNGTKix9ZwdtfEqFIN6cNsJ0leXep+1UwTGAUx1e71oe/VliYJ+BI/SeG6G/qESD966zlSm7uLQC4Pm0TWVE49j63I2l9YtoHj23Ulusv26JLhjiwIYQhbWimDW9Ar0MKSns1K3ow+ZVSwmAdkwI6/ae16YCkBabc5YIB56LhvJ9ZMjNfTv4y8Nw835HTsPFrp3Z9oCWy7R0B61cB3EyYg0Xm3857LFbnX2ep+cchVTfJ6iJuxDrM5H1IIH7vo+1wMwLjHlG6kQCShHBOF38/Ke7TkvwmuxEV+TXHKMgQkz/6QVzYci7IkMjL2S6iu86fmw3l227J2bWSCxnC+4HqpKWV+CE8Q5cGi74qjfxfat5i6qGZrM/ZQvywQrLvhrLuPmFcX9oyYhWB2VgPhOCinMT8Ce6lRikld5RZN9RaLoJCOjj2c2Y9ICNbbUO5ifAJ1DvgYL80evXOhEk/vr4YdkohcPsTsR6cupU6D3ll0Tn1bFR1FRn23e3xRD9K4dUq7NP9hPBmxvoxf4hviZoLoBB8wWalFF6WG9JrqwUuW0id/V05SFKYVc++o7DAOKobPXOzAGWta9ALAblUIzHUH1fXt7ANS6t5YEwPvT78d1oVmUrUc6ldv5bmIq8jHfZcMDe+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(336012)(9686003)(26005)(82740400003)(107886003)(8676002)(4326008)(83380400001)(70586007)(54906003)(110136005)(81166007)(6506007)(7696005)(33656002)(41300700001)(356005)(40460700003)(70206006)(478600001)(86362001)(316002)(36860700001)(2906002)(186003)(82310400005)(52536014)(5660300002)(55016003)(40480700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:38:14.0645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ced3e5-a5bd-43fd-ffde-08daa05b3c5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416

Hi Michal,

> -----Original Message-----
> Subject: [for-4.17 v2] xen/arm: domain_build: Always print the static sha=
red
> memory region
>=20
> At the moment, the information about allocating static shared memory
> region is only printed during the debug build. This information can also
> be helpful for the end user (which may not be the same as the person
> building the package), so switch to printk(). Also drop XENLOG_INFO to be
> consistent with other printk() used to print the domain information.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> The other motivation for this patch is to be consistent with regards
> to the format of the informative logs. We do not really use dprintk with
> XENLOG_INFO unconditionally as it results in printing additionally filena=
me
> and line number which may be misleading for someone reading the boot log.
> Such extra information is helpful on error conditions to make the process
> of debugging easier.
>=20
> Rationale for taking this patch for 4.17:
> Useful information printed always instead of only during the debug build.

Sorry for the late response.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Changes in v2:
> - use different argumentation
> - drop XENLOG_INFO
> ---
>  xen/arch/arm/domain_build.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


