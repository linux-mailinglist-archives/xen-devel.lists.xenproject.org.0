Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E237B6F7
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 09:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126157.237498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjOm-0007cx-0S; Wed, 12 May 2021 07:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126157.237498; Wed, 12 May 2021 07:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjOl-0007Zd-Sr; Wed, 12 May 2021 07:35:15 +0000
Received: by outflank-mailman (input) for mailman id 126157;
 Wed, 12 May 2021 07:35:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ9D=KH=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lgjOj-0007ZX-Vp
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 07:35:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e024aa6-13e9-4917-bcf8-0409cfa3db1d;
 Wed, 12 May 2021 07:35:10 +0000 (UTC)
Received: from DB6PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:6:2d::11) by
 PAXPR08MB6861.eurprd08.prod.outlook.com (2603:10a6:102:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 07:35:08 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::1e) by DB6PR07CA0001.outlook.office365.com
 (2603:10a6:6:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Wed, 12 May 2021 07:35:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 12 May 2021 07:35:08 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91");
 Wed, 12 May 2021 07:35:08 +0000
Received: from 01f475932d98.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F228B203-1819-4770-AE74-C785A9DD94E0.1; 
 Wed, 12 May 2021 07:34:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01f475932d98.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 May 2021 07:34:58 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3869.eurprd08.prod.outlook.com (2603:10a6:803:bf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Wed, 12 May
 2021 07:34:55 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a%5]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 07:34:55 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0108.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.50 via Frontend Transport; Wed, 12 May 2021 07:34:54 +0000
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
X-Inumbo-ID: 5e024aa6-13e9-4917-bcf8-0409cfa3db1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsWcDodGaJWAwWUe+9CWIGOcPFpVaK7BKSmRFCGzcSQ=;
 b=b/2+RTvoRI2ky8LOi5ciyXwZqmvOB/3gQlUGzn0W4bD6lJ7C0HO9AQwoIrMsqUAEGy62XZGAcXRklDXOr9jz29UDoMZZu3rkgME6gLSvxyMa4basjVL3QzI4Uq8L8v9R2WTeAiMLjVaQ81H66jQWmn/X7K3RNSOG+RVVPj6Xlx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cee01e5f4644e7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEG4YYkqBTXT5fe+EcOMoWy7ShvVMYNBRQDMd+JPujfs0/HzerwWY10fx6c89ywTdC0tOx31+4AtmANz6ETkwuSVDYjNQ6tq08c+dhhoXCxH3axbOrUZH9t3ZgoRZCHKpvtMUaMgDpcHyJg4ZiLHJLXNMOTIIk0OTZTdwJpmeYEA0zh8XV/xPSs4b7ZqZBYQM/brzebTCJR4jrWJkI79vcEGQXxs2n9JtU4TND4OeCXj9YcxfWmVB3uE6j3k5FaHnkKsXL8OfE3TtCQaSNwULJs1pM4SfMWSDRgbm9auIP6rlehLGXfeqzIIWtef6hASX+pqj9pE3YdSZFpHwz3GxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsWcDodGaJWAwWUe+9CWIGOcPFpVaK7BKSmRFCGzcSQ=;
 b=E+Mel/xgVWmpZmY6vlyGDWpRurerpY/VROzOjufAYBGs6H+OCkJlOIxSkZXrDlQPfOiH7wTL2dVPCZvubb5kYIjBfDtjhSkP/XcZuDAPyVMrFe7FvsD9//0X/qccS/lRUFzYycvMwgQ0szGzKnSSshfYvYT/XWk2nh+EJXnDEg6+EtsMy+D88Qs8hWv59r2h2mb7ruDmbm08ngnXTgq1takTfxTE6jzfNfwZtdlw1Nqpb4ickM24cHOyA+ezqeQo+OeETYE/eK4orCPnIyc6BUwZ54KKPBFfUdkAoEZV4znjPOsL28Bkmcy/7G01gXJGfHi+JaFAHTrFCb2UQBFnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsWcDodGaJWAwWUe+9CWIGOcPFpVaK7BKSmRFCGzcSQ=;
 b=b/2+RTvoRI2ky8LOi5ciyXwZqmvOB/3gQlUGzn0W4bD6lJ7C0HO9AQwoIrMsqUAEGy62XZGAcXRklDXOr9jz29UDoMZZu3rkgME6gLSvxyMa4basjVL3QzI4Uq8L8v9R2WTeAiMLjVaQ81H66jQWmn/X7K3RNSOG+RVVPj6Xlx4=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v5 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2105111457480.5018@sstabellini-ThinkPad-T480s>
Date: Wed, 12 May 2021 08:34:48 +0100
Cc: Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A54E7AE7-46EB-451F-B521-14F327DCF484@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>
 <20210504133145.767-4-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s>
 <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
 <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
 <alpine.DEB.2.21.2105111457480.5018@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::24) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2c33efa-2f56-40ad-e18d-08d9151877b5
X-MS-TrafficTypeDiagnostic: VI1PR08MB3869:|PAXPR08MB6861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6861CE0AB677D44E923A2942E4529@PAXPR08MB6861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sS7cJ09CKBiQE3IO0Y8OjuUPqN7/4Zah5NBuFhnlkz0SYgFRV/ToRGhR3PeurvVF49+7xK2dn/CDF3mX3aGj3ASDSZHXcDvM5t1XO9SWfGEZLEsQ3eBT6r1Zwdo2xtgg0SUtl3s4evCYvwG9POe+hzmqJ8VOFGfamyBvQq8yxJxsfD/pntk/pdx1cvOdXnczzjeFRjdy3oD9CBPQcTZjkn3YoY9gJgqwgF2Xj42c40ThcsXGE6vKjqz97EsWo2dDOdwdlZtB3AGYSRMUYMsrhNI1muZX1hl+/4OFbxvkaLuRMf7gx7+JaQyrdqxW2Z0uFaOvBCZmhsdZntIW60NP02viKFWiJtvR9yb2+A9FU26QKjDKv+iINwIX5JWZ4vAEGuQ52sGNswJpUB4yhSeImOwkXaywz8q+HrSntkNxqgi9mEdFHJelYvJfhlOa8/BchzokRFTJcJDgx4QXw5ZBSZO1MgawUbTkIIDjJVlXCyISsJY3hmsfckqbieneJmUrf7R7VqoXquKxpx6qREtKbopySLrw58WzbNhU0oK1xr6lYkzC6Jh2qTYbpCESrzGWICL4EcnvAJNAmGm8d4ttYk3rzpeY35kxugODipgNw0XYSDn9pYrkSdQNbYoNlN8N+4tsRYeBIhlI8AeAB6Fn1Nv7ci7RWDCFB0+fbPAOATRB8HOwzQX3OyGGJxicJNDRWGs+II43LhQFIKk2z0cUsbNoTuYqAXYhVIMJXaBBeHwgmUoGgQcdrM6P9u448LOXOMDGco6yIjds8GRLz+Hg6w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(6666004)(38350700002)(16526019)(186003)(38100700002)(36756003)(4744005)(66476007)(6512007)(478600001)(5660300002)(86362001)(2906002)(52116002)(66556008)(316002)(966005)(66946007)(4326008)(54906003)(2616005)(956004)(6486002)(33656002)(26005)(6506007)(8676002)(53546011)(44832011)(8936002)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?Z3/Re+G29xyVD87R2lir6MiRT78ejreacmLVJxocoTBJSkIR16GwOe7I+1ZV?=
 =?us-ascii?Q?xXawIG5Vxrj9/ZVhmQhoRfKBtoPCXPR6hvEyGthYF3LM91dbm8SsVwVAnbG9?=
 =?us-ascii?Q?84ssIjicZKAF3a8V2G71u6rbsDsVn5yE8yRwNq81QoOGVy5Coqw2rs01YT8d?=
 =?us-ascii?Q?9RhgH3oqM9Do5tcoqfdtDIH8Jtza00j6R0kLVuSxmcO+rlHorOjQcaUwrFQi?=
 =?us-ascii?Q?S1A67fiaWyAiz2dD0GZksTDQuDE/MB241jlfD5WVNCwxOPA8T1DU4zv0KNJH?=
 =?us-ascii?Q?/r3TzWXxVv0dcItMk9rTlI3cNPR0vhReN8GbX0Nwj9zXCuhndEAYHjoz4w5y?=
 =?us-ascii?Q?yjVkxZUyFGN+h0z9qXcUBh5CCWYRgRWl59DOpizAV7imXnh1+KH8UzymsI5p?=
 =?us-ascii?Q?brZ9NF5bQ5x1hczJVzjFu+6c9ET5JN9NLp8kIOi2ENLlXcrrVxReSswSDjSK?=
 =?us-ascii?Q?5Q43iwnqTu1XjeNh6b46ixMknFlROu3vE/kg045+AMrlNiicjjvbizzwp26t?=
 =?us-ascii?Q?Y/NnIqt02lqAPFLxsuMVwYgbmFclAtTD430oEv5+uQDaAjFW0hsTXSK248z8?=
 =?us-ascii?Q?iJLtt8pML79Hd3hHJg2aV1cpIzB9N/s4XyqUa/8j0wrAYuvWAvtnkP4sE3a4?=
 =?us-ascii?Q?Y+UY8dmvd1D/0DyaBWHfrkbZ+HZ3CV5p16zJatZOBXvzB9M+VrvMN6VJdRfs?=
 =?us-ascii?Q?mCgrs7Is1mhrMozIUAxbhAo9tOVl8Bsd9hR4wM8NZaQhNaAKWr7eq5UYnd0h?=
 =?us-ascii?Q?mFieKNLAHEcDWxwCuoChN5tR+9rYwUvP4bVoN75zBkgNEV8ICa6oXk7UgoMR?=
 =?us-ascii?Q?igtF3i8nYLh14GFLQ/MpTcXVvUMyNDe2hLccnjvYDpUUZMMGsAy/ylaJVZGA?=
 =?us-ascii?Q?iEIteOn/7+8lpGar6qeEQmPsIQAkrVCWnoNdnRhjZuIksBkr0j6KQJ9OZSbM?=
 =?us-ascii?Q?MUzsXF3oGrNumvWxLglEbktIpztyetAh3uA+VVHTN8TB3hxw6B0l0zaVyhun?=
 =?us-ascii?Q?tpejigJu6HkF75AdYap2Ui2yye/yqZ+oFU1ekovp75DxrsV2ZmSTOABqW4Ft?=
 =?us-ascii?Q?kG/sQqoiIjKbd9wlMpTM4ed+TYzyL0M2q4hExh1LJ1vMUQuWxME2VOAGf+su?=
 =?us-ascii?Q?itkj6GsifB16ok/3zCYEyy0FYsaGUAdGqbv7tUMiQngov7wx+9uR43+wpXEl?=
 =?us-ascii?Q?QYMnvmLMlDRr+NCJwO0jGqyeH55Quz7B6V60/usApFnFT+x7ibpuDgohp8Ya?=
 =?us-ascii?Q?9PSSFtYy7i8PnP64YSwHRIjJpAeA5QLWtyKV+xCM43J+Q7fo2AKH6OVwT6an?=
 =?us-ascii?Q?qezNzAosKQ3BQUzZbBIjGWwb?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3869
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6e20ae7-43fc-48be-6860-08d91518701a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZLfvs2F3pZKWypI+5g+aUzMibiXJZ2sztnra7n2S2Gw14KHJ71SiAmUr/QwOS5I7FpBZlK6Szg9wzVVfz7b5gJ4+qxrmJBwmj/YZkDb+l5MPfqhecDW9h4c2ddpqpsr8CIAutVrUNyU3zP1Yph5vIYbNJEyPg0kWNUbcry5NbkvyUIMWFSzWTf8eCWMfRoFrYsj7Kn+LaiTktODtnp0FqoyIMRz1lt8o1WFPSI637p2eeDkTlh0wjDcf5cLLzmBvklvfEwlI3oyuia/s6IhFmx3lQXd6BqsJmvjiP2GfxImvgG03CR9VejISy9v8yu38Xq00hQApkLTk6vOhjJX7u5VPUAt3HoCW5Nk7z21EZpjidY7BMi0hbrbfGncy7nKxTgjS8BuQuHtpN2RVTpGtwAaVowBRj70KV1eHnBn+cShFS6XQqaCa8IzgOI/63a5plP7QoUtn9lpwFL8RFNlwUdtbKMfgR0U6ih1ER9YFkl9wi+uf2tcenl/OGj13cm8dN7uLSxD+M670T640/cSqJNO0qRVY3g/7+hfHasPcUUxPLckp4LdeoTrynyaHcG4PRcHpNTqZb2ZXfCwu3ZVvwX8i0R4Cly61GFcUffzP3VD3rEExKx4gRDdEKjHhx67S6CvRVMXGl/GS3lIk7MuhjMJr5SvJ9ri6Q3NUenXMItVNjAQlWCDbW10FrRD7qa3pj7u0uRaDuGUm+93k8mi0320X8/dU0R/agEgKhN31Cc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(36840700001)(46966006)(2906002)(6862004)(4744005)(186003)(86362001)(4326008)(54906003)(5660300002)(16526019)(44832011)(316002)(36756003)(6666004)(2616005)(956004)(336012)(36860700001)(6512007)(356005)(8936002)(6486002)(478600001)(70586007)(70206006)(82740400003)(47076005)(82310400003)(53546011)(6506007)(26005)(966005)(8676002)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 07:35:08.1242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c33efa-2f56-40ad-e18d-08d9151877b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6861



> On 11 May 2021, at 22:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 6 May 2021, Jan Beulich wrote:
>> An alternative to correcting the (as it seems) v2 related issues, it
>> may be worth considering to extract only v1 documentation in this
>> initial phase.
>=20
> FWIW I agree with Jan that "grant table v1" documentation only is a good =
idea.

Ok, I already pushed the v6: https://patchwork.kernel.org/project/xen-devel=
/cover/20210510084105.17108-1-luca.fancellu@arm.com/


