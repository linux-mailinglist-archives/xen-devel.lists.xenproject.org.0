Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02958501E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 14:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377496.610714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHPDi-00078A-Uy; Fri, 29 Jul 2022 12:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377496.610714; Fri, 29 Jul 2022 12:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHPDi-00075a-SI; Fri, 29 Jul 2022 12:35:58 +0000
Received: by outflank-mailman (input) for mailman id 377496;
 Fri, 29 Jul 2022 12:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lppd=YC=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oHPDh-00075U-Kl
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 12:35:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60089.outbound.protection.outlook.com [40.107.6.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd03913e-0f3a-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 14:35:55 +0200 (CEST)
Received: from DU2PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:10:3b::28)
 by AM6PR08MB3302.eurprd08.prod.outlook.com (2603:10a6:209:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Fri, 29 Jul
 2022 12:35:52 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::5) by DU2PR04CA0023.outlook.office365.com
 (2603:10a6:10:3b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Fri, 29 Jul 2022 12:35:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Fri, 29 Jul 2022 12:35:52 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 29 Jul 2022 12:35:51 +0000
Received: from cbb0d993ebdf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10FBFBD7-A218-4E96-851E-5170E45CA1CE.1; 
 Fri, 29 Jul 2022 12:35:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbb0d993ebdf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Jul 2022 12:35:40 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB7772.eurprd08.prod.outlook.com (2603:10a6:10:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 12:35:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 12:35:37 +0000
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
X-Inumbo-ID: fd03913e-0f3a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aG53V/AE8L9MGt3K9lqli04zhGQUhwEDT2W+B3UuX51sxIwIsDpdvKE12MX8jy0u1GI3Syc16Lvi/fhNNedxIcRwfFnlYmWdesR/1gG8U3dhOC7xMVKyg/nnQsRoZp1rFmGJYVrr74vtMnMEVKeblpOJckPoyeSDhhfGA/aBAPL2ZLbLOp/7Q4xagg97decvNdlqmJJZxxGnp+43/ngCVGGFBCkJal6pp0CC29c/2P8v0d6DxyWz2mMxnpESbCRFx4zwcziRVygFrKojMjYiGG8ZjN2cEazFP2mYL66VK93uXO5EPbo85aLB6fjsdhyapzNhgq4Ypykmp1w/GD52tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WQMdyN/qvKllpoVdrrpxuJUjQRyNbX2bwusTOrxZtI=;
 b=P+lH46q8E9g1uNsjZGcY04pDs/v4kg41j0Hj9FIqpmiMjgpbECSQlHdSV3oOErxzxIyYP1LjzPLIQskaHC9uYgqgr75hI/d8ZicYJTp3B6WrTXbPSB5P8kkSdFyy3Sa3fXO7+HgX7IaZLmhpAJwAxBpAF2eMHEdt+EVodS+lFKULWuQRjSDVIcSaLFicwKA043jR62GgxmhoDz7EvgZ0VunLAOTrOjSM4esQZdXA5ryN0hyvsmaHL+ByQPzPT1JqpFmpSECY/9dvJE2VLif0AjGjiZg6/oGqWLw3ZsPrhKJ4fkcoM3AQjhGJ2n8/3ZMdTPGGhnRUndnjhVlN5QrILg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WQMdyN/qvKllpoVdrrpxuJUjQRyNbX2bwusTOrxZtI=;
 b=PUSuM0tyBGlgBJPYa3XsliqH58eHYYQCmIJMVHn+fGHgYRndJbXTmKWZnFcl61VkmR61PQJyhKc61bRafIQYHc8cw4LN3xgz7ocgFZRy61qdbtqJeO79D8eU70DsSh2Rh6D53gj71nrxCmLtthPWg4g82aAD8fnSlVyJ1Klry0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe02f11487eedbdb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9ON4GNlg7S8EdZZQrtcK20ZoEAMNN6i4NL+rHYtn6aVOpe6Tsmkrkt0cvj2cUG2f4drKLwEEsXXv4cP4tqzVNF3MFp6m+VwCW62fYeTwYJSujx2OqmfK24+zBtmC1PdYFWSTKWrY/Odben8C+OEcwYg+AgEuvM9C5bKKeworArgvTWHCGw2ODhb/t3Ka2XVLy4kqUXalEhZKz9ZdIpnxLd8Sl+M77iGPBTnTlKCDkAYDjrIvsaq/ZbMrprGTz+zY8l/cwoAvBskll5hFsYIKCTG/VG92vRrQUZ5D3MnvApuXD8EgX0N86+wlxCpM6hXJbutWbOS9kMC9THLMnnLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WQMdyN/qvKllpoVdrrpxuJUjQRyNbX2bwusTOrxZtI=;
 b=SbXuNSCFbeZBaYEsXF1v8AuVqtD5a9mwIbjqYyzGBrjihePXHrMboRl9gsSO1nPoY0Usms5c6i7yRm4xWW/vFs8tbGPk8+V/w+0Zt5zeLXvIrysaXMQ87LhonBfT2scrgmFxDLhv9MfGH9BZ9L6TwSH0A8eZcH8jC4p4SB3fbD4iUhNtaFK3zcQ6KrTLPboW2m4OyskTaL0KITtRqKuol2kmg+ylGiwfn5n4wcL8yLAFp+T8q4Mtr7+rZgQ0RoI8l5XYIAGX0BcI4nNIuzkj+Ksbob7Njd2kA4lYn9TKpQOVize9AVQUibKDrUrhNtyxt4AtIPFCWnMysrRUNBRkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WQMdyN/qvKllpoVdrrpxuJUjQRyNbX2bwusTOrxZtI=;
 b=PUSuM0tyBGlgBJPYa3XsliqH58eHYYQCmIJMVHn+fGHgYRndJbXTmKWZnFcl61VkmR61PQJyhKc61bRafIQYHc8cw4LN3xgz7ocgFZRy61qdbtqJeO79D8eU70DsSh2Rh6D53gj71nrxCmLtthPWg4g82aAD8fnSlVyJ1Klry0E=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AAgAAEsgCACtZcgIAAFXWAgAGspoCAAAsFgIAAI8AAgAf9PoCAAwMegIAAV24AgAEIAAA=
Date: Fri, 29 Jul 2022 12:35:37 +0000
Message-ID: <C863F6A1-67BB-4508-A8C3-70829A56AEF6@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
 <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
 <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
 <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
 <03fd4b2b-66ab-eaf8-0875-9382e8b14012@xen.org>
In-Reply-To: <03fd4b2b-66ab-eaf8-0875-9382e8b14012@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fc537254-3137-4323-9ae3-08da715edfb5
x-ms-traffictypediagnostic:
	DB9PR08MB7772:EE_|DBAEUR03FT027:EE_|AM6PR08MB3302:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W2wosatFJBQuC499WADjM0x45OCeRx1WR9rwaObUNNVOGg+7AZSSMP9tdsgmxI+rDKRMXydlXCpylmCv6usEXkt4tppUrsYgQKUowGA93Gq2f68IRDX8v+VuV4blwe1/8C+EApuXfEJeWYOxKO4EbdhoLbDyEnTYGdE6jGyAw6D72KZUUd8F0ff9owT2ip+OtKjakrJMhUQq6T0XCJWxU1oqQkTsIrc3FrstPxYxSlT8KpANzcpIZvlB8YFOUFMoebJ9Fal+oMpFbIjG0K6xFWIHpmkV0S23yODYWYMosoXa8aAVV7jBXn7CnLRyzbawsWAPp+gJ3lC+sWTjcYLcPqSL1kjYDHQCML+vjOEYahQ05yS7Dk24R6EnQjptFPNhxhq/K6WUawyCxnMvUJbIhWmboJu2dJ+vBcW6bJzRnK+FFPmclBL67Qpzdi1V4VLF5Ygx5gPSrrV4c01YB5xj6HUiX6dqwfDRh7D0cQwYYI/0j2ZBiXb8cIT202f27ckMVBBxzpVIqr9kS69kWVoda+1jt7so8cwWGKzFqtUWGHxcWDq9//lh/5pp/bqZbzVXmiE4HmkozfrY1S+bVywPt00xJsiqcf6kSlXFYkjtVpgSBjlb+xQnhZlaDXVeR8LDdyy6Dkw0E5meFoxMWm0PAkElFvHgYSi9m5DJuU4pAoPEmk3muQTX2xhV11lGkD44UKLkEoU3CCs68r/JBb+r2K2mG3avcNTvLOD/iKr7lkHPWyEpPognaK+rfIBS3U0xdifmYJb/aOtKRAcJk1Jp4uxPp0NVyQFZXM1BzDMwY5Tsxb0AJP4eIacXzK6iaXre1WhlR5GvjIRDzCdvflLuxw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(36756003)(33656002)(5660300002)(76116006)(8676002)(38070700005)(4326008)(2906002)(8936002)(91956017)(86362001)(66556008)(66946007)(54906003)(316002)(64756008)(66476007)(6916009)(66446008)(41300700001)(53546011)(6506007)(6486002)(38100700002)(2616005)(71200400001)(6512007)(478600001)(26005)(186003)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CD915512EC57540A61029E0293FC91D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7772
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be84e825-e706-406b-7403-08da715ed730
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	45xgqtfPGEykGbeREFqqdpIWnEdqDzBe1dqCKRVfgYlVvKsEuA9uFUskSQtyKK0RgQlyAhjKiandelrJml9tyYLx1PQNjTm5RKcxkvwYBpT/n8iLuiwmrULfS9pdsyqjsY2/3tljE35IZ4MaIdM+GbStnenap9YVQy+DKn7gbYbXMT6/DdPXGLxwwPiH5gwgwxeuf9e6onAUs2+c7VcuFH+nZA/dZjC02fK5HfkeyogBAwNtl5L2kPYIZHIgTj0MAtKOuPQgu2qd8By/yorO4FaXMREoPZaw/FEX7QKuXakXpJQ4cS9Q3s4URrI4nflNAlllBpSHdg2K+v/xCbcxfSPaiCw8MTCsdoh1MtUxNZEqSWYiNYv7XRIxzs6ROvb9U7HOaJN9qqZMtDeQikivaXf8Pf53rrbJrhRBbHIGT9oBeiHjBZNNLlZbC7s1vAtXdkDezW9IozITyb5mF7YNevAOc5Hi7gp+S2tHzgMnVrDeww+aO2IBx9bbTfmN8l+IuMpdV8M2MpRkEUldtpNvIDQYcJgdoKrQPF559Pwli8DLGBQfPZHhSLh3aXgZi/G3LZw8XDxvIr3xUD2v7FeyFYL6R5OufXpDmUMKBrWa3EHSVw6IJSFG5Eep3STgNn3ZPg/0tCb02K90CZnV/Ay/bIl4iYJDH3FfQlBqWO80Fkvv7Db5Ot1wUpFu1K6gpZ4pWLL6TeD5Jbju+QCoKlPpOZAZE2B1NZxRLV6M5jgtTaOhTgj+UaYYuMG/H1WKein+B3kv9UpI68jaIdyAyUlDVugynaG0yd05fkN+lXR9a+3cl0+AlGK4N3wVnzPPKfec
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(40470700004)(36840700001)(336012)(53546011)(36756003)(70206006)(47076005)(356005)(36860700001)(6512007)(478600001)(6506007)(6486002)(186003)(82740400003)(81166007)(33656002)(2616005)(70586007)(82310400005)(40480700001)(54906003)(40460700003)(8936002)(2906002)(26005)(316002)(4326008)(83380400001)(41300700001)(5660300002)(8676002)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 12:35:52.0275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc537254-3137-4323-9ae3-08da715edfb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3302

SGkgSnVsaWVuDQoNCj4gT24gMjggSnVsIDIwMjIsIGF0IDk6NTAgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBPbiAyOC8wNy8y
MDIyIDE2OjM3LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEFzIHlvdSBtZW50aW9uZWQsIGlmIHdl
IGRvbuKAmXQgcmVzdHJpY3QgdGhlIG51bWJlciBvZiBldmVudHMgY2hhbm5lbCBmb3IgdGhlIGRv
bTAgc3lzdGVtIHdpbGwgYm9vdCBzbG93ZXIuDQo+PiBUaGlzIGlzIGEgZ29vZCByZWFzb24gdG8g
cmVzdHJpY3QgdGhlIG51bWJlciBvZiBldmVudCBjaGFubmVscyBmb3IgZG9tMC4NCj4gTGV0IG1l
IHN0YXJ0IHRoYXQgSSBhbSBzdGlsbCBmaW5lIGlmIHlvdSB3YW50IHRvIHB1c2ggZm9yIGEgbmV3
IHBhcmFtZXRlciAoc28gbG9uZyBpdCBpcyBub3QgQXJtIHNwZWNpZmljKS4gSG93ZXZlciwgSSBh
bSBhZnJhaWQgdGhhdCBJIHdpbGwgbm90IGJlIGFibGUgdG8gYXJndWUgZm9yIGl0IGJlY2F1c2Ug
SSBkb24ndCBzZWUgYSBzdHJpY3QgbmVlZCBmb3IgaXQuDQo+IA0KPiBMZXQgbWUgcGxheSB0aGUg
ZGV2aWwncyBhZHZvY2F0ZSBmb3IgYSBiaXQuIEFGQUlVLCB5b3Ugd291bGQgbGlrZSB0byBpbnRy
b2R1Y2UgdGhlIG5ldyBwYXJhbWV0ZXIganVzdCB0byB0ZWxsIHRoZSBhZG1pbiB0aGUgYm9vdCBp
cyBnb2luZyB0byBiZSBzbG93ZXIgaWYgeW91IHVzZSBhIGV2ZW50IGNoYW5uZWwgSUQgaGlnaGVy
IHRoYW4gTi4NCj4gDQo+IFRvIG1lIHRoaXMgc291bmRzIGxpa2UgdGhlIHNhbWUgYXMgaWYgYW4g
YWRtaW4gZGVjaWRlIHRvIHVzZSAxMEdCIHJhdGhlciB0aGFuIDFHQi4gVGhlcmUgd2lsbCBiZSBz
bG93IGRvd24uDQo+IA0KPiBUaGlzIHNsb3duZXNzIGlzIG9ubHkgYm9vdCBzcGVjaWZpYyBhbmQg
d2lsbCBub3QgdmFyeS4gU28gb25lIGNvdWxkIGFyZ3VlIHRoaXMgaXMgZWFzaWx5IG5vdGljZWFi
bGUgYW5kIGFuIGFkbWluIGNhbiB0YWtlIHJlbWVkaWF0aW9uLg0KPiANCj4gR2l2ZW4gSmFuJ3Mg
b2JqZWN0aW9uLCBJIHdvdWxkIGxpa2UgdG8gcHJvcG9zZSB0byBkb2N1bWVudCBpdCBpbiB0aGUg
YmluZGluZ3MgaW5zdGVhZCAoYSBjb25jZXJuZWQgYWRtaW4gd2lsbCBsaWtlbHkgcmVhZCBpdCku
IEJlbG93IGEgcm91Z2ggcHJvcG9zYWwgZm9yIHRoZSBkb2N1bWVudGF0aW9uOg0KPiANCj4gIkl0
IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBsb3cgZXZlbnQgY2hhbm5lbCBJRC4iDQo+IA0KPiBXb3Vs
ZCB0aGF0IGJlIHN1aXRhYmxlIGZvciB5b3U/DQoNClllcywgdGhhdCB3aWxsIHdvcmtzIGZvciBt
ZS4gSSB3aWxsIHJlc3RyaWN0IHRoZSBtYXggZXZlbnQgY2hhbm5lbCBmb3IgZG9tVSBvbmx5IGFu
ZCBhbHNvIGFkZCB0aGUgY29tbWVudCBpbiANCiJkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jv
b3RpbmcudHh04oCdIGFzIHN1Z2dlc3RlZCBieSB5b3UuDQoNClJlZ2FyZHMsDQpSYWh1bA==

