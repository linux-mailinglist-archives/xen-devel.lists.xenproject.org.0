Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4A3AE58E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145388.267501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFpZ-0007vk-HU; Mon, 21 Jun 2021 09:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145388.267501; Mon, 21 Jun 2021 09:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFpZ-0007sm-Ds; Mon, 21 Jun 2021 09:02:57 +0000
Received: by outflank-mailman (input) for mailman id 145388;
 Mon, 21 Jun 2021 09:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFpX-0007sg-U0
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:02:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be28687a-6c61-406a-9fb6-cefaa4c6307b;
 Mon, 21 Jun 2021 09:02:52 +0000 (UTC)
Received: from DB8PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:10:100::39)
 by VI1PR08MB4159.eurprd08.prod.outlook.com (2603:10a6:803:e9::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:02:50 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::7d) by DB8PR06CA0026.outlook.office365.com
 (2603:10a6:10:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 09:02:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:02:50 +0000
Received: ("Tessian outbound f88ae75fbd47:v96");
 Mon, 21 Jun 2021 09:02:50 +0000
Received: from 7b6928a2d106.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC85D21A-38D0-40DB-95B1-09D162C1C02B.1; 
 Mon, 21 Jun 2021 09:02:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b6928a2d106.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:02:12 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 09:02:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:02:07 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Mon, 21 Jun 2021 09:02:06 +0000
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
X-Inumbo-ID: be28687a-6c61-406a-9fb6-cefaa4c6307b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C18WQ4WmLiN6bjCWWNLNGvCw4AQ2jUQz27y43G7p7s=;
 b=26lQoUc1XFqAT+YOr7Ci4JBK7/DArdzPPaARsisX6ir/Oc+JU2EYWUHIzjv3eVR7K7vZ+8WzUPBATtc/gmn2O0D40R8uyzJR7xnHX4xlvHdBAxHM0UUD5Ef5pwBokTDY+JdldqoTLMom/U7Xsgaf+z2UeZJd1EgJUaZLsj5pL0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c44f137472fc59e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m72A5m7JfUUSWURMcq2lkUIs2hsDxmMfi7A5bSl2ZvPybOEGEpS7oEWtIWoWjICxKnzLXwMmf52dqLFwa4hdlCm+EujFhJY4XHV/l3vYvjaynCHwMTQ3EM0GpCVAgSOvtJ4LEJpLIsyx8bkC8UaqGaWKzcZXUxc7yd4LmMuUQ+nkb78ubA3pUDdVzyRj9Hq4HneQkv2Q7/Xrl7fiGYmSfpl1hTFoc/mSnb+3tzYMtiLd1v9NzHptjQ4P/i4CoLjXqhzJOvfuswyvp8EUhtyLuxbTtM7NDKkoYvqdes7g43Wt3DMGeQzwj7dKNuEOEI1djkF12aQPLgKBLmj/b0yoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C18WQ4WmLiN6bjCWWNLNGvCw4AQ2jUQz27y43G7p7s=;
 b=ZY7d6YDD/sZLC3YIm/cx3EVh4Mw2C+6eb+Am7S+/QxViDWUiaNiYQMIWoOm1v3YVJVGosS72r3/e3Xk7Qzfliif9MYwZAqwMX84C6LX7ilXfO290XhwY1CH6z9ZqQ49WTP9idSJ201dTg5gnAY/ngUvESTyO4KrIl6Qu9YJl7W6IAY5i3wAKoWF3Bb8v5s/Uj7PcZuPjWIxLNeC1Fd9DLdMCmsgCikV8bo50jh+ituuxCjuBx7NwB0+w7BQe2HYFOiPJUa+0k489HLdpD9ve2xV1YrOj9W4HLgFG9DxZH8gs0WQmuS9v9z6ZsIN7aMo2LGEwEjeNe0KJ8kk2BPqnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C18WQ4WmLiN6bjCWWNLNGvCw4AQ2jUQz27y43G7p7s=;
 b=26lQoUc1XFqAT+YOr7Ci4JBK7/DArdzPPaARsisX6ir/Oc+JU2EYWUHIzjv3eVR7K7vZ+8WzUPBATtc/gmn2O0D40R8uyzJR7xnHX4xlvHdBAxHM0UUD5Ef5pwBokTDY+JdldqoTLMom/U7Xsgaf+z2UeZJd1EgJUaZLsj5pL0U=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 04/10] tools/xenstored: Limit the number of requests a
 connection can delay
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-5-julien@xen.org>
Date: Mon, 21 Jun 2021 10:02:01 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <77658E0F-C333-430C-A0E4-13F08E943A8B@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-5-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::26) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667018d2-9f5f-4771-57e7-08d934935899
X-MS-TrafficTypeDiagnostic: PA4PR08MB6254:|VI1PR08MB4159:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4159A77453A35168BF74FF2DE40A9@VI1PR08MB4159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jRMdJn8WPZOhM/9o6LalQMfZerd+5Hg7bLaKySaPXw7gLPKoeFkD8wxpl8aymxsn5/zIMNl8GKn09/QPqWESemkO3vHap4xfR+nC7ZKBP/ffhLLjZ8+aIl6wuxcvHj3bt72/0thU5+VBgnHvdVbuZHCGE7ZR9XUo86LDsuESMtMWLDjJ91kMK5Pn2tmtN1+3CdsF197fNyld5xKa9DvZHNxGiuSrR5ZuhidBDIMWQhCpQD23zaL6E9ldusSK/zabcWaORg2ZjgVKNM35cmHWYB70g5TCzLWdcx+SMguF8YLd94XaZ4IEx+6PjUx1Hn5XmgfUL96n9Wc14p80TwkV4NATfHVB0lO57ynAZX/4jy0zlmCaKlqPbqmPfDVUey/FcosrTPsZ1kXlcMI88oy3A+hJ8ig/VNx0yBWpCqrbOsJXDqmy3fDcJbzt8QmKr/8ms7TXzUA5cWTLrPk4v4NIayOKt6r7eEQTY+up2ZgzPflSjgzLlYQxC1uRgArCzBxJFrepdwaATA5iys4q9I01F8NmSn2UBBi66lhm6YTGZra0F+VqYZN4ZgSXy4xWxktOZBdNM6ZSWY9hTxGLXx+GE5MPxHV8c8OxJTjNTwU7OIvc7JWcuxo4+WAH8Yl53Jh+L0E9r5fWHOx+YaecRrpyNDpRw7Sr5PWUzfP0i2ZD/q0ZiqSAGxHHS6kp17fX4ylG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(54906003)(8936002)(6666004)(5660300002)(8676002)(316002)(66946007)(66476007)(36756003)(66556008)(52116002)(83380400001)(2616005)(44832011)(478600001)(186003)(6486002)(2906002)(53546011)(6506007)(38350700002)(956004)(38100700002)(4326008)(16526019)(6512007)(26005)(6916009)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ROIEvlReMyIkX/nfRbyc/uae9lm4gUA5YXb9UiRuFNXgyY28TlRTj7bGQbV5?=
 =?us-ascii?Q?zjNbqg1fVlfRBHyYlR4w07fstQgEMStsRdN0EcsvMc567UdNOHZNwIF0mZF7?=
 =?us-ascii?Q?6dbIaiFzLRzD+E8THBhRRknOKeXPp8Ga+UgKiZyXQgyIVNRytQ5ovqAxri2u?=
 =?us-ascii?Q?ThQUxXy/B4JIKbvmCcQDypQ73I1GcXFkc7y+NEniN4Sxky33BR6ejJmyLf5j?=
 =?us-ascii?Q?opJNRBGhzyKtyXoHoVfeC8GEkS4pVHf9vPEMwv08y7J/+Xgzx6qv0Q7RaPvV?=
 =?us-ascii?Q?De3plR1OdnL7m3z1lGB+RLKSqYJV4xAc1+14W0Sz1zz0Rc/82hR057mFQXhU?=
 =?us-ascii?Q?qOtw3bcb42BnujrNpGNKnFnpqI3/4xHhvZSJgCTbbtXC/tasIV2EWrUBOr0M?=
 =?us-ascii?Q?oVWY5lcRPKvtwNTHRAiDPFT1d4eMlS6SwJLgO6wtm9PDxmYAFbGNvwz7KTCa?=
 =?us-ascii?Q?lQk6non4wS8ktdDJmPGM8b4QPl3m2zFjq3n6P5iMVR4K+VgnX+PspeY7CNjg?=
 =?us-ascii?Q?BN1YwmSKle6Fko3H96RxgD1KUn+Ve4qNSqZWIdRQ4SdlYGn8xeHKz2Grk3CK?=
 =?us-ascii?Q?jiIBAWP363wFDd4HBryhv8gWnUBG81jEso3cFDGaoTakmdA27oegNbdPzjxB?=
 =?us-ascii?Q?0ySTJOI9+/Tvsrh9coFYxQl/PdDmCzc34fL4Kme27LrY2UwDxfoGhpNgoljd?=
 =?us-ascii?Q?2f7ImqemJUb5YgBC8mZTAEGY+8v2qVLDX59bn+sPszChaEkTw/IxF521gXnO?=
 =?us-ascii?Q?eo+IEHP4eY9oPBZWo4TLE8/Ur1+cs6HuxLsJz7XKlyY9MQ6yCU+I2wXDzB8/?=
 =?us-ascii?Q?k3BYmm/wxQgjQ5oB3uOO9bI7CTOrAnhtV7Tssz3joff6tr0BroxbKpZQowHW?=
 =?us-ascii?Q?TzTaOIAkQa4O1uL4uiot9DcYK/2gMJ1wUVg/tDeJ9zPbJjjMz0fQeyZgn9hZ?=
 =?us-ascii?Q?9PBy+awqUBO/IOwyOKfHpVi+NlvrX11RBnx8oUfXQb/dUVxjvzmocIUyHMnU?=
 =?us-ascii?Q?mAigADfMAdQ17KUma2wfYEudb5/+75EAj5EPij9EyIKShXlSyas1sXG25Vvc?=
 =?us-ascii?Q?Urt5JjfK6TzD7jX2WAoEazGFT//AwffR4sWP40T+WUSbmKgUtkx0vlJxy2ZX?=
 =?us-ascii?Q?7DqJSa4pbDTOrB5EOLToJHH6zokPtZl3OYZIPKbb01/ZEr//dbj87IwZpO/0?=
 =?us-ascii?Q?EItyKOjvbkLd+S7trzB64+8udyut0VpyXZZnmpzStQicslQpPKEGUHsAyXOv?=
 =?us-ascii?Q?k0hwVk3b0bIiIGeHES5GSdYZ4qQZTjtwwWa/uROzH+44k6MZcvWcTXlG3VbR?=
 =?us-ascii?Q?1HsgyPaqRYeufee6Er+FcHyX?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f22bfca-e19c-4ad7-91cb-08d934933eed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gj2B9AQPKAYiG0Y3KXOHFOOBFLkfuCuT0S1iAToNlgYFpCBSPaBUnq4Cv9XzEEuJIkU95QdSU4CHYiKJOc537fPNUBauTQt7J7O3GrVGcSXQYJa0J5++JSlyR1gB9GKN8bZQq9EO3ju+Xx6Zw6JCxGHApUl/1p9lzIUtcD7R6Qt+re2yfXq58XbWSv43riXJLnkvgofkWZ54X342Kd/cd3Tphi7xg6V5vbxGOmJ0tCyMYyOJLNmZR26MqnPAoUzXhqBIAYlHICjoq7V8+r2KS6Pfybgh8ZVzZmoGP9+q6ssW+gdF0ojwFDTKC3gev4J0Vx0LmEP+AjrIF0qQv4J7E5qZLxoD5+LJQrQ4d5H4r2uCB9eDV00kBKEwS6CU8KCQCggI9qrBUFNYeAGKEVqaPUIs25EGbiNCPqgikhNpORHMOOCoNXG87EBk440zZNC5bI4ikbO1Bb8X6cNY2fA6TazrhwouWwmlICkjtj9YBy43k24aaraTsdU16YUwbCw62YfKF13COWV5+V0Avb4Be06JDYCjHZTy3Qoko6cE1aB79hYRVg4gJfWs14BxHgQ5FJKOJAzgMaSnbb26Zrlnpw6DVqlLq8ixV3aK4lHyKQ0w0WUnUCkQe6/MeeHaDC11hL5ASvymD/1kCAvSn7DNkmZOhx1Pn5a5Z0o36NT35w=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(82740400003)(36756003)(36860700001)(6512007)(8676002)(44832011)(356005)(70206006)(53546011)(478600001)(5660300002)(83380400001)(47076005)(4326008)(107886003)(186003)(6486002)(26005)(16526019)(70586007)(82310400003)(54906003)(6862004)(86362001)(2616005)(2906002)(8936002)(956004)(6666004)(336012)(33656002)(81166007)(6506007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:02:50.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667018d2-9f5f-4771-57e7-08d934935899
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4159



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, only liveupdate request can be delayed. The request can only
> be performed by a privileged connection (e.g. dom0). So it is fine to
> have no limits.
>=20
> In a follow-up patch we will want to delay request for unprivileged
> connection as well. So it is best to apply a limit.
>=20
> For now and for simplicity, only a single request can be delayed
> for a given unprivileged connection.
>=20
> Take the opportunity to tweak the prototype and provide a way to
> bypass the quota check. This would be useful when the function
> is called from the restore code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_control.c |  2 +-
> tools/xenstore/xenstored_core.c    | 11 ++++++++++-
> tools/xenstore/xenstored_core.h    |  3 ++-
> 3 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index 7acc2d134f9f..1c24d4869eab 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -737,7 +737,7 @@ static const char *lu_start(const void *ctx, struct c=
onnection *conn,
> 	lu_status->timeout =3D to;
> 	lu_status->started_at =3D time(NULL);
>=20
> -	errno =3D delay_request(conn, conn->in, do_lu_start, NULL);
> +	errno =3D delay_request(conn, conn->in, do_lu_start, NULL, false);
>=20
> 	return NULL;
> }
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 41b26d7094c8..51d210828922 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -279,10 +279,19 @@ static void call_delayed(struct connection *conn, s=
truct delayed_request *req)
> }
>=20
> int delay_request(struct connection *conn, struct buffered_data *in,
> -		  bool (*func)(struct delayed_request *), void *data)
> +		  bool (*func)(struct delayed_request *), void *data,
> +		  bool no_quota_check)
> {
> 	struct delayed_request *req;
>=20
> +	/*
> +	 * Only allow one request can be delayed for an unprivileged
> +	 * connection.
> +	 */
> +	if (!no_quota_check && domain_is_unprivileged(conn) &&
> +	    !list_empty(&conn->delayed))
> +		return ENOSPC;
> +
> 	req =3D talloc(in, struct delayed_request);
> 	if (!req)
> 		return ENOMEM;
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index 89ce155e755b..34839b34f6e9 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -213,7 +213,8 @@ char *get_parent(const void *ctx, const char *node);
>=20
> /* Delay a request. */
> int delay_request(struct connection *conn, struct buffered_data *in,
> -		  bool (*func)(struct delayed_request *), void *data);
> +		  bool (*func)(struct delayed_request *), void *data,
> +		  bool no_quota_check);
>=20
> /* Tracing infrastructure. */
> void trace_create(const void *data, const char *type);
> --=20
> 2.17.1
>=20
>=20


