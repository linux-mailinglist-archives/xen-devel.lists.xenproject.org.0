Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34CB5927DE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 04:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386973.623017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNQ9V-0003un-Ji; Mon, 15 Aug 2022 02:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386973.623017; Mon, 15 Aug 2022 02:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNQ9V-0003sI-Ga; Mon, 15 Aug 2022 02:48:29 +0000
Received: by outflank-mailman (input) for mailman id 386973;
 Mon, 15 Aug 2022 02:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB18=YT=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNQ9U-0003sC-Af
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 02:48:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bae8bd11-1c44-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 04:48:24 +0200 (CEST)
Received: from AM7PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:20b:130::15)
 by AM9PR08MB6082.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 02:48:21 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::6a) by AM7PR03CA0005.outlook.office365.com
 (2603:10a6:20b:130::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 02:48:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 02:48:20 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 15 Aug 2022 02:48:20 +0000
Received: from ee454b643f5a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F82A8329-1948-4172-BD59-CD1F6C13CB12.1; 
 Mon, 15 Aug 2022 02:48:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee454b643f5a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 02:48:14 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR0801MB1918.eurprd08.prod.outlook.com (2603:10a6:800:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Mon, 15 Aug
 2022 02:48:11 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518%8]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 02:48:10 +0000
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
X-Inumbo-ID: bae8bd11-1c44-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J/XtMOBjyWoS0k0zwNA6RHXQP6H7WYzVwtFk6d7cwt5DYBav2upXRr0obV+NZhC2FIOVyJj32eQbBbfKWLuzQBS/S3VQ/7BJQmeViIQio8u15cz5o4iaTdGOlsR5gvWxue3vy2PZB/FzHCI+PCfpabScIBp9poMyFNJJi9x9TIX3sfmtzoAgk8gKgkhnS+2w5sVFGb8f2gf4Yr1V9stELQ0pFmzBSiIUSCdpIYBjBOJ6somR0J6FomHVHDYjY2iN5w5BQtW1lnJZ1tDqTVXk9SK29p9xgdBgRJOUVYoms7sa/3ZjJT1A1ebAzstOP25Sb312tJE3JwA3tHx30jgv8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRIeFdYVyMao82JpWjieA/+mPMpQ6dMc3boD2/gyt+8=;
 b=g64ZKV5zZ0ewRV79sbjRGHtV5Q8hHRvb1dqXBvwM4/7rxn6hqgFPjrZimsy9Y4BC/TU3Z1EyHvXMOIEOUyfJxVYLpl2oeCzYb+205XDbQIHPHfwLv2H/o5nCdFGu/Ny+YOz/t/f96CLBOgZ5/ormcBYIROcM+pVUXvZNk9G72UfYeapctMpLvcD0Vg2TdUqJqc7NQ1e6+slIVgpU1GuSPyAdWvEVbPzCb1/6AjS7a4Fk9I2uFK/Iqvz7Io4S7kohXgbSEkp6mI6n8bpLVdqpTElAubhgmhka2Qf617v+94IoONm94McAjxm5uvS5Pwhw03i7qSbcKv8yP2Z6fn3q/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRIeFdYVyMao82JpWjieA/+mPMpQ6dMc3boD2/gyt+8=;
 b=LWDsmqADeM80jTspYwxqAv7qQqJ1eoBGkRVxWHdXZKpX9ZvIzAJzTuF771ZM/GMa3dYsQ77iU2e0/eQS7DOYPOIGbEkdF/88ZzxQdGGpXTxSO2ggmxS/tmKe3gQqb7tksXvfqutMXWJpVI1ZZanj7KYrTXsgcCTTHgmmCkdSc0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCBgDe3LMEs9Y1JcUBXcQ2WcfHvATHlIrk4R3s3lxd9vNHzDBIEpMH6nyc9iEd1u9PSUYAB0Gg6UZ19I3aDHLLrrCrVb6xnkCZWBAJnKdt37s5epVluQikG7VbAu2UoQSn7af5+4XbYIEXab1zfBAuA59GIxTpu6E8u6ZsbrahnqkrYTfaghGR9Vy41BRMCG2nnx8/aOrzm7DYeaxmcVNezGWQGiyMbdFrZk+tATGEGgxbCLeaAZVU5n7tFoln/sJgJD+ryZ1wbuvWV1op2FiAgIt2llRIeGvY8ToAljf3Z90xL66YB68dqcfIDVHjX3iwgCX9kLeuD0KE5Ky7uz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRIeFdYVyMao82JpWjieA/+mPMpQ6dMc3boD2/gyt+8=;
 b=YaCedcWTdiPxn1vErc95f34uYwEp+Wi5hy/tE0JyVwOOgtvPGdrvUmWTyanl9lcPH+WPab3ueReudCkXDQKoDyL/5BKSjH1xyxCK7s/1Dth0tR1JOADE32jvpGgxY9Kd6IUNVMLQciwk/TeSdSaPV79YMxx5ak2MAwVsIwpDis5ADzMpUnJl2uG9QiK2Hm8j/c2xelkfOcla3zEayHo/GXuVKISv5Y1c8GSmEun74x4xJfBXA7klgSZLe1YkRWm1rLQ7nHcjpmzyGxpFkT+u6ys77Bn92+EPXuaro/z39pIzfJEXST7j8oDrPXq9rMOr/5CGQUy20DoYsL28SnN6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRIeFdYVyMao82JpWjieA/+mPMpQ6dMc3boD2/gyt+8=;
 b=LWDsmqADeM80jTspYwxqAv7qQqJ1eoBGkRVxWHdXZKpX9ZvIzAJzTuF771ZM/GMa3dYsQ77iU2e0/eQS7DOYPOIGbEkdF/88ZzxQdGGpXTxSO2ggmxS/tmKe3gQqb7tksXvfqutMXWJpVI1ZZanj7KYrTXsgcCTTHgmmCkdSc0Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Topic: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Index: AQHYroCGfq4LjWVrJ0OvR2UVvyJKya2vRYww
Date: Mon, 15 Aug 2022 02:48:10 +0000
Message-ID:
 <DU2PR08MB7325D7701DB5A7437173FFC8F7689@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220812191930.34494-1-julien@xen.org>
In-Reply-To: <20220812191930.34494-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2DAE58A5BC24D74CA7F4C22463B72A3D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e7d7a882-9af0-42c6-be33-08da7e689d51
x-ms-traffictypediagnostic:
	VI1PR0801MB1918:EE_|AM7EUR03FT006:EE_|AM9PR08MB6082:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oeL91+5hss9cE+ke7H2fKEE90dNfex0T0NBc4Dl6T+jyp954CJ/R1Uq+Ii/vc638K/rY3ckw4fBqC0hPPYu+RvMEhPvhMXF9VTYREBOqQ0GxLaj66/Dw1yZhoavNo4BNyaHoimSclAKIM48Zbk3HIPDv5+AAcnTBmaUnUwtAStLjXvF/oWDPDE+MnaL+wxbMzi8qz6bF1oCDeJulyq/P8PzVdR7IBa/+UfhHbgm/FlXA63knEHfWQFXrL3XLea7XfrXScMljMAKUMwqNJnYfJZkh7gurMtngXX58bNvPGBViaRuYOu96NRk1t/NWStIRUJDdJ4LxlHgVL+YCJ/JzqbCFnSa5FuQ1GdP/vxV2PFL8aF5XcYLSV2zbXujp9OTT7nEMhKQZiSBTPyFZXovzstQ88HND0QQw7qj4sBAKrZLYPWP0J1zSvqPgcCWhhta3Qe+ng3TGk3mB4f3i1HqKgde7G1GvHnYtFrYpYmBQt0a0pph2GVxaGu6mMNenQrOCt/ufNrvGrXrBuGvKGG0Tlrfv6xhC5Lc6l/lkpb9x+QN7B6ljIRvmkWJTozX8rfimyo0jq993cQ1JLD6KmxNbdObaa3VWxbntPadclAQOddYAbXXBI+TFAXqhWleCjpbByqdHs8w3LdeW4enuJrrO2eXXoz8Du5zT4KYcknMecUF5DanDyaVMM6GFadCd1EFBRP51G9KT9rpLOgK7N2UgdfaKCDfp8sDWYl7Z78GO4OrKQ0YS9jzjpmSzL/d27LTu2rZJEe2k2C6v5H1E98ek/va+P8OwDeF74x+7deHUeFakDzCP1LJ7bwq/twEcJcBn7RuXkI7nWVBKoP/db+fC4w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39850400004)(366004)(396003)(376002)(53546011)(41300700001)(71200400001)(122000001)(38100700002)(2906002)(33656002)(83380400001)(478600001)(54906003)(8676002)(66556008)(66476007)(66446008)(38070700005)(52536014)(86362001)(64756008)(4326008)(8936002)(110136005)(55016003)(26005)(316002)(6506007)(9686003)(76116006)(7696005)(66946007)(5660300002)(186003)(142923001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1918
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0ecb2b7-6914-43ea-75c5-08da7e689770
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0REwagubtPg683gP0GUXK3uCjFLDomUc7o98dQuy62p10zmpHJ3w+QOBJOsOaMBGrBE2KhyTCWGcy5o6YIaKek/ILOPNbAAfxmwo9rh3qXGfS0A1Unwpvf8dAiyw1dxUuPF0N9BOapHu5xgByKHNf0crgLV1h41nCQWfxPWM9P5kfQRCrfiiuhIK1uzAl7sGIr1l7BHhWkD4CKpUuHePhvqM6JI4pQckEatfPGAZJBi2Lt/1Q1k101Mhqz+jutAVVnwM3VoPzlCs558plDTUSzLVnmWHVD1uNLzsjQh4ykOY2RKuvYOTz1SqxQSFc0ay99EuC5803ZrkFf/jHZQYnrVGwP14xo8Jk4HEjpkQWZ7FyUfP9fDCmt8N3D1QBP+UJlVSC5+roGJ1QnLpZrhNBcuU7itXlaJSMkGnwpGky4GUH622Vm2ZknLc6OR5VpRe6LrFjUmCTS0pReroPpwrp5BJyK104Rlm8PduWyRefgXrDIx93LQ9wIYzpMKeYKTIloizbXNsBQYUykj4GCcO0xAcjCOhJJEBmpu2cLMkMMsh2PMg+6I097OOrDJ52R1Rq+3vcKGmgQ2DC+GiA8iPebexNEEC7+WPx/GaD4gGnkVcrnzx84pTdbyRZqOIbIV4rmGDF5x7DxpTKoP0LeyU2TbdJT044IhVwwaAeytF2IkC9sl2136cBlzlOhXSzIbXBKwAZtAUJt4Y8U6+ILYNBC4nZca+xgwNtztS4mkkcwXnJ0NbSCcmc+BMxjNYB7IBluFtwSsQ+a7gOAbv/2ZcndzfpC6ORsy91mfazauyBZKEiQoDSRaGDyLjSENTMT8S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(46966006)(41300700001)(55016003)(9686003)(26005)(82310400005)(86362001)(53546011)(7696005)(6506007)(40480700001)(356005)(81166007)(478600001)(82740400003)(36860700001)(47076005)(336012)(186003)(83380400001)(8936002)(316002)(52536014)(5660300002)(8676002)(4326008)(110136005)(2906002)(33656002)(70586007)(54906003)(70206006)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 02:48:20.6800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d7a882-9af0-42c6-be33-08da7e689d51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6082

Hi Julien

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Julien Grall
> Sent: Saturday, August 13, 2022 3:20 AM
> To: xen-devel@lists.xenproject.org
> Cc: Wei Chen <Wei.Chen@arm.com>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Julien Grall <jgrall@amazon.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu
> <wl@xen.org>
> Subject: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Xen build system the symbolic link xen/arch/arm/efi/stub.c. So we want to
> ignore it.
>=20
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Penny Zheng <penny.zheng@arm.com>

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index ed7bd8bdc76c..0d53eb304993 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -295,6 +295,7 @@ xen/.config
>  xen/.config.old
>  xen/.xen.elf32
>  xen/System.map
> +xen/arch/arm/efi/stub.c
>  xen/arch/x86/boot/mkelf32
>  xen/arch/x86/boot/cmdline.S
>  xen/arch/x86/boot/reloc.S
> --
> 2.37.1
>=20


