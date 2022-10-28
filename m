Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE4610881
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 04:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431379.684236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooFYB-00088q-70; Fri, 28 Oct 2022 02:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431379.684236; Fri, 28 Oct 2022 02:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooFYB-00086j-3J; Fri, 28 Oct 2022 02:56:51 +0000
Received: by outflank-mailman (input) for mailman id 431379;
 Fri, 28 Oct 2022 02:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooFY9-00086A-B9
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 02:56:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c47aab-566c-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 04:56:48 +0200 (CEST)
Received: from AS9PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::20) by DB4PR08MB9310.eurprd08.prod.outlook.com
 (2603:10a6:10:3f6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 02:56:45 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::68) by AS9PR0301CA0033.outlook.office365.com
 (2603:10a6:20b:469::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Fri, 28 Oct 2022 02:56:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 02:56:43 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 28 Oct 2022 02:56:43 +0000
Received: from dcfb1e350bc0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29A9A589-72F1-4256-A23A-FA8F282A9572.1; 
 Fri, 28 Oct 2022 02:56:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcfb1e350bc0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 02:56:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 02:56:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 02:56:36 +0000
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
X-Inumbo-ID: 29c47aab-566c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rqloq1PJzEKfnb/jInNuDZDCiD37L+IzFKwstL1qzt/4f2AT3GMW1rk96Nh7mP7/sE3ABmuNgV0yZ2x26oHcYBB2OL2Og9NEOryZDce+8mmMT+aUKCmmcff58SnKUIiGv+HdHZXc5fJjECni6a6UCzaf5MgUxx/xmrJ0XuqXriN6KzEei9HJ6A/MaLeRVlzfGf87p9IcaqfqllH4XhZWP09Iipl54GN9zZTRSK3Nk1j/bBnTEylaYvwzNZxw98Gppfcri+Aher1l9bVSq75km/XVXq8GXcOOISs0wPEL6sIoeulDvFfrZ2c4wo/id/vtEo0Hyc6oIIrGijgpUf3BRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49Yd57NvxfUThgErfcmRemkq9fQUMEBKdQumhm4wPjI=;
 b=deBqM6jSX5DUSeMJmGkZ6eW9awSjeRqSxTUnei2tig5vz4zcMuLwL0R3aLPDPPWKDcX8b3ARQ0qprjEOIJi6tRP4FSNsORGCxBPwJ/UIR9fgnQt+Qklj6hv5csq+Blos50AggTOwlTRjqfzU7OnFYJc0n557SXykbNxsXwj3QU+vYUCnzco01klfDiat0uuRAfjP4+kJgng9AkMm7gCzQODfpVQ8tp//j4wiybsWowvVL7IMDj+9HSZDTS3ePchU7elz3cLHlbryfrztObphT1saGis9TouU/TtuS3VLHv+3tX/LRWmWh5NKGeYcZFqqP6zmfLRe0V/zE/PMl9pxNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49Yd57NvxfUThgErfcmRemkq9fQUMEBKdQumhm4wPjI=;
 b=vZSEqJ+W4pwVq0XzvJFzH3F7RzWadIPeanfhKAD29UWWfARmcDScHJcSUlzUk7qIn6StZl3UjRzpBfQ6ewtJjYpGhgy/YVwgOwwxTQp2x0Gsa7rQBVLldTCm5df4n8U8eeXNfagP3IBoUoFuyLX5Sy5/uzGGteuOySJOs00D9/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLHeBA0QCvDHnyMYfZHAL4yUhQRzjYmSuF/iSkhR61HSYVqDBQ/bS7EWDsk8TQxFAh87uCutjGDJm4C0dGeIam+hl52HM+Gx/g+zpssUm0KhBRx+EMzi41O40nYgwvZZDIMYOPncBvXrTaDnjVVkki3U5bH/EJYElPz8ieFmw8CbyFSLjHP9brkyidNYri5WzBZw/shqKH+hJHZYT3EYxpgP9ZB9CjSrWR57X2e6/ZnHTB2MWyjgKMIoyYl2FJIRgMP7jOtlMG6zI0ZVx7V8reFrJqGklZDpnMfecAy6zzIQfkkAvmPFbGdRX62e7UrdMABeVmNz1C4W+GZiQwoJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49Yd57NvxfUThgErfcmRemkq9fQUMEBKdQumhm4wPjI=;
 b=IBCOLglb6z6RBLICijGdu9dYZoWiT6wwKeBzv4LWSwpfZmfP555IlwT/e5xig6VmkcfFVg+YRSfCUXQ6jTAAINyPU/zMVFW0T9/cfqwVsUpUoL98hLn6t3dZi0PQWXh5rOGcvbMOzRvqYfQYCd+j2msO3lPLNEcG52ZhzBIvZgXgUANT54NxfZ07Pv9kzZfOzy/ONz1BCFnxkPbIqLGP4gGmm/u5LhT3B2oE6NJiZ0Uc2eT7Bstx/WtPC7juVp23d2qDbyLO23YIeUDsL00eWD6bKb2PGd04mWxgH2rghjaeeOV79nR4uuxyK+HnCPcqbYn+0xgRCiOA9ayxbN8Uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49Yd57NvxfUThgErfcmRemkq9fQUMEBKdQumhm4wPjI=;
 b=vZSEqJ+W4pwVq0XzvJFzH3F7RzWadIPeanfhKAD29UWWfARmcDScHJcSUlzUk7qIn6StZl3UjRzpBfQ6ewtJjYpGhgy/YVwgOwwxTQp2x0Gsa7rQBVLldTCm5df4n8U8eeXNfagP3IBoUoFuyLX5Sy5/uzGGteuOySJOs00D9/0=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17 v3 2/2] vpci: refuse BAR writes only if the BAR
 is mapped
Thread-Topic: [PATCH for-4.17 v3 2/2] vpci: refuse BAR writes only if the BAR
 is mapped
Thread-Index: AQHY6gdlgL3IkW26406wHogcEOJe0K4jHZ7w
Date: Fri, 28 Oct 2022 02:56:35 +0000
Message-ID:
 <AS8PR08MB799101A292018EBBEA4470D092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221027132315.80592-1-roger.pau@citrix.com>
 <20221027132315.80592-3-roger.pau@citrix.com>
In-Reply-To: <20221027132315.80592-3-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DC4AE74C3684D740B4E3CE38E188EA9D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8385:EE_|AM7EUR03FT038:EE_|DB4PR08MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: b8472e03-6d14-4f1b-fd73-08dab8900bd6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YGp7a3nRt1DFccvSFBLqwchiGrG06pAG+loIhYHxWTh8h1ucc0pW5Ox4QehoT/oCtnXB7LpNsWbSs67ydVXEkumy9bbO7lcz4p/9vSBpE7nRvm+f2au6vuZUVtCoFyaH0yHhp34X/Qf4QEHfj3hNljNkz5axQsOBsKka9gI+ec5b5y1hdQuIoKP4ee81jZrcGyw37viBwP70nzkTzBJt8VOPGDBlE7Xjk/BZZnFIwo6tbOjjKA82g8wEYB0SaUF3sJlN7BxvoOz1A+Gu62WBtiUtpqu2XFY0mvqJ0KGntAwtxwsECMZIaGBihCdfXmsjvlcJuv/+dbCJnWxy71ZbyVk/nHpypqs1qXvXHYj6ItLNhgZCeflzxY/d6ZYetIcZvlFoSx5mYe5DZcmt5VmwILaxxjF9MB9A5rUCXku2J/kDEelK5Xa8kSdM4JvPW6jboM+JLI1LkEPOrynXiREI9r9FnmRQuGGWSdklT4Q5HaUElWPF9p+3RAodR4hWAxE/lo3hAJBO8S4F894C/xln4fJbEamRRdrHfwHzSXzNi7geYTn2esvU0ER+VG0rNWYSOhu0egrSVOYhUqX3jVNHvhONReQBTjLswTQIoIhrLQJzeQ5GgERPHhwligRf0TQrzsrDmLczhS4HRi70XLcksRRBsZgTnsFzdkC2uXeOdie7ADWHwpCaoKV0VPMrbCy+T3HCyYz3ixM6U1G30J8p6LMcQm+9XFUYtbaghTmIHAI+RzTuFRB8CE0+N+eF/Znd1vLDNybMOIgADUhXEsjreA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(33656002)(6506007)(55016003)(478600001)(7696005)(38100700002)(71200400001)(122000001)(316002)(110136005)(38070700005)(26005)(9686003)(186003)(86362001)(83380400001)(2906002)(8936002)(66476007)(66946007)(64756008)(66446008)(41300700001)(76116006)(5660300002)(66556008)(52536014)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d21cc7e-c25d-4802-382a-08dab8900714
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W8Pr0koKTOYSRx0RoYlqISyINmCbR9B7xBgQYtoIYvf2419eyUxpdJGh/s1wapcnZXISKW1fRrPzyR5XnsTsL48nzuIIic9eKPN6goSZnd/LIQmQCvNgKUrbs3eEReHvxjJT4mGXSnNZAfFNiTw04cfQoTESXqt5WqU/slZzRjHznwVsdgJV8UkUwAkYJuKrPLs7eGL/ZaRvIsHS6179Mv98uWPduebr0lRzijosDK/0ZbfbRQBysSIOoJgm8WIAOL4VvSPsi+zb5MVgmfSGeh7Pz+RsDixg1vlYHObi3Wn5brQjQXDxxsL+98AwzTiKU5k8ypqIubC1c/J/aD3u/PajwyHhLBtfCSESvrzfuPsVWqvnjzbgROO1ei2umBAqewv+BhvlFkmwWT+enmXNepyeT5pJDmMc20YKMDJ17VD7FivgovWm+HyXyytGXl4SIJy98Q/VYJOR0i82JJBxEPSYcApBZDRF5rRIM2bsfMBbly096yMBrK7Dmk4fMpqtndbxXNeFfDZcT6TqUmrqTGoitEnv3b4gaYD2sBYIemgs3qkfIvMuyXt/we55e562FGAOxZOwgLueJcz4W/LF7PEBr4+oCFtMw7U3TpErcMUdJf2YRPZ+s5AS2i3M4kKKLl/az0Ukii5d/ZL+ZM1AF9gkgWSDobPQ9tlTpUpCIU9/hbny4hYLNTWqTI8PdN+vPjKequG7rV5SElv1rU4S89KJCApz8Xpu5iTav1aFmlEVDyUdgR4yCKcQmryNMxZsJLP5oCkpIgSyilREUgYyig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(55016003)(40480700001)(40460700003)(82740400003)(36860700001)(2906002)(5660300002)(356005)(47076005)(83380400001)(33656002)(86362001)(81166007)(336012)(26005)(9686003)(186003)(478600001)(316002)(110136005)(41300700001)(52536014)(8936002)(70206006)(8676002)(7696005)(6506007)(70586007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 02:56:43.9161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8472e03-6d14-4f1b-fd73-08dab8900bd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9310

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3IHYzIDIvMl0gdnBjaTogcmVmdXNlIEJBUiB3cml0ZXMgb25seSBpZiB0aGUgQkFSIGlzDQo+
IG1hcHBlZA0KPiANCj4gV3JpdGVzIHRvIHRoZSBCQVJzIGFyZSBpZ25vcmVkIGlmIG1lbW9yeSBk
ZWNvZGluZyBpcyBlbmFibGVkIGZvciB0aGUNCj4gZGV2aWNlLCBhbmQgdGhlIHNhbWUgaGFwcGVu
IHdpdGggUk9NIEJBUnMgaWYgdGhlIHdyaXRlIGlzIGFuIGF0dGVtcHQNCj4gdG8gY2hhbmdlIHRo
ZSBwb3NpdGlvbiBvZiB0aGUgQkFSIHdpdGhvdXQgZGlzYWJsaW5nIGl0IGZpcnN0Lg0KPiANCj4g
VGhlIHJlYXNvbiBvZiBpZ25vcmluZyBzdWNoIHdyaXRlcyBpcyBhIGxpbWl0YXRpb24gaW4gWGVu
LCBhcyBpdCB3b3VsZA0KPiBuZWVkIHRvIHVubWFwIHRoZSBCQVIsIGNoYW5nZSB0aGUgYWRkcmVz
cywgYW5kIHJlbWFwIHRoZSBCQVIgYXQgdGhlDQo+IG5ldyBwb3NpdGlvbiwgd2hpY2ggdGhlIGN1
cnJlbnQgbG9naWMgZG9lc24ndCBzdXBwb3J0Lg0KPiANCj4gU29tZSBkZXZpY2VzIGhvd2V2ZXIg
c2VlbSB0byAod3JvbmdseSkgaGF2ZSB0aGUgbWVtb3J5IGRlY29kaW5nIGJpdA0KPiBoYXJkY29k
ZWQgdG8gZW5hYmxlZCwgYW5kIGF0dGVtcHRzIHRvIGRpc2FibGUgaXQgZG9uJ3QgZ2V0IHJlZmxl
Y3RlZA0KPiBvbiB0aGUgY29tbWFuZCByZWdpc3Rlci4NCj4gDQo+IFRoaXMgY2F1c2VzIGlzc3Vl
cyBmb3Igd2VsbCBiZWhhdmVkIGRvbWFpbnMgdGhhdCBkaXNhYmxlIG1lbW9yeQ0KPiBkZWNvZGlu
ZyBhbmQgdGhlbiB0cnkgdG8gc2l6ZSB0aGUgQkFScywgYXMgdlBDSSB3aWxsIHRoaW5rIG1lbW9y
eQ0KPiBkZWNvZGluZyBpcyBzdGlsbCBlbmFibGVkIGFuZCBpZ25vcmUgdGhlIHdyaXRlLg0KPiAN
Cj4gU2luY2UgdlBDSSBkb2Vzbid0IGV4cGxpY2l0bHkgY2FyZSBhYm91dCB3aGV0aGVyIHRoZSBt
ZW1vcnkgZGVjb2RpbmcNCj4gYml0IGlzIGRpc2FibGVkIGFzIGxvbmcgYXMgdGhlIEJBUiBpcyBu
b3QgbWFwcGVkIGluIHRoZSBkb21haW4gcDJtIHVzZQ0KPiB0aGUgaW5mb3JtYXRpb24gaW4gdGhl
IHZwY2lfYmFyIHRvIGNoZWNrIHdoZXRoZXIgdGhlIEJBUiBpcyBtYXBwZWQsDQo+IGFuZCByZWZ1
c2Ugd3JpdGVzIG9ubHkgYmFzZWQgb24gdGhhdCBpbmZvcm1hdGlvbi4gIFRoaXMgd29ya2Fyb3Vu
ZHMNCj4gdGhlIGlzc3VlLCBhbmQgYWxsb3dzIGRvbWFpbnMgdG8gc2l6ZSBhbmQgcmVwb3NpdGlv
biB0aGUgQkFScyBwcm9wZXJseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5n
IDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

