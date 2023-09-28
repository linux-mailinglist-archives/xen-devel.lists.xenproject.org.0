Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A480E7B1F2C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 16:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609852.949016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrb6-0006ep-OQ; Thu, 28 Sep 2023 14:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609852.949016; Thu, 28 Sep 2023 14:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlrb6-0006bb-Lh; Thu, 28 Sep 2023 14:02:32 +0000
Received: by outflank-mailman (input) for mailman id 609852;
 Thu, 28 Sep 2023 14:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABaI=FM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qlrb5-0006bT-Ky
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 14:02:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a956cdcd-5e07-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 16:02:29 +0200 (CEST)
Received: from AM6PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:92::40)
 by GV1PR08MB8353.eurprd08.prod.outlook.com (2603:10a6:150:a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 14:02:26 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::8c) by AM6PR04CA0027.outlook.office365.com
 (2603:10a6:20b:92::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Thu, 28 Sep 2023 14:02:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25 via Frontend Transport; Thu, 28 Sep 2023 14:02:26 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Thu, 28 Sep 2023 14:02:26 +0000
Received: from 1d227fcefd7a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 05B61E83-3024-4EDF-8EB8-5B03BE159111.1; 
 Thu, 28 Sep 2023 14:02:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d227fcefd7a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 14:02:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6183.eurprd08.prod.outlook.com (2603:10a6:20b:29e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 14:02:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 14:02:17 +0000
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
X-Inumbo-ID: a956cdcd-5e07-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU6B8YTkkRGNzno57AG1oohjFBYQQ410vcrX4AIZ8oE=;
 b=K2SnpfZJrt7/Ih64pIypgPJahq+PUNcut1qHiQAt0BJYbIGWd2H1k6WvNH82aGm044Y89nr4QJ8r5IH9EN0fG61x3wRxYjk7UZsHbbgrWJ6B60EQnGjeXHy24U8JOMGBI1+XhIRW4KH2zXD8ak+MuQ9xMfZc7ts0nC4u1VrSwUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbe8cd9fa62133a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh0OKXOi7+5UzODja08zgR3RFCsoMG9u49A6rPpNdK6I1+UJIwh6n0b2jm2IykyreAvRHe8r4nn73vCsjunr3/DSKp8cHzZZ6xlifj7XBPsNbmpThF0m5OjviUpQAfOPWEsPcSVtnVPdYBH7pz7tIgbYFJ4ZZYwAVZ7WoWlxssWDCJff8CXsrfrUJxKc5KVf4IzV5yyVEU1OEHPD+kzoRfvvPmKH5GY4LlA4uowOyhAA5rlDeZBSXE+7vf2QO+X4EhH7Bg78ZVV20ecSN401oD8KvBiuR9BRO+xBiZQ0WU8VP970IM+OEaRAideqlHz9KtgRodxXdG9VQ0gha0QALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU6B8YTkkRGNzno57AG1oohjFBYQQ410vcrX4AIZ8oE=;
 b=ShsiIIqGF5jQBu7PATzGEYlbpKm8iOUYdzNHPt9vvRbCJNH9F5OPWUCvNf8qj4TzGy0OkECI46zjgAGoZB0V9J8rWIvbC7XcPPjWbFpgLRBJu9xR9TmhWarFsLTS51tGkz1HM8admLL7adabfqo001qv5aYSzxz4NKnQXLPDzDshLP7IGdcRyIhZiucPRSDmgQJurCx4fjdntrpNLHad2K2hqD3ZxQ0tDO5mqw/0IA2AEHivsbgigbM0uW1Kc6+zgEyMYQxNBSljtGWx4P4j0cxQTpoWGRZjvMejnp09mlNrM6J5W0u+ao+9EjQ9I/3nGEi/m6isbGKi3f2LNpltHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU6B8YTkkRGNzno57AG1oohjFBYQQ410vcrX4AIZ8oE=;
 b=K2SnpfZJrt7/Ih64pIypgPJahq+PUNcut1qHiQAt0BJYbIGWd2H1k6WvNH82aGm044Y89nr4QJ8r5IH9EN0fG61x3wRxYjk7UZsHbbgrWJ6B60EQnGjeXHy24U8JOMGBI1+XhIRW4KH2zXD8ak+MuQ9xMfZc7ts0nC4u1VrSwUY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
Thread-Topic: [PATCH] xen/arm: Validate generic timer frequency
Thread-Index: AQHZ8ghdP0qqL8lJK0yXEjdflFNrbLAwRKqA
Date: Thu, 28 Sep 2023 14:02:17 +0000
Message-ID: <EBA97CE4-CA12-4958-9666-FE4E1CA91495@arm.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
In-Reply-To: <20230928123435.2802-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6183:EE_|AM7EUR03FT051:EE_|GV1PR08MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 55515d2b-3380-4d49-d1ec-08dbc02b8bb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KWVNXpi4tUpmAzWef6ggShoeDqEsbRCdkpDaM2RVIaXSmdbAhPs2WIJQR33eMy6HGrZ6ZpE8cEXWiTFv05ccXhrSwp3H4SO7exyRIfKgLJfqm1s2+IPVg2XO8oqbk44SSCEtprDTiUfT5AwfFEt0oOoKOMZxmd1DRlnQ6HgVTzN1eVuanrPICVtq5yPHoLJjlnznFOHt8zIFbjJ3GsVz3PwkR7SDzuHCnOvr4XnlZoBAN/jR+fqMYNqRkdura1haQGcLB0neqO6SbsHRJe9HAJ6Xf59LTyzXZDTXXbb/GLa9WJVNTHfmo8syQdHU1WIry2+gE3Sx3bH5ZGrByMwoF5LxDg109FhtlUkhYj8zwADQQguDw66vyAmqReAJR75u9FJtkIRg14XY2AEmA/W1hYzYLkFy19/e2UrinjExD3WhZk0Bz8P6yHPHu4iBLUtC6zCCfkAL3vd6KveZsuPg2bvyJFOeKPvBwSuADBp4+q8Wd2JfNshYC/h3jruMManOKkS9v6gFWQDYGY5WiYbFNQioCqPnJ9EYGf+4b6nn+3+BOSuTkCIo1kLxSMcWVQsDBdab1Pay5MA8rFbDWkmd+wFnzk+VKB+kyWL0IT4UKXTMUVDpxzd2BNFI82aFRvF6ZhrFd2gEC06aEsP/j2OpGLSCYK0cJhMkrqo/b9MrlP8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(8676002)(4326008)(8936002)(122000001)(6916009)(53546011)(33656002)(6506007)(15650500001)(2906002)(26005)(38070700005)(38100700002)(54906003)(66446008)(66946007)(66556008)(41300700001)(76116006)(66476007)(64756008)(316002)(5660300002)(91956017)(6512007)(86362001)(36756003)(83380400001)(478600001)(6486002)(71200400001)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5DA600E03D36D41AEFA1AC230ED554B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6183
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5aee89d1-d279-45b8-b003-08dbc02b86b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cHPXvttLSEygKKQ9geGc7Av4rFnSXq7FcaUiV9eJngU80oOjP0CAkusXXAxJZu0GukXa7zLXOFR6bSMtZyRq/DHGgI1iuKByWG65T3ectY7OfB1Thf4wftb82TxA0EUsm9FrQegHcVfQ7BVtEK/Mkl6OMKkfsAF1Wvyjdqe2ynM+kRxvTAJTxiM+bKeYA1PzgRONxQpfPe+sbrWhz2WlfBek7tIcXCs41Y3ROFkXRmKVdFEGH2ZPnjv5X+MLJ7hHR+3bcWX1UshI+pZ2ymMb1MG1m5F4IbA28BoOCbcBDk36WMOU116bvC7TwFC+r8qKSYh6eknNhgtHfjv8x1+f9zo5UbphAg0hEoVC3hFdLn7xPnLZDq9DhpSYkmyQ74lfV5v04SUM1GejHjV0YzkYAImYhRZvXIEpgTxi16wRbTyGdAbH+7RWkllJd5xKojcYpFhU4YkWNld2IhSNpd1ijmGBxdANRwfX1OWuHMqnMtZGteaXEESLXepzDfkNNLZRm6Vepu9SJFZ6IkOkVFG7YpBMBTW+7exQo6KqiiLHx7isb5eiWqrs3X8sMjFzif0TgBXoTvMdK8sJee3xZ2En2C7XWqxkaiBKRcHUWcjQeIdVFqNzisIS/kuRD0u2iY1oZahFwUxrpOzLlvfarHhMvsaW5M+0tciIbKyX4kY2KG5bBltlPycIH5znwzp6Bp7pjpgiev+rteIUtpGnPH9DxYZ0XRVrJI4ni0UWqUL1GlfnkeR0VvWnJxrYY85CFNxbbywRBeN2GkfnaiWiWc3IYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(6486002)(26005)(40460700003)(478600001)(2616005)(83380400001)(107886003)(47076005)(336012)(356005)(82740400003)(86362001)(81166007)(33656002)(5660300002)(36756003)(36860700001)(53546011)(6506007)(6862004)(6512007)(4326008)(40480700001)(8936002)(8676002)(2906002)(316002)(70586007)(70206006)(54906003)(15650500001)(41300700001)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 14:02:26.2507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55515d2b-3380-4d49-d1ec-08dbc02b8bb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8353



> On 28 Sep 2023, at 13:34, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Generic timer dt node property "clock-frequency" (refer Linux dt binding
> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
> override the incorrect value set by firmware in CNTFRQ_EL0. If the value
> of this property is 0 (i.e. by mistake), Xen would continue to work and
> use the value from the sysreg instead. The logic is thus incorrect and
> results in inconsistency when creating timer node for domUs:
> - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>   is set to 0 and libxl ignores setting the "clock-frequency" property,
> - dom0less domUs: "clock-frequency" property is taken from dt_host and
>   thus set to 0.
>=20
> Property "clock-frequency" is used to override the value from sysreg,
> so if it is also invalid, there is nothing we can do and we shall panic
> to let user know about incorrect setting. Going even further, we operate
> under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
> not 0) in order for Xen to boot. Therefore, introduce a new helper
> validate_timer_frequency() to verify this assumption and use it to check
> the frequency obtained either from dt property or from sysreg.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




