Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B651826E
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319443.539689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpt2-0001bN-Oi; Tue, 03 May 2022 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319443.539689; Tue, 03 May 2022 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpt2-0001ZN-LO; Tue, 03 May 2022 10:36:08 +0000
Received: by outflank-mailman (input) for mailman id 319443;
 Tue, 03 May 2022 10:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlpt0-0001ZA-Ej
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:36:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe05::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d347e32d-cacc-11ec-a406-831a346695d4;
 Tue, 03 May 2022 12:36:01 +0200 (CEST)
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by DB6PR08MB2696.eurprd08.prod.outlook.com (2603:10a6:6:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.19; Tue, 3 May
 2022 10:35:58 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::4f) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Tue, 3 May 2022 10:35:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 10:35:54 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 03 May 2022 10:35:54 +0000
Received: from dbe7acea0ee4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5F285E8-CDE6-4F13-A4D6-C52BF4CC8441.1; 
 Tue, 03 May 2022 10:35:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbe7acea0ee4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 10:35:43 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB8PR08MB4202.eurprd08.prod.outlook.com (2603:10a6:10:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:35:41 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:35:41 +0000
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
X-Inumbo-ID: d347e32d-cacc-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nK+6NvZKF9IcW8tCYf2S9vKnsju6mqpy1b6a85S/7kCWLwxLdDRwJRpjg+e5zTYEIbCxsVSvA3l0kTvMkyPpC0CXi7keXOgeHgi1tX1KRsN6zCBETS9sAl12EiBYiyrm3fxRAQvTpzDRrtECaWLYyi84FZP9AsaJK82TWlkktjyzMPYYHdc6CT26Z+OYFA68HH8YItU/LeF54jmuL0G6KVVEBZz+v/KdbaTqM5vvHw5KBsr0F1No+cE88c756fJOH+mcuqx2S60sTCVAEISyLZveIF3+Hiov1mObfvKcS6KVjtqtrkHtjlA3AXX/YQp/8AepRoBf2F8iib0X7uTEtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6fPKBGCmWAE4eoa1e9a6TKRDE7GnuJqC+L/TFTZxIk=;
 b=J+delUQHSH0xgtK8nnANipgPF73hEkWmkQAaEdY1K+tlh7djZ0ZhTOzSNEWwt928ChxfVJSzW3sRuQsqh2bH0c/0+DMH0pXxWw6RBFTGF6pP/0Ymqo5k0S6ZrK+lu/J0N6G/x8H/Shs8zbVRJLLDFVuTFmfQYU1bW7mAwbLRHr6CeIslIHedt3Ka0RmABZPnHzTGH+Me2s9Pv3kKH5F8pMwwcDpJ0Hcb/Fsw8S0lMPdDs81UTgBG67/0hVwVcKlBDzyAdhXo5aNAvi+4RWCFbbJ4UPZ6Gd67gMQ/xGZfAbvIiK57O+nBP+8moakmnu65otWm7OjK3agwcvVHEJkTDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6fPKBGCmWAE4eoa1e9a6TKRDE7GnuJqC+L/TFTZxIk=;
 b=yT+GXlG+PyjaNkmcnUpgs6ahloBSQCVNJpxro55J5UzXevF/9iISO1a3dxs6T5PAv+MXtT1Ty2wpywaaOsASbxeTGgnWREl82e2k3LOOBQkkDWV9pxrrVIwerwTWNjBJWHKy/A+lJHg36r/AxhN3PpOcil02DqW0OobKnsNb/x8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a083bb7507223bf3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR2M2z+bPf4oP9f0UQPNbpQaUs8GxDoya5nHq/GUAMVCTz5FRonk91IyeCE18neEIdB4LeOeP6bIHi2/6wf3MLhGhs9bJd3opLx2V01GiZcU9MpEo5rLBmO0Fr2M2zquwQbj3wBNYbnOZNzNArFVM4tMD3fYa1uVO1UGw+NCpRPsS+WyuFs9Iw+NXNckNS9kpybwc00L9wG6/rY3Lqd28THzaUPEuuYNc6XMfeOBvrivGoykdnjsF6nibEYlpt3jklwVIUxXniMXz1xKqVKnDr8i/BfCGumLDZlI4gjeZaRakAl6QPIJdddUJ26z8OVyfzf9iOh31qHZNgUHjGhXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6fPKBGCmWAE4eoa1e9a6TKRDE7GnuJqC+L/TFTZxIk=;
 b=Q8EWEbMCTC3lFogtCnO0yNGjYaX7BehBCxoCfqLJ4khWHEA/2xXwno42OQdq0m8saqAtp5K2qWtMK2YyWz0fv9snK6VatmQvp49DsIZGI8jEwidcfYtmnQJXcy2CcQWebR98+pRJuXxKlWCz4400zTeXXeXcp7FNTlk8G3usVtSBL69Pxtyti26lyLPzB6HAsJY9ekDxJ3siO3fVdV2nJHBcqzLX2WHM45TZmm59v3gUHhJDg9UQeLyl3IcZaJfdp3xeqxHC5lbcea98E//Iqrb9whkuvyjQkE2EPJD7wyriZ3NuQygeWs7jix0i4R7LB9gxmdSVIIDj8YV8IYCSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6fPKBGCmWAE4eoa1e9a6TKRDE7GnuJqC+L/TFTZxIk=;
 b=yT+GXlG+PyjaNkmcnUpgs6ahloBSQCVNJpxro55J5UzXevF/9iISO1a3dxs6T5PAv+MXtT1Ty2wpywaaOsASbxeTGgnWREl82e2k3LOOBQkkDWV9pxrrVIwerwTWNjBJWHKy/A+lJHg36r/AxhN3PpOcil02DqW0OobKnsNb/x8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 7/7] docs: document dom0less + PV drivers
Thread-Topic: [PATCH v5 7/7] docs: document dom0less + PV drivers
Thread-Index: AQHYXAvORBZMXv5aPUSsbnB/Fi2OYK0M+vkA
Date: Tue, 3 May 2022 10:35:41 +0000
Message-ID: <3072B061-DFB3-4D43-90F4-9964C648B96A@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-7-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-7-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b8a45150-6ade-4d97-98dc-08da2cf0b3c3
x-ms-traffictypediagnostic:
	DB8PR08MB4202:EE_|AM5EUR03FT029:EE_|DB6PR08MB2696:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB269649CB9AAE1D45EC28AB5FE4C09@DB6PR08MB2696.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TUH5ESABLR6jdEaW6rlupNAUFmCLZYeMQVIT8aPnxJrrCSab69uePNxvY1aG8X3ZXzyhXx/mzQsEBVeScq2oUFvgfBJqS2WMLUw3R2T3rdK47QT7SP8aSWtqkv2pL07m/zoiuByQvQjNb30mMQDUvVIIPE5xj0MIyNXqCCmYE+KhLzoNZjRHA+5oSKMdqa7jiENCEzrq8sk7o2oIyJow0ykKK7JcFqcF5od2oS3f9ljzPUY1X2i88O6Yq7Q33YhlpzRyo0z1tq8W70QgYmnLqxifSDGi8igiY3gfixOwDYFr2ERwPr0yts9KUJc0LnNg4pJaI+Y6t+6mdD8LhjolDou86kmXrLxS3Xo4k+/D5FoGesa1FCJURnDCNfg/Ul/qjl+KSFMOKzjlXi8i+c982t8k9gecR8fZ5nk3zZWmncvYyVzBKoP2dbn6uWIRhnNom5gKozbodtqJ4Ud4YTNHguKwJOj2mqWTGP33KtNrQcoPO6xwZ/KE7t/ZNN33n7pPso2tOopuNbUHEkNvgSOlhYy2GtcZ+nmuHo0KG7FBh4WOFxME9qx/r1xT5xMcYqQWopQ1slfHulwVaIPnSBEBGGIxuUqSShhdPUkBa0nKbDZXFkJUaC3s+7bVWD2EOhPg4dm9xhQQTDmvKG6xxjesk61k/ltN1b+Z2W0KkPg0Q3C5MjCpPCugY6XIiy0ULPKEteyQC35sXJD99yu5yiAgvCaSTYN6XxuJpwLprNX1O/klr/RboagyRlinU2+fuOcI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(38100700002)(38070700005)(33656002)(6486002)(316002)(2906002)(6916009)(36756003)(71200400001)(2616005)(186003)(53546011)(6506007)(6512007)(26005)(8936002)(8676002)(64756008)(66476007)(66556008)(66446008)(66946007)(4326008)(76116006)(122000001)(54906003)(558084003)(86362001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6957AF10B9B40A428B91A3367914715F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b38039d3-6ed6-46c9-6469-08da2cf0abd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mnrghk+pgHzd7jw2GwZ57ugolhQ1elDEz2AGYYfgTL1gGFT4vPH2g/jF6hpyAHzO3C5yp6nICiOVZJsd+IWeiVtvIEBaqdToLR73cLxOArPxnpD00Q1W7Nppamdg4qDAmqxgRuXihkwcEJHKXGgH+9I/Aweib8fkHgg49iig9VIcLKJziQm0EEAFPTAm5RMSACIq29sGyRZwN5sCrtNLYbbrtuA+AlD0Jv86MchPnfWDAj0ZfXMu51bNLdsFRooGAQcyglxTtUa10MInqBzf2kWtkEmNMXHJCLnjPUMGIfeFYSdP6LjuhMoM5fPz4duxrsnzeyIaHc8kf8iKRwrTf8v+bZvEuF/97QtuGB8Fg0K82TkL6cjuW/NOX2fsVaq/4v42NQqlNjpktH9y0myBsUQoRrqp3yIyR6aAs3pxYx7RZZRsz/DDD2Ib6Mys7Tuy7FCw5TtAWw7wpijxSL5an1B5eg+croq95S8p/vnltaw7F5p77CnWu8K731NAqLUu3vDBZ12byJ2VituxYepjleSgO0yue6bdDgPvmcWWKSoQMFnkDuAfxvtk9DEk73CIxIH7gIWVqS42fKPzeZqxvEqEGvKrY8uK1wsm/6USVQSaM/3HdLOBIYjXFDMbR/SuXyuqZOJqO82SpKDtRIEUlHXTez7rhaRDjhK0nm+658oMnJyk0zZH1rFTh9gvvQZXijGTN4SrKIe1/JZB1le8+Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6506007)(356005)(316002)(81166007)(40460700003)(5660300002)(2616005)(8936002)(4744005)(33656002)(186003)(107886003)(36756003)(47076005)(54906003)(336012)(2906002)(6512007)(86362001)(26005)(6486002)(36860700001)(53546011)(70586007)(70206006)(4326008)(82310400005)(8676002)(6862004)(508600001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:35:54.5278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a45150-6ade-4d97-98dc-08da2cf0b3c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2696



> On 29 Apr 2022, at 21:57, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> Document how to use the feature and how the implementation works.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by Luca Fancellu <luca.fancellu@arm.com>



