Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9E35FEB3B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422591.668718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGWV-0002RH-Gm; Fri, 14 Oct 2022 08:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422591.668718; Fri, 14 Oct 2022 08:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGWV-0002OY-Di; Fri, 14 Oct 2022 08:58:31 +0000
Received: by outflank-mailman (input) for mailman id 422591;
 Fri, 14 Oct 2022 08:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojGWT-0002OR-Ou
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:58:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e408ea6-4b9e-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 10:58:28 +0200 (CEST)
Received: from AM6PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:f0::48)
 by AS8PR08MB6389.eurprd08.prod.outlook.com (2603:10a6:20b:33e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 08:58:25 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::36) by AM6PR04CA0071.outlook.office365.com
 (2603:10a6:20b:f0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.25 via Frontend
 Transport; Fri, 14 Oct 2022 08:58:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 08:58:24 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 14 Oct 2022 08:58:24 +0000
Received: from f57c6c489b5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A3837B2-6B75-43EF-B9DC-5442B93845FE.1; 
 Fri, 14 Oct 2022 08:58:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f57c6c489b5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 08:58:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 08:58:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 08:58:14 +0000
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
X-Inumbo-ID: 5e408ea6-4b9e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eSgI+VNfGKvnYVLGG5yEo5QGYDCU3qbsgp1mPksy/ETVynQHrDzcQ7adE8NVlPhLaJW2/tKZ6guJWJA2PfRHsHZSj4NLH9bGvcH8rYKwqhq9wYa2v+JByVxoHc2wxYiX0UbmBUDmYf81wbPD5puCETOYHRu+L5gJg7/TFvy5ZqHA2bUeYcDhICSleeoXhOtosryLbzMu4f6WsQz8z4Ie9a7GLYdsdYyDbNTxmQMZpE8TXVIFtOlcyinMThMKPJBTk+KXiJylQdqhqwXACl1/RJcC8UCld+CiNkNUsi2qsFEE6J2j5fQFyoPX2dsffM3ahgyInW95gOwj0cq75xoJ1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wb5r6reTnNDlEtTPWq9l4CeLPdCvnAggvKIf7zFl2U=;
 b=CccaOGj84fn6qNDUTVm50iPC/bPZ5SZILNmG0bYpLMJzf/BF+zJn3Av4Gmgc+bSgzJeEY2nMtQzMkvrF8GsuxZ3go2GooOuHdR1OoMCpPN+gSDpS6xs3n/Tn5hm6aUycvK3LXY+tme003VjbWyz1XxLq0oih5SdyylCL7vRmtk1EGTXyVyhVUwFo3texOC4H4lw+PIfbDMgqpGh6Y17V8PW1KoVnzy6J2XsIRUoX02vPSNLxwzehjtYNZtrefxs54vofuxrjAIBf50AP1nwDeCQyr6w8kjRAJKniYxCQmAacxSqvbkX4ExcJy4Nx7RjID/qAmCJCBw2mIFtEAoWU2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wb5r6reTnNDlEtTPWq9l4CeLPdCvnAggvKIf7zFl2U=;
 b=hwi4t5hqUa6TAo5mj7Jn8Xv9GMV3IAhm5WS9bI9aCK9WhWxn38A7YgQl+IQsxhCuq0XWX/7uJOW90oBtWQcn5dUH5pt+KJbfHt0Ev+tLR174JmNr9u3Ds7pvhp91uBp9uWe5qABiKacUtD9AXvwpXVptk3wVFSbxYK6RSaZOhAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlozsO6I/z8+6b8Ud04WgUPJ5OOjuT16E9pAqCObTOzD3tGbWyxla/OvNuW39ho66fwkGoRKO5a3VUjGSdH9ot7y0ATE30eGqilbZWe+mpBmEhW2PhLhdts4ODrJi5jT4QszsHmMy2EGUVNP16gpIHALgbidd1vhX2MGbsIGz+aLrr3klQ8/1En7PBGRXbR/8xWJlcKfAZN4HmJ6/Bpx2NOKTB+7CvJ/dp6rzHPXIJ+pIWc4nTpKc4rsrVn7dyG2AWfmvoC0xSW8DyErQPIFqp2APd9SPt1BjUx5DJWGkm4EjAGbgqHSGGBcsG/eZnqfuoRgv0td4Mz4/ZtU/pqupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wb5r6reTnNDlEtTPWq9l4CeLPdCvnAggvKIf7zFl2U=;
 b=MKNu/pnqZl9iWnseqoRQXl75TVpnISzyZR1VTO8ZsOsIkjKikjMeRJ/KSPKSjwdHnQjaW5YJ7eU/olPJ79W1/mhdqzfvNB70y95bPkomHT+UpofAQg5wIRmYLbX1l0EeJHjvWv4OXTo5usHIhrivdZLhDXVwaqYvZdxeAmqWnVSZRt+++rZaTTSORGq3BrvKZr6m92P6sXURGpdV1nuTfXVCGPifNNRk0NUD6iTh4JoRay0UD0H2DfpN8RcrzlBtING6jtlF1BeLU9510MgWMsCRp2NSciwXfwWf5/yBqfEwLIshsqtL/VON2+DdS5Rm7i4YUHD7p9nz9xEKBYMC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wb5r6reTnNDlEtTPWq9l4CeLPdCvnAggvKIf7zFl2U=;
 b=hwi4t5hqUa6TAo5mj7Jn8Xv9GMV3IAhm5WS9bI9aCK9WhWxn38A7YgQl+IQsxhCuq0XWX/7uJOW90oBtWQcn5dUH5pt+KJbfHt0Ev+tLR174JmNr9u3Ds7pvhp91uBp9uWe5qABiKacUtD9AXvwpXVptk3wVFSbxYK6RSaZOhAQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Topic: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Index: AQHY3q+bU7An58kRd0C18nD7mqtwpK4Nk9IAgAAAuGA=
Date: Fri, 14 Oct 2022 08:58:14 +0000
Message-ID:
 <AS8PR08MB799119B54A5FE419CDDB9C1592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-2-Henry.Wang@arm.com>
 <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
In-Reply-To: <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 193FE62B250BB2468D760A950D2F3A02.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5622:EE_|VE1EUR03FT005:EE_|AS8PR08MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c75b1b-8986-4238-81ba-08daadc2408f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GjqHsnltdA+cfc1NyVlItHwBlSGzMRaf2RXCZnD1mRCmT0k5c4ggdbreULCjzfA7O35rfyr54l4YEgDUrsz1ZkIc+RpzZP2SKzL15rKHTglGPZylpkRwdeYmnfZmeV2/SfT0hCsKRAAhpuJOhMwq1bYTylWssMo6XknAjLuurzsjK6cWgire0M+Fn+1qjds1MtOLrorApWVf9k9tfkRN9um/fzwYKg1dxUtd4N3ue2/uw2B2pxlZCrNWVySDKlhbG9F6rI+ln0sWtDd0OOWPGRmonCL6JBCbbDI6fy/wkSJL+LUPzeGtX6XrdZn2Tx3cwSfdCg4OVR5Eq88nSKg3zRX4JOuRtkzN/PXFplU8sHbkiCmaJ9r1FF6oM429pNWS2OLFMA0g4tVQAVuQqR4H+SV2mh6Y1ODqzVQ7AqYp4I5KwECBfSiP+iW53jkAmnyPBUgbvXI2LHpoTa1mA5KbQgxnhxXvaMFcASSiItScUoKSMORtazq2IBQ0GtfjZ+H6S7RFcoZmA20mpOSYG/FLz/zSVpvJf4Ds9xygOOCMgrH2KwLq8txvAr0dEAQdD82kP/UgVMtkLynanZC6q3/3olSEdqLP31UXuPvsHXjPn+d/Mo57ggR0m/dGaYj3W+QDPYI6hWuFEyTNwJmJEqHBt9rTLzjeMqYVwZCZnqOHbzpDQECIGesCHhFuQD3PsBLrit85dQAu4eleeQFqFDnjwOOms+7GN2Xlbae/7am2wc7thJQrejuO833CVVYMDjV9hyyBiYg375h6CMUDRIEC+A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(26005)(9686003)(6506007)(186003)(83380400001)(7696005)(2906002)(5660300002)(55016003)(71200400001)(54906003)(110136005)(478600001)(316002)(41300700001)(8936002)(52536014)(76116006)(4326008)(8676002)(66446008)(66556008)(66946007)(66476007)(64756008)(86362001)(33656002)(122000001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc8ecd20-ebb7-43a8-51dc-08daadc23a8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMYnJmDFKIP0EHJFrFmJwbHWTqIhMXBF3dvosCIedZm3FOI+ddMp5LAQa8GldWbzPn43c/kzKpbVwQUnBRY98auCwjYIAh4sjSDrPKu1JUHNilpqo8CLURPTTPPfpg4PmZgl3p6tLszUakTKJtWmDlvBugCWPVW3SDV/cIKeREiG06siYdpVyCvOc2rHq5n0PGZUZ3uq5gbxx54uCxk7Nv19ivgP4+LXDvApZwirGTGBYSe5EfYgnbMsYc/ILKWPBBIhlyDuCmgihseTKBJSryhECJ0hTzwRWxjQ1usP6fLZFsULKV8ZOwQXJdMgBvhAUEPYbFFUZQvEEeRKewC9xvDYhjC/A9hAiSFQ3o6PeMHpe9rWwCx+q/3OLU7Kl3vxSD2KNUaxrd8ld3C+ptXSMI7Mu+ztThn9pNbil7NquqZej11iaA7J/bR09xtN/9sWv5qDvj1Sy6KwaHEpjZofd41RPJtR+I4ShseYjlZQLHjb2Vj/I8JbLZWvCU7/izXdvAZELpv+7ws6Uq2ub3MyMor5IFi4RsdYzh5EViJhZyX9W95vmIBc9N0Ps4kWnOvaRTbPYjgHJCxettq9DHHATrtAFn74NCRLPuzg99Q64wzqNp8m9MXDeaBi4iuugM0lbf5/Qh3EQlRYkbkSU5so76eEAHgWsgo+egKThAkIFx8Xp47UDl06kFo9k1lX3AqnWzKS4lXRe5FHY0xFLlBQOPbEoptjQAav+vmK02pWGJWKNmCSc4lvQ6+cEc2uMVNcn/a+Owtmv3t+29kcwSGtbQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(33656002)(7696005)(6506007)(8936002)(478600001)(41300700001)(5660300002)(52536014)(316002)(54906003)(36860700001)(107886003)(110136005)(4326008)(8676002)(336012)(186003)(356005)(55016003)(82740400003)(81166007)(86362001)(26005)(83380400001)(9686003)(40460700003)(47076005)(40480700001)(82310400005)(70586007)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:58:24.3503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c75b1b-8986-4238-81ba-08daadc2408f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6389

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcg
MS8yXSBkb2NzOiBEb2N1bWVudCB0aGUgbWluaW1hbCByZXF1aXJlbWVudA0KPiBvZiBzdGF0aWMg
aGVhcA0KPiANCj4gSGkgSGVucnksDQo+IA0KPiA+ICtVc2VycyBzaG91bGQgYmUgbWluZGZ1bCB0
aGF0IHRoZSBzdGF0aWMgaGVhcCBzaG91bGQgYXQgbGVhc3Qgc2F0aXNmeSB0aGUNCj4gPiArYWxs
b2NhdGlvbiBvZiB0aGUgUDJNIG1hcHMgZm9yIGFsbCBndWVzdHMuIEN1cnJlbnRseSwgdGhlIG1p
bmltYWwNCj4gcmVxdWlyZW1lbnQNCj4gPiArb2YgcGVyLWRvbWFpbiBQMk0gcGFnZXMgcG9vbCBp
cyBpbi1zeW5jIHdpdGggZnVuY3Rpb24NCj4gPiArbGlieGxfX2dldF9yZXF1aXJlZF9wYWdpbmdf
bWVtb3J5KCkgKGZvciB4bC1jcmVhdGVkIGRvbVVzKSBhbmQNCj4gPiArZG9tYWluX3AybV9wYWdl
cygpIChmb3IgZG9tMGxlc3MgZG9tVXMpLCB0aGF0IGlzLCAxTUIgcGVyIHZDUFUsIHBsdXMNCj4g
NEtpQiBwZXINCj4gPiArTWlCIG9mIFJBTSBmb3IgdGhlIFAyTSBtYXAsIGFuZCBwbHVzIDUxMktp
QiB0byBjb3ZlciBleHRlbmRlZCByZWdpb25zLg0KPiANCj4gSSB0aGluayB0aGlzIHdvcmRpbmcg
aXMgT0sgaWYgdGhlIGZlYXR1cmUgaXMgYSB0ZWNoIHByZXZpZXcuIEhvd2V2ZXIsIGlmDQo+IHRo
aXMgaXMgc2VjdXJpdHkgc3VwcG9ydGVkLCB3ZSBuZWVkIHRvIHByb3ZpZGUgc29tZSBtb3JlIGRl
dGFpbHMgYWJvdXQNCj4gdGhlIHNpemUuDQo+IA0KPiBJbiBwYXJ0aWN1bGFyLCB0aGlzIGRvZXNu
J3QgdGVsbCBhIHVzZXIgaG93IHRoZXkgY2FuIGZpbmQgdGhlIHNpemUgdGhhdA0KPiB3b3VsZCBm
aXQgdGhlbS4gQ2FuIHRoaXMgYmUgZGVjaWRlZCB3aXRoIGEgZm9ybXVsYT8NCg0KTXkgZmVlbGlu
ZyBvZiB0aGUgZm9ybXVsYSB3b3VsZCBiZToNCg0KTXkgZmVlbGluZyBvZiB0aGUgZm9ybXVsYSB3
b3VsZCBiZToNCg0KVG90YWwgaGVhcCBzaXplIG5lZWRlZCBwZXIgZ3Vlc3QgPSAgMU1CICogbnVt
X2d1ZXN0X3ZjcHUgKw0KICAgIDRLQiAqIGd1ZXN0X3JhbV9zaXplX2luX21iICsgNTEyS0IgKw0K
ICAgIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGZyb20gaGVhcCBieSB4emFsbG9jL3h6YWxsb2NfYXJy
YXkgZm9yCXZhcmlvdXMgdXNlcw0KICAgIGZvciBleGFtcGxlIGFsbG9jX2RvbWFpbl9zdHJ1Y3Qo
KSwgZC0+c2hhcmVkX2luZm8sIGV2dGNobl9idWNrZXQsIGV0Yy4NCg0KSXMgdGhpcyBmb3JtdWxh
IHNvbWVob3cgbWFrZSBzZW5zZSB0byB5b3U/IEkgdGhpbmsgd2UgbmVlZCB0byBoYXZlIGENCnJv
dWdoIGVzdGltYXRpb24gb2YgdGhlIGxhc3QgcGFydCAoYm9vdCB0aW1lIGFsbG9jYXRpb24pIHRo
b3VnaC4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSWYgbm90LCBjb3VsZCBhIHVz
ZXIgY29uZmlndXJlIGhpcyBzeXN0ZW0gd2l0aG91dCB0aGUgcmVzZXJ2ZWQgaGVhcCBhbmQNCj4g
ZmluZCBvdXQgdGhlIG1lbW9yeSB1c2FnZSBmcm9tIGRvbTAgKG9yIGEgZGVidWcga2V5cyk/DQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

