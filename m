Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398F72D790
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 05:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547755.855338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGX-0001pF-R1; Tue, 13 Jun 2023 03:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547755.855338; Tue, 13 Jun 2023 03:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGX-0001mG-OC; Tue, 13 Jun 2023 03:00:17 +0000
Received: by outflank-mailman (input) for mailman id 547755;
 Tue, 13 Jun 2023 03:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeqv=CB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q8uGW-0008Kt-Vo
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 03:00:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c217b73-0996-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 05:00:16 +0200 (CEST)
Received: from DB8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::38)
 by AM8PR08MB5713.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 03:00:10 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::24) by DB8P191CA0028.outlook.office365.com
 (2603:10a6:10:130::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Tue, 13 Jun 2023 03:00:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.22 via Frontend Transport; Tue, 13 Jun 2023 03:00:10 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 13 Jun 2023 03:00:10 +0000
Received: from abddc9a0f13d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6BAE3C8-BCB4-418E-B5B6-53CBD21A1421.1; 
 Tue, 13 Jun 2023 03:00:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abddc9a0f13d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jun 2023 03:00:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 03:00:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 03:00:02 +0000
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
X-Inumbo-ID: 6c217b73-0996-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp2enHslGluDBXbeRlwPZHuJfKFakVlzMhWMvVo29Ts=;
 b=PBeyBqQPndPdNxHB445S19Wv4iLuljghTa4KkVQGcN12/R1hCQALopuawzF7LeO4D6T4b+AN3xZ2gnvg6woGyZrvM8ztQYrx91GC5o3qvEtwVWjHF5qdo7IZL28U3p6Z6P8Y3C6k2Q58bjC0o2XbrZ0xnylkR170K3JO6DmJe6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdBEbgI+bnKNw/ISep6U5d9urdaKyzSMLVhyGFiR67+pq2rPJEi/S62ndtOn29P4wn606X77Z1RD1xhP/mBvmJFSk7qrEpWAq/9huaWlSe9FN+BRmmhoDZq6OvSXk0r4vuopTyk4wCAu+PCc651FSk8qjURMTR+u5VCRP8KBNpELdvJerqMGm4FHdcHG+E0fldfE1Fn+lNEWOGHQUZOI9PIeB3TfBcedw/YmWmn6mP6KOk/vuIE3HyXRnG/dUSbxi/2Gw11geL/+1d16cbVLk4MRGXDXEHZr6yjjEQSBGvw21Mdw0A9EaJgmkfWXstIIwdsMCk/4N0giQabza0Jf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp2enHslGluDBXbeRlwPZHuJfKFakVlzMhWMvVo29Ts=;
 b=eSYme50VfGMwWnd/XmxOMErnhdj48FpCIVf799MvuaC/7r6GPE5tu3hg63qN6j8zWWc7nZ3CuqVxIR1jBJBF+qerVG9teOI8zihuX0OywY6dTirlaravyq2uIQub6+AawByjNzaEuOzOOBPsw7ClUU8wcICwJRU2SgYCC2bNNnxZ8g7cxA5vz9gkMxdl65dPNsOwSkUVZwJbQlKElJLGT9avap3gqjPU6MuTPrMq4wjsXxxZuUESaA2xI/TQmENyY+6wtRvGYNCyhNrcBUJVXed9+c1XgIkoj9VMeO47CA5ate0/ri0jZrtMPVqO96+IYLEwnl4jzqT/SJSMLC3xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp2enHslGluDBXbeRlwPZHuJfKFakVlzMhWMvVo29Ts=;
 b=PBeyBqQPndPdNxHB445S19Wv4iLuljghTa4KkVQGcN12/R1hCQALopuawzF7LeO4D6T4b+AN3xZ2gnvg6woGyZrvM8ztQYrx91GC5o3qvEtwVWjHF5qdo7IZL28U3p6Z6P8Y3C6k2Q58bjC0o2XbrZ0xnylkR170K3JO6DmJe6s=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 4/4] xen/arm: pl011: Add SBSA UART device-tree support
Thread-Topic: [PATCH 4/4] xen/arm: pl011: Add SBSA UART device-tree support
Thread-Index: AQHZmSJnhkSZmjH+UUWfOrt3uB3WRK+IAYEg
Date: Tue, 13 Jun 2023 03:00:02 +0000
Message-ID:
 <AS8PR08MB79915CD0259022A57DE5A1B19255A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
 <20230607092727.19654-5-michal.orzel@amd.com>
In-Reply-To: <20230607092727.19654-5-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4D45209C569FF54181302738A8497B1F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7782:EE_|DBAEUR03FT018:EE_|AM8PR08MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: c5de19b6-0810-4e88-d310-08db6bba4d2c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HDWJjm2TTyND7ZWgdLbabgW+g6Lxxr6WbXho6qMIkdfk7dKO8HkDkykgreQJqeA/aGHA5w6ReLnQPjdutOY3YhnKo3ar1zwkEPN+oM1cZkk/UKAuHmu+r6hHwc6kEiX3fPP+jjINhozth1lz01v9WbhXnUc2VOf/8PEtQW7MERrQiXsRhkmNV5TZ8w9xiRLRY1xyUMZu8eb/tvphw20hUVtb5G/O9EfsFQWrOrdSnueRjbY08Y+OZVTEVzoxXOWRHkwjuTP76fYdKyX3nDHyFexRtTXZGUHuzRH/ZFrwXD1xXZkxWfVRL8KYCpB2Piq1hbMsPsbLuamZ/ombg1Ny0d3wtROTl/ROvrbKwvyxVQxtHcRcuulZ0M3AcBhWjTtOudY1+LyiyPJTttGmxUJp79mT8u+ABNpl9D/yUH42OF815yE7FBpxd0j3jGwf1VSrfEapB450FKiN+vNg8UQDHfu2hv8aSQVv68sl8AckuVOAX0s3KyIrxD4x7DYU7g7GfPHadPqePiMzTbhk9m6PmXK8hBxWE+1ByLM+VNv+EwroxMGkbK56+AoALf6qRi1RPNazMbW9Q9qJ4Jex9mj4NZb2U3QKsSSLFlkab2f5B8YN6aUIKG0ck7y70EeBkkOY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(186003)(9686003)(26005)(6506007)(83380400001)(71200400001)(7696005)(478600001)(2906002)(4744005)(55016003)(8936002)(8676002)(110136005)(54906003)(33656002)(41300700001)(86362001)(38100700002)(122000001)(5660300002)(52536014)(4326008)(64756008)(76116006)(66946007)(66446008)(38070700005)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	600b3964-8a3c-404a-5cb5-08db6bba4858
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vNiKETrloYmC05v+/U7f89xmENWA8pQiYWwjm2qa1Oy9MYFW3SEbbYkLUabkeq7l0+G9fPOFRz1XCGg/wP44m6bhICkKeMrZBTyOc6tGRZejX9uE9ybYlcjttQTj1xvSHlg2kEV3B9JjkT14HF4spq5Dt5XDAPn5ySxi5JJA1yKiM/3hB9XYJlUJH+xfoDw/p0Ico0seTcC80/kjb1rmHYlMPmJ7ZC9tL8EtvNKGGDEOa3YenCR1WcvsRhqwq4wjVdbZ9KesVFLQttDOs4JnNzRuRbEu3vLuxmclBhpVaVU0/SGXZIsOk8d+gVe135B8ebBDeZX4hbb1/JBt1AWbHeQFpntNfibktN0dDNixj46g705cJVsvz/657sYAgW5PF/buonSKcm6hWklTyvVqrOMm+/Q/iTFBYbmkGWR5/tXncr7mOwlqYHF6xJMyfBhVa9e7qix4SlnpR3QGIuOs4i1CBEnY8VWGht6BxK/EAYbnAvFslgI19rEmVmfpVbC4Z9S59zpliiZmEFmONm4SmZwfxT8/qdznpnYC1pGYUIvmUeLCzLQ4N3wfFzOlIXk16sMd/yK0GH24alGI9HQbbaixjeNrBgHwwJPtHq2ylOaviqgyNp/+KlzdXhcPmqxaujp9xDFHgj1Jg5b3jblzp/HjXURUn2t9XOS7gHJx0CrisZP6B4sjRy+dxtN5PV/w/9kOhbA2FVxrApy8zs+FYwfLPaPUE1+mtSfbi/OOfYuWHuaQVh769xmmj9n6/z8e
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(7696005)(107886003)(9686003)(336012)(83380400001)(47076005)(82310400005)(86362001)(82740400003)(81166007)(33656002)(6506007)(26005)(356005)(55016003)(40480700001)(36860700001)(186003)(2906002)(110136005)(4744005)(54906003)(70206006)(4326008)(316002)(70586007)(41300700001)(52536014)(5660300002)(478600001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 03:00:10.5773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5de19b6-0810-4e88-d310-08db6bba4d2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5713

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 4/4] xen/arm: pl011: Add SBSA UART device-tree support
>=20
> We already have all the bits necessary in PL011 driver to support SBSA
> UART thanks to commit 032ea8c736d10f02672863c6e369338f948f7ed8 that
> enabled it for ACPI. Plumb in the remaining part for device-tree boot:
>  - add arm,sbsa-uart compatible to pl011_dt_match (no need for a separate
>    struct and DT_DEVICE_START as SBSA is a subset of PL011),
>  - from pl011_dt_uart_init(), check for SBSA UART compatible to determine
>    the UART type in use.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging on FVP arm32 and arm6=
4
and confirm this patch will not break existing functionality. So:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

