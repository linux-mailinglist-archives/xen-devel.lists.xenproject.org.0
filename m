Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262696EDFAF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525953.817504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prFIA-0001xf-Ie; Tue, 25 Apr 2023 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525953.817504; Tue, 25 Apr 2023 09:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prFIA-0001uo-FF; Tue, 25 Apr 2023 09:48:58 +0000
Received: by outflank-mailman (input) for mailman id 525953;
 Tue, 25 Apr 2023 09:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prFI9-0001ud-6Z
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:48:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640d4e6d-e34e-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 11:48:54 +0200 (CEST)
Received: from AS9PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:48b::20)
 by AS2PR08MB9272.eurprd08.prod.outlook.com (2603:10a6:20b:59b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:48:48 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::46) by AS9PR04CA0071.outlook.office365.com
 (2603:10a6:20b:48b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 09:48:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 09:48:48 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 25 Apr 2023 09:48:47 +0000
Received: from 878cdd0a9ec5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3111A1C-299D-4D12-A4EA-E5A447026703.1; 
 Tue, 25 Apr 2023 09:48:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 878cdd0a9ec5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Apr 2023 09:48:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9451.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:48:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:48:35 +0000
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
X-Inumbo-ID: 640d4e6d-e34e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z28GOUe5s7WC0tnX/8jCpcrjDY2WrCcBIGidUSVw+hg=;
 b=gSP5S4GGO8zPE0j6pjlZzHsyKihPosHxlCElzfpV7EksXYvMzxb2s8rKOmEjlVzpd372uK2GJn7nCRa2KyMMpnFBoCpgqoLNTjTrebS6aIgeUcHSeRgSPb/2CzMnhfTLp1QP8yxn3jM1f3fds9nfa+5/rOGuPPA4vUZXScEmNyA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd3wLNk2Z+t2oguNVDoQEBQVXi8vKBCWz9WYTTg4euih07n7Za/qdH+dirTAG4afB6MSQjVuStchziR8LI1iQI82fvanZE2FNimuZjzg9G5QxZVxqOQjRl88iXF7bhoihUqc7jaEGQRjET4sYyuPvEt9fOIKykk1vdFzh5baJoF37e7uGxinhSfhKd7OlJhT0kQhzfDFee6hbWMC7+H9viJC9S0wPAWSEP4Moa9JVKVNu4dU66Ac4XXRAVH41lgyPJ+mqy3HHmt/UbPQzRDzd4WrPJx2stT8ABtx3trsbjSDV3kE/lX02/4KX0XenR7j/CrYi/Qb5ICFFV5hbvdSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z28GOUe5s7WC0tnX/8jCpcrjDY2WrCcBIGidUSVw+hg=;
 b=SAq/U7n652t1JTixnvOpsaG1yheqZ+ByC3ddWqC8UKtC7qdabMi16uoRGsXTZf+7wS3xqtkqVtKzHuUiE34sNNAa5xyTknaAPhfbuaRrOuM1zFWsrw6Nt9L7+PUbljfXWLEgwZAbtOfelVHmn0a8aiN52IHKLOOBwSgKZbJjRGNafHf5nAeIjBAbD53XnWodpVeSZuHbXlfsW2JDTHoxNSQ8+o1joTRGB8DM9Yp79Iu/EGtq+OO79MMdCiIR865kwwIssRxtBtlGvUjr6Qk4QLGPXI1Vmq92DNtoCHHEDFSB8NcuwTpSjAwuLetqoOS4WLC1Jo8vO83+3E8RENXFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z28GOUe5s7WC0tnX/8jCpcrjDY2WrCcBIGidUSVw+hg=;
 b=gSP5S4GGO8zPE0j6pjlZzHsyKihPosHxlCElzfpV7EksXYvMzxb2s8rKOmEjlVzpd372uK2GJn7nCRa2KyMMpnFBoCpgqoLNTjTrebS6aIgeUcHSeRgSPb/2CzMnhfTLp1QP8yxn3jM1f3fds9nfa+5/rOGuPPA4vUZXScEmNyA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v4 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZd0uatmvJ8yLEu0+BYdIuaJgbea87s6sAgAANHMCAAAVQAIAAAOFg
Date: Tue, 25 Apr 2023 09:48:34 +0000
Message-ID:
 <AS8PR08MB79910D85653598521265BC8992649@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-4-Henry.Wang@arm.com>
 <7d2c221b-745b-109e-af1f-2b78504b2e0e@suse.com>
 <AS8PR08MB799137BF5927B402E7B0069392649@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <426a6ed3-f0fb-afa5-c685-4f8cdb0d2ff8@suse.com>
In-Reply-To: <426a6ed3-f0fb-afa5-c685-4f8cdb0d2ff8@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C724B423BFFE7D499DCA6C081B2C5B36.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9451:EE_|AM7EUR03FT049:EE_|AS2PR08MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: d2871352-fb7a-40dc-fd8a-08db45724487
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 86Qa6v45eKPdi670Xt+hUDIMpkx56c7gllpyzq4OC0wwe09BDCk78efSSUSB7gX87Wq+HgcOXZK78RyQZNh1duOmlVvvDP0Vcyaafzr6ErR6ASjLphw5gczAESiSgSfFyc1boqnD9+uIOdf5zjLoj64XAXyOyj/9DgX7ep4c8gWP4wyzW++Y6p7S9O8yqy1RfQoiJz/caPuZDeBFKHQBPXEvMgVKnKQ0bqzKHYlaTTHt+bWAuwCWuZCdpFJ1E8nJWPJwsEd35BGnFk/VopXCwzj247f3FrvqKj2riTzJSTmrWQyUOXpT1z00k1hLydaQiP20i+t3dTeUlKuWzoJKqQWgTQMyhWe5cmCGVxwOF5SULlAjiBxty0VXwVWsHfJYbJVMtqjKPCbG4dTa+2sY8ZjjgGWHNbKAkgASAnUSDfYyiVldNHIRM2BbOj+6Wb9aRsAyS5YQ9LrqFLn2VPhD/gMVuXqFph1syRUER+xnm2YqmNvuGhbZSdwI79jgP67+yLa9jL8anHiBJWF9tFXbI4JQCabVQRngS+81O6P1pHYJSIAVYr8KT5Mxz8E7zIRosIx8mrY2c7Hx+Hf8yh37d4UuTb69e1bauR+wnaqV8ty9+Cg/qjm9bxP/a58KWOEI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(54906003)(38070700005)(478600001)(76116006)(316002)(66946007)(6916009)(64756008)(66446008)(66476007)(66556008)(55016003)(122000001)(4326008)(41300700001)(2906002)(8936002)(8676002)(52536014)(5660300002)(38100700002)(186003)(86362001)(26005)(33656002)(9686003)(53546011)(6506007)(7696005)(71200400001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9451
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4dbdced-cb5a-48c4-f862-08db45723cad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	POWADSoQ13QNf1nFYS61oMyEk/GHwHBjNTbLEROHBnBU0W4vj9deprpjaF3GeSFbJZVNkFBu70uaQxgB0Bx2ynPh8LyisW4v1Z4dJ5BPlVl75adY2CL6A1Qs543taNh7xypEGHMHvk/Zhb4IBrdfYfSQzaT22Vlp0JES3962SaovwTPje1JLwbbb/iLXqfT9mLSaW93hHi39DwV1aGfo4PPTYZ0r05b7mBem2NTLvU6MqI2lxDiGpRFgLyrcYSSFCZvZOcOQuBlrn+4ZmWRoNYRtE2KrW9XiC9VkxDhYC3MPXj78j3qVdqT6SIR9tQF6wx38MS+sR/kHjG1kgRkqAFSFOAInwNX+qF2oXAqOmxjtY17Zsba/H7J9ddfdRrcJXVs3UlZ1zKnFDR2ZRlGtEZIc3bEE3QvFjL2ue44foi2oJaXyjTSLhJzNJY6dyG7W6X6itrHmYL0MsvhUp3ee10TNZhF76NWBRq6N8jYOxhpBVe2QUXuuQMnTvRDAS+wn4sBD3vJ3YgQgqpI+BTCM6BO7iLJwNQ+ptBbc8CuuD4fVKYCjYc/3BC2Gg8sVBhLd95MFGxDabtClb+Z/6/CKMX1YIKjlHJpefJ7tY8vE4iA6x4BgqgrsILfQ7ZjALix6EAi1QK2cEJ/T8BwU2oNe8sgCS40AUgnBFfwjkO1jtcVfSbwfuNkHQDdd8CNiJbk0lk6yhGtPEkQuq9f3vvuKsg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(336012)(356005)(82740400003)(81166007)(6506007)(9686003)(53546011)(26005)(55016003)(40480700001)(186003)(8936002)(83380400001)(47076005)(36860700001)(33656002)(2906002)(6862004)(8676002)(52536014)(5660300002)(40460700003)(478600001)(54906003)(7696005)(316002)(4326008)(70586007)(41300700001)(70206006)(86362001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:48:48.0783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2871352-fb7a-40dc-fd8a-08db45724487
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9272

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+IA0K
PiBPbiAyNS4wNC4yMDIzIDExOjMxLCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4+DQo+ID4+IE9uIDI1LjA0LjIwMjMgMDk6NTYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+
ID4+PiArICAgIC8qIE5VTUEgZGVmaW5lcyBOVU1BX05PX0RJU1RBTkNFIGFzIHVucmVhY2hhYmxl
IGFuZCAwLTkgYXJlDQo+ID4+IHVuZGVmaW5lZCAqLw0KPiA+Pj4gKyAgICBpZiAoIGRpc3RhbmNl
ID49IE5VTUFfTk9fRElTVEFOQ0UgfHwgZGlzdGFuY2UgPD0NCj4gPj4gTlVNQV9ESVNUQU5DRV9V
REZfTUFYIHx8DQo+ID4+PiArICAgICAgICAgKGZyb20gPT0gdG8gJiYgZGlzdGFuY2UgIT0gTlVN
QV9MT0NBTF9ESVNUQU5DRSkgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBwcmludGso
S0VSTl9XQVJOSU5HDQo+ID4+PiArICAgICAgICAgICAgICAgIk5VTUE6IGludmFsaWQgZGlzdGFu
Y2U6IGZyb209JSJQUkl1OCIgdG89JSJQUkl1OCINCj4gPj4gZGlzdGFuY2U9JSJQUkl1MzIiXG4i
LA0KPiA+Pj4gKyAgICAgICAgICAgICAgIGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+ID4+PiArICAg
ICAgICByZXR1cm47DQo+ID4+PiArICAgIH0NCj4gPj4NCj4gPj4gSSBhcHByZWNpYXRlIHRoZSBj
aGVja2luZyB0aGF0IG5vZGUtbG9jYWwgcmVmZXJlbmNlcyBhcmUNCj4gPj4gTlVNQV9MT0NBTF9E
SVNUQU5DRSwNCj4gPj4gYnV0IGlmIHRoZXkncmUgd3JvbmdseSBwYXNzZWQgaW50byBoZXJlLCBz
aG91bGRuJ3QgdGhlIHJlc3VsdGluZyBhcnJheSBzdGlsbA0KPiA+PiBoYXZlIE5VTUFfTE9DQUxf
RElTVEFOQ0Ugb24gaXRzIGRpYWdvbmFsLCBhdCBsZWFzdCBhcyBmYXIgYXMgcHJlc2VudA0KPiBu
b2Rlcw0KPiA+PiBnbz8NCj4gPg0KPiA+IEFwb2xvZ2llcyBpbiBhZHZhbmNlIHRvIGFzayBtb3Jl
IHNwZWNpZmljIGRldGFpbHMgZnJvbSB5b3UgYXMgSSBhbSBub3Qgc3VyZQ0KPiA+IGlmIEkgY2Fu
IGNvcnJlY3RseSB1bmRlcnN0YW5kIHRoZSAiaWYgdGhleSdyZSB3cm9uZ2x5IHBhc3NlZCBpbnRv
IGhlcmUiIGNhc2UuDQo+IERvIHlvdQ0KPiA+IG1lYW4gd2UgYXJlIGFsd2F5cyBndWFyYW50ZWVk
IHRoYXQgaWYgZnJvbSA9PSB0bywgdGhlIGRpc3RhbmNlIHdpbGwgYWx3YXlzDQo+IGJlDQo+ID4g
TlVNQV9MT0NBTF9ESVNUQU5DRSBzbyB0aGUgKGZyb20gPT0gdG8gJiYgZGlzdGFuY2UgIT0NCj4g
TlVNQV9MT0NBTF9ESVNUQU5DRSkNCj4gPiBjaGVjayBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSBy
ZW1vdmVkPyBUaGFua3MuDQo+IA0KPiBJdCdzIGEgbGl0dGxlIG9kZCB0aGF0IHlvdSBhc2sgbWU6
IEl0IGlzIHlvdXIgY29kZSB3aGljaCBpbnNpc3RzIG9uDQo+IE5VTUFfTE9DQUxfRElTVEFOQ0Ug
d2hlbiBmcm9tID09IHRvLiBJZiB5b3UgaW5zaXN0IG9uIHlvdXIgY2FsbGVyIHRvIHBhc3MNCj4g
b25seSB0aGlzIG9uZSB2YWx1ZSwgdGhlbiBJIHRoaW5rIGl0IGlzIG9ubHkgbG9naWNhbCB0byBh
bHNvIHNldCB0aGUNCj4gcmVzcGVjdGl2ZSB0YWJsZSBlbnRyaWVzIHRvIHRoYXQgdmFsdWUgKHJh
dGhlciB0aGFuIGxlYXZpbmcgdGhlbSBhdA0KPiBOVU1BX05PX0RJU1RBTkNFKS4NCg0KSSB0aGlu
ayBJIHVuZGVyc3RhbmQgd2hhdCBkbyB5b3UgbWVhbiBub3cuIEkgd2FzIG9ubHkgY2hlY2tpbmcg
dGhpcyBzcGVjaWZpYw0KcGF0Y2ggc28gZGlkbid0IG1ha2UgdGhlIGNvbm5lY3Rpb24gd2l0aCB0
aGUgbGF0dGVyIHBhdGNoZXMuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

