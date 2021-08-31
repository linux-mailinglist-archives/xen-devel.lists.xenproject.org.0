Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901393FC88A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175761.320090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43N-0007Hw-BY; Tue, 31 Aug 2021 13:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175761.320090; Tue, 31 Aug 2021 13:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43N-0007FU-5K; Tue, 31 Aug 2021 13:43:53 +0000
Received: by outflank-mailman (input) for mailman id 175761;
 Tue, 31 Aug 2021 13:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL43M-0007Ez-1T
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:43:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd76d8a7-62e3-4ab8-b264-3aebd292a2e6;
 Tue, 31 Aug 2021 13:43:49 +0000 (UTC)
Received: from AM3PR07CA0120.eurprd07.prod.outlook.com (2603:10a6:207:7::30)
 by PAXPR08MB7186.eurprd08.prod.outlook.com (2603:10a6:102:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 13:43:48 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:7:cafe::34) by AM3PR07CA0120.outlook.office365.com
 (2603:10a6:207:7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10 via Frontend
 Transport; Tue, 31 Aug 2021 13:43:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 13:43:47 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 31 Aug 2021 13:43:46 +0000
Received: from 1c3792a699fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8098B35-EC50-40F5-A04C-63BBD9BBEE88.1; 
 Tue, 31 Aug 2021 13:43:36 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c3792a699fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 13:43:36 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6958.eurprd08.prod.outlook.com (2603:10a6:10:2be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Tue, 31 Aug
 2021 13:43:34 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:43:34 +0000
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
X-Inumbo-ID: cd76d8a7-62e3-4ab8-b264-3aebd292a2e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JI+XoCuqizIbWiV1JwMYP2XldF4xpfwbjY5+nQ+gQ=;
 b=t6Ir5tgDasEwKzy9EYivkCBNBbVnpFO/OWcV9jZIstVnVQwYwfJXshbe0YktzFoGicqL/MjNyt29EiBYlTwQm1Ozc0iDEX0sBBz2WCEoGScBOEqULdUv+A0AoMuO9SLjEMtk6w9jEoVVvv8S1MVgAYb5USNMXLECaLNCjmqeSHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUXNDmdkMDZn/J41tkxZa3CVmSm5qaTR+xp4oix9+DFUpheX4WNMTfc+NXy+MC99sAzok+mC4ETSvEs0oWJUFidbT04nW4A1lwlX7aMWfG/Zz0N8cmstlbj48ch428qU17O+cF8eRz/hMTust9Of/A0sZrf80e/SOVwWGBs4yirnhDKjTeN4Z5WHibSkkBCpo2a3E5gUCm5iOsNQYqGEp4CfmURoth24iD3FS6oHhDDDuukOJL1e1pFC5doPHCcgz6JkTFyyVl2r/4mjG+GZ2X9zhzKLvQyo0CGKsllRn/c8UowYuvxB5HIOWt9nduEMifG9MBBWeIaLa83+IAupLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JI+XoCuqizIbWiV1JwMYP2XldF4xpfwbjY5+nQ+gQ=;
 b=ZW0eA+E1VokFPT037TUIB/s229INKp1DfBWGRxFVM7n79VEQi9zWzAH4Z5QlLXlVXY5vCM8s/j669hk92YrNLK+ebOyNf4sfDiXJ3uWYGgLB6xfSJMrxzbe6bu0u4oNpTXVIQHDfr5Rb6SNdFSRYiPe14qwLsY8gQ4IufKN+WLgKtAshHRD4W1ur8QVyafsmzmaUXZ0UMrKszwyN1ng/iDFO0vHwx71knsNVatPgv7bC4wM7QiDOaS0rs+jS9cqdvuIcVYbzmKbyLAn6rKbiOE2jWAshNG5uQdeDD17VB4iYw6aOrxajtekEnrv9TlKnhbHTR+orM8JA7vd7dIWKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JI+XoCuqizIbWiV1JwMYP2XldF4xpfwbjY5+nQ+gQ=;
 b=t6Ir5tgDasEwKzy9EYivkCBNBbVnpFO/OWcV9jZIstVnVQwYwfJXshbe0YktzFoGicqL/MjNyt29EiBYlTwQm1Ozc0iDEX0sBBz2WCEoGScBOEqULdUv+A0AoMuO9SLjEMtk6w9jEoVVvv8S1MVgAYb5USNMXLECaLNCjmqeSHs=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
Thread-Topic: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
Thread-Index: AQHXjptUu77aQcXH00SSr7Sat0uCZquM8VkAgADG79A=
Date: Tue, 31 Aug 2021 13:43:34 +0000
Message-ID:
 <DB9PR08MB68573C8F7F40339893ABA64F9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-35-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301825200.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301825200.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C8264248AEF3E041BC18B630DDD58638.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d2e286f4-033c-4ede-0fb0-08d96c855bbf
x-ms-traffictypediagnostic: DB9PR08MB6958:|PAXPR08MB7186:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB71865C22F071A12E00CD3D3A9ECC9@PAXPR08MB7186.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yssB9WI7BVLpCTDwoptnV3vDS0SPg+uD5YModtWQc3k9HrkKGvCwWGMYZThVWLmZITx7LBkT9bKWMeDf+zzDUk/o7LrkcH6pXIczp2L0d/IfWt9+hPrxLsOvOYKQGDR911xVbaDkmdT33ZTgJtjLV8g88tDDhlV/5FgSImQm0U1qedwy2PrDKmdiyxejMwkralkGtGud8raifx9fRF1c2NtpjtVOlYZuRew7o7Zk+cyWCtw0IFBiYGDg7hSQJozWjkDrzvHFnNgJyFQfSwbxhtkAlyZWbAfz7xNJsNcKnlycFzYcKxamQ/QuMIFPPIFlcTG85Ez4CaIwu1mZgb9wLWp9BI1hB6y106V5LUeoAteTW3Ww8GflDVs2e5454txZMt0RaGyI9DB+XMvn5FtZ8W2QvshDaiDDH8wYKQHVNBtHo2R93+c3me52ZMBjgx4Crer6ftB7P2FOeBpq4CRtAgNTll+wkeswhvhAbA0HfoDHJL8xUaSS7k+MrlydsBjpRYESS0Uhrgy1EBp4Ez5LRPp/RK5LJp511Ff5k8yXimEaRVk6K7/x4JVpQDjpPW2euYZhw56l9Yv1fFTHak5v777WyKRRdD1k+tfWt6h6RHp6sTvUa+5Bz43QKtQfgtrxH4o0eF5Itr5eg7K1qH/IIiYlEGAvaJ2u1cs/Z4hfGnrUnstOqn6T+0TTQN2aBHj2jTs6F2svIigf+tbVviB8Hw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39850400004)(55016002)(478600001)(86362001)(122000001)(53546011)(8676002)(9686003)(38100700002)(4326008)(6916009)(66946007)(76116006)(66446008)(66476007)(66556008)(64756008)(5660300002)(33656002)(38070700005)(54906003)(52536014)(26005)(7696005)(83380400001)(2906002)(186003)(71200400001)(6506007)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QTlYMTVGQ015Und5b0swdWRQMHpZSXJPekNFekNGbkJLbkx0SXlYTXFqc1I0?=
 =?gb2312?B?NzlDei9iaTJoZ2FvQ0lCcGdUbkRPRTdoYVE3MllWWUc3YnVURi8rMlZOM2hq?=
 =?gb2312?B?NE1XT0dLekU3eEg3R3o2OEliaTd4eUtyTjlVY3I0MTZhWHU3VkZ4NEV3K3VV?=
 =?gb2312?B?ellsTy9veFduTEJtejZEQXpVRWo2U3VJQTVJeWd5cGQzS3lZR0Fid0p3eXBP?=
 =?gb2312?B?aDBEc1ZWSHJnbE9xdFAxUjk5bU5Rc0t3TG1ybmJiQWRSelJHYXdWTEpZUlU5?=
 =?gb2312?B?UEptUDhXSE1PdXlkVlMrc2kxRkFJMnVZRGVKQ2FmbTJJSzMyNVFzVkFEODZZ?=
 =?gb2312?B?TWttaERCVUc4UGFrSk1uTVprNDBFUmE1NFRxbEdNZFpYOEQyMFhUTHA5VzVV?=
 =?gb2312?B?SmlyZkR6TTFmTDJWTkw2b3J0Z0MvNlNBSDBmVzFaUjZRZG5pTmFHSlB5TkRk?=
 =?gb2312?B?cDRXWmNPMzJYS1RUZ2RpRU1jaGliLzFCc0RRSHA4a00xaUNDWWU3N0NVQ1ov?=
 =?gb2312?B?STVyZ0orWFhxamNOSWZPZ3pWenBzL01YY3lPdjMzT2kzaXg5bjVpQ2NQa29M?=
 =?gb2312?B?VGpNOFc1Q2Q5RmxQU2lTa0xrTXdPZmpCeVhBbXBXN01neVVXZlo0bmlQWWdH?=
 =?gb2312?B?d1VLRFVJbjM3ajFEcjAwODM2RlB3ZThDdjhZMEFkcWlIMVk3RldUQjk1VWJq?=
 =?gb2312?B?VjNQUHBsU1hpQkl4c0YySk8vakVMME5XalYrbEFvcDhhOG10b1IzUEVUVmpF?=
 =?gb2312?B?Q2MwVGhNRUxyS0xvS0EzQ3cvd2hZYnF4Y2dvc2hnYy8zUmZjV081ZU40YUR2?=
 =?gb2312?B?K1BkZWhRQXExUStOQXJqOUc1WGY0TmdHazVXVkJ3a2t1WThCN0oxVDZKZFpm?=
 =?gb2312?B?WlNmYVF3OVZzbXRUNVFoMjFXelRTVmJxZ25MSzF0aUNpNUxzalcrQk04UUJP?=
 =?gb2312?B?Ulc3TUYzVXVNQ0pISWxxSDRRdUZJNE5SR0JmZ05WelB1OU9idXdiaFd2YWFw?=
 =?gb2312?B?NzZVeU1zZGxYQjFFeUZldGpXekY0M2ZBUTY3RnR6b3IwZGNEWWVqV1hrc0VT?=
 =?gb2312?B?V2JxVnRWTU9FbjdRTG9DYVJ4eWNwNkFiRitkSllPSnhDdG4zOUkwZnU1RDJO?=
 =?gb2312?B?ZkFXNk0yUzN4U0JBb1hhcjh4enNuY1IrbzVZYXlLTUtsUmlzQ0JOMExtY3dD?=
 =?gb2312?B?Yy9QOVoxYUZnNnV4OUJsVFI4MWszQkp3TWlhS1JBY1RLZ0doZ0YxNndtMmFp?=
 =?gb2312?B?RkFrN1JMWnJJTm5GUUxwYlMvd2MvYVE4L1NNUUpmWXhiRU1nOGxSSmtaeWFG?=
 =?gb2312?B?Tm5YTi8zb0pwN3NWR2pUNnhLYngrSjBVNmNDRGpsMWdhNmtWVXQ5M05PSWNp?=
 =?gb2312?B?YlhoNk8xNGszUzZkN0ZWT0xsTUFNWkV0S2RybUl0NXA3L3V3Z3hvTGdWSjZp?=
 =?gb2312?B?bE41MmFvMEI4dDBaV3ppSW96OGlGUytQbFNGZzZjbUdNd2FTZS9ETC9iNDZv?=
 =?gb2312?B?ajNaeFBVUGFkOU52M1RGSm1OSk0rMGlRSjRvUmtWYTA4elo4N3pqSC8yR1gv?=
 =?gb2312?B?U0dOc1llbzRLQ2lUM0pWd0tXTDF0MEtReDlaT3JLOVpUaDFXOUpuZGJteHI4?=
 =?gb2312?B?SnFjWTZyTnJld1BOME0vdk9wR3pqeU1FUUxBRkhtSjNEc3hCK1J0Rmc4dkRB?=
 =?gb2312?B?cmpqdm5vWmFFSEp3VGw3cVA3d1BFNXRPd09SOGltWW83L1FsTlZZdVBhaEo3?=
 =?gb2312?Q?tOemZgaNTPacvWUQ5BiIXOtooTuTj42ALzq+xlP?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6958
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c84ee7f0-049e-4e76-4768-08d96c8553ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z1YT6vcPTJiei5AW/vbuKovY+5ata3zSBoIuKtUTDRJM/o7PZcPpLQkbcMNNObm2OdE08tV4VMZ+xtmA1ZGh4liNjCpf8oypy7dzifvvTXQJUjlTZxnQkKVNFjFr8wtgsAxgyz1SWF1Z/vOSKicVWz1aEoYRqq7gQB3mk2JoGK+mVIaaD/YZIhe3/aXoGkTrAjH+KL7HhgTDhQVl297pvQrVL0wm8M9sSRPI8sgnaLCZt0YFr7xl8OFIm0hszp0KMp6FuX1YVKIm4r5aSRYs8DOBCMdr5mEHZaghpYMV10+6pmCgb51kuq/ULTqSiFlk8T0NTZZwdgZH5qMf3AmRmhwd7LEwHBPFiReJ+sDWI+vVr3Crqh84pVRQy5QysXJHdL1cOdgyyPBUt5QMBa2Zaw1fDceP9FBkjSt8geYo6NFpEFUC1Pyv5OLAUErzgghyXGIYkhWW0JJkQ/D5/qFvk5miWKPGcw5MhA03BQ+P6s0rAxgL+V8EE6Ofpdjx0aokcNLlEX6F7RACMhJmYDNN+enabd3YE2T5Pa6zrQN/7NNown4QZwgNejbllrM9qmLHdLhg64AJGEeJMR/Nkvi8bM03jaaokGIqk+EswOXPUCaAFBmzdbG0ONGXuOfyA5IfMdIvSlGAXBuZziJU24XgaHPDQQlEf+g0j0t8f8eAkvEkLyqyEhc9iFE0P6gAszCtUyGQJO9S0ed4+FHi6TE3aA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(33656002)(186003)(4326008)(55016002)(2906002)(6862004)(52536014)(26005)(36860700001)(54906003)(5660300002)(9686003)(316002)(47076005)(7696005)(83380400001)(8676002)(70586007)(70206006)(508600001)(81166007)(86362001)(6506007)(336012)(53546011)(82310400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:43:47.3864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e286f4-033c-4ede-0fb0-08d96c855bbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7186

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgOToyNw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzQvNDBd
IHhlbjogbW92ZSBudW1hX3NjYW5fbm9kZXMgZnJvbSB4ODYgdG8NCj4gY29tbW9uDQo+IA0KPiBP
biBXZWQsIDExIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBBZnRlciB0aGUgcHJldmlv
dXMgcGF0Y2hlcyBwcmVwYXJhdGlvbnMsIG51bWFfc2Nhbl9ub2RlcyBjYW4gYmUNCj4gPiB1c2Vk
IGJ5IEFybSBhbmQgeDg2LiBTbyB3ZSBtb3ZlIHRoaXMgZnVuY3Rpb24gZnJvbSB4ODYgdG8gY29t
bW9uLg0KPiA+IEFzIG5vZGVfY292ZXJfbWVtb3J5IHdpbGwgbm90IGJlIHVzZWQgY3Jvc3MgZmls
ZXMsIHdlIHJlc3RvcmUgaXRzDQo+ID4gc3RhdGljIGF0dHJpYnV0ZSBpbiB0aGlzIHBhdGNoLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4g
LS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9zcmF0LmMgICAgICAgIHwgNTIgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIHhlbi9jb21tb24vbnVtYS5jICAgICAgICAgIHwg
NTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgeGVuL2luY2x1
ZGUvYXNtLXg4Ni9hY3BpLmggfCAgMyAtLS0NCj4gPiAgeGVuL2luY2x1ZGUveGVuL251bWEuaCAg
ICAgfCAgMyArKy0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCA1NyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3JhdC5jIGIv
eGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IGluZGV4IGM5Nzk5MzlmZGQuLmM5ZjAxOWMzMDcgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9zcmF0LmMNCj4gPiBAQCAtMzYxLDU4ICszNjEsNiBAQCB2b2lkIF9faW5pdCBzcmF0X3BhcnNl
X3JlZ2lvbnModTY0IGFkZHIpDQo+ID4gIAlwZm5fcGR4X2hvbGVfc2V0dXAobWFzayA+PiBQQUdF
X1NISUZUKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLS8qIFVzZSB0aGUgaW5mb3JtYXRpb24gZGlzY292
ZXJlZCBhYm92ZSB0byBhY3R1YWxseSBzZXQgdXAgdGhlIG5vZGVzLg0KPiAqLw0KPiA+IC1pbnQg
X19pbml0IG51bWFfc2Nhbl9ub2Rlcyh1NjQgc3RhcnQsIHU2NCBlbmQpDQo+ID4gLXsNCj4gPiAt
CWludCBpOw0KPiA+IC0Jbm9kZW1hc2tfdCBhbGxfbm9kZXNfcGFyc2VkOw0KPiA+IC0NCj4gPiAt
CS8qIEZpcnN0IGNsZWFuIHVwIHRoZSBub2RlIGxpc3QgKi8NCj4gPiAtCWZvciAoaSA9IDA7IGkg
PCBNQVhfTlVNTk9ERVM7IGkrKykNCj4gPiAtCQljdXRvZmZfbm9kZShpLCBzdGFydCwgZW5kKTsN
Cj4gPiAtDQo+ID4gLSNpZmRlZiBDT05GSUdfQUNQSV9OVU1BDQo+ID4gLQlpZiAoYWNwaV9udW1h
IDw9IDApDQo+ID4gLQkJcmV0dXJuIC0xOw0KPiA+IC0jZW5kaWYNCj4gPiAtDQo+ID4gLQlpZiAo
IW5vZGVzX2NvdmVyX21lbW9yeSgpKSB7DQo+ID4gLQkJYmFkX3NyYXQoKTsNCj4gPiAtCQlyZXR1
cm4gLTE7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JbWVtbm9kZV9zaGlmdCA9IGNvbXB1dGVfaGFz
aF9zaGlmdChub2RlX21lbWJsa19yYW5nZSwNCj4gbnVtX25vZGVfbWVtYmxrcywNCj4gPiAtCQkJ
CW1lbWJsa19ub2RlaWQpOw0KPiA+IC0NCj4gPiAtCWlmIChtZW1ub2RlX3NoaWZ0IDwgMCkgew0K
PiA+IC0JCXByaW50ayhLRVJOX0VSUg0KPiA+IC0JCSAgICAgIlNSQVQ6IE5vIE5VTUEgbm9kZSBo
YXNoIGZ1bmN0aW9uIGZvdW5kLiBDb250YWN0DQo+IG1haW50YWluZXJcbiIpOw0KPiA+IC0JCWJh
ZF9zcmF0KCk7DQo+ID4gLQkJcmV0dXJuIC0xOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAtCW5vZGVz
X29yKGFsbF9ub2Rlc19wYXJzZWQsIG1lbW9yeV9ub2Rlc19wYXJzZWQsDQo+IHByb2Nlc3Nvcl9u
b2Rlc19wYXJzZWQpOw0KPiA+IC0NCj4gPiAtCS8qIEZpbmFsbHkgcmVnaXN0ZXIgbm9kZXMgKi8N
Cj4gPiAtCWZvcl9lYWNoX25vZGVfbWFzayhpLCBhbGxfbm9kZXNfcGFyc2VkKQ0KPiA+IC0Jew0K
PiA+IC0JCXU2NCBzaXplID0gbm9kZXNbaV0uZW5kIC0gbm9kZXNbaV0uc3RhcnQ7DQo+ID4gLQkJ
aWYgKCBzaXplID09IDAgKQ0KPiA+IC0JCQlwcmludGsoS0VSTl9XQVJOSU5HICJTUkFUOiBOb2Rl
ICV1IGhhcyBubyBtZW1vcnkuICINCj4gPiAtCQkJICAgICAgICJCSU9TIEJ1ZyBvciBtaXMtY29u
ZmlndXJlZCBoYXJkd2FyZT9cbiIsIGkpOw0KPiA+IC0NCj4gPiAtCQlzZXR1cF9ub2RlX2Jvb3Rt
ZW0oaSwgbm9kZXNbaV0uc3RhcnQsIG5vZGVzW2ldLmVuZCk7DQo+ID4gLQl9DQo+ID4gLQlmb3Ig
KGkgPSAwOyBpIDwgbnJfY3B1X2lkczsgaSsrKSB7DQo+ID4gLQkJaWYgKGNwdV90b19ub2RlW2ld
ID09IE5VTUFfTk9fTk9ERSkNCj4gPiAtCQkJY29udGludWU7DQo+ID4gLQkJaWYgKCFub2RlbWFz
a190ZXN0KGNwdV90b19ub2RlW2ldLCAmcHJvY2Vzc29yX25vZGVzX3BhcnNlZCkpDQo+ID4gLQkJ
CW51bWFfc2V0X25vZGUoaSwgTlVNQV9OT19OT0RFKTsNCj4gPiAtCX0NCj4gPiAtCW51bWFfaW5p
dF9hcnJheSgpOw0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHN0YXRpYyB1
bnNpZ25lZCBub2RlX3RvX3B4bShub2RlaWRfdCBuKQ0KPiA+ICB7DQo+ID4gIAl1bnNpZ25lZCBp
Ow0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL251bWEuYyBiL3hlbi9jb21tb24vbnVtYS5j
DQo+ID4gaW5kZXggNDE1MmJiZTgzYi4uOGNhMTNlMjdkMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4v
Y29tbW9uL251bWEuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vbnVtYS5jDQo+ID4gQEAgLTE5NSw3
ICsxOTUsNyBAQCB2b2lkIF9faW5pdCBjdXRvZmZfbm9kZShpbnQgaSwgdTY0IHN0YXJ0LCB1NjQg
ZW5kKQ0KPiA+DQo+ID4gIC8qIFNhbml0eSBjaGVjayB0byBjYXRjaCBtb3JlIGJhZCBTUkFUcyAo
dGhleSBhcmUgYW1hemluZ2x5IGNvbW1vbikuDQo+ID4gICAgIE1ha2Ugc3VyZSB0aGUgUFhNcyBj
b3ZlciBhbGwgbWVtb3J5LiAqLw0KPiA+IC1pbnQgX19pbml0IG5vZGVzX2NvdmVyX21lbW9yeSh2
b2lkKQ0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBub2Rlc19jb3Zlcl9tZW1vcnkodm9pZCkNCj4g
PiAgew0KPiA+ICAJaW50IGk7DQo+ID4gIAl1aW50MzJfdCBucl9iYW5rcyA9IGFyY2hfbWVtaW5m
b19nZXRfbnJfYmFuaygpOw0KPiA+IEBAIC0yNzEsNiArMjcxLDU4IEBAIHZvaWQgX19pbml0IG51
bWFfaW5pdF9hcnJheSh2b2lkKQ0KPiA+ICAgICAgfQ0KPiA+ICB9DQo+ID4NCj4gPiArLyogVXNl
IHRoZSBpbmZvcm1hdGlvbiBkaXNjb3ZlcmVkIGFib3ZlIHRvIGFjdHVhbGx5IHNldCB1cCB0aGUg
bm9kZXMuDQo+ICovDQo+ID4gK2ludCBfX2luaXQgbnVtYV9zY2FuX25vZGVzKHU2NCBzdGFydCwg
dTY0IGVuZCkNCj4gPiArew0KPiA+ICsJaW50IGk7DQo+ID4gKwlub2RlbWFza190IGFsbF9ub2Rl
c19wYXJzZWQ7DQo+ID4gKw0KPiA+ICsJLyogRmlyc3QgY2xlYW4gdXAgdGhlIG5vZGUgbGlzdCAq
Lw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IE1BWF9OVU1OT0RFUzsgaSsrKQ0KPiA+ICsJCWN1dG9m
Zl9ub2RlKGksIHN0YXJ0LCBlbmQpOw0KPiA+ICsNCj4gPiArI2lmZGVmIENPTkZJR19BQ1BJX05V
TUENCj4gPiArCWlmIChhY3BpX251bWEgPD0gMCkNCj4gPiArCQlyZXR1cm4gLTE7DQo+ID4gKyNl
bmRpZg0KPiA+ICsNCj4gPiArCWlmICghbm9kZXNfY292ZXJfbWVtb3J5KCkpIHsNCj4gPiArCQli
YWRfc3JhdCgpOw0KPiA+ICsJCXJldHVybiAtMTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwltZW1u
b2RlX3NoaWZ0ID0gY29tcHV0ZV9oYXNoX3NoaWZ0KG5vZGVfbWVtYmxrX3JhbmdlLA0KPiBudW1f
bm9kZV9tZW1ibGtzLA0KPiA+ICsJCQkJbWVtYmxrX25vZGVpZCk7DQo+ID4gKw0KPiA+ICsJaWYg
KG1lbW5vZGVfc2hpZnQgPCAwKSB7DQo+ID4gKwkJcHJpbnRrKEtFUk5fRVJSDQo+ID4gKwkJICAg
ICAiU1JBVDogTm8gTlVNQSBub2RlIGhhc2ggZnVuY3Rpb24gZm91bmQuIENvbnRhY3QNCj4gbWFp
bnRhaW5lclxuIik7DQo+ID4gKwkJYmFkX3NyYXQoKTsNCj4gPiArCQlyZXR1cm4gLTE7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJbm9kZXNfb3IoYWxsX25vZGVzX3BhcnNlZCwgbWVtb3J5X25vZGVz
X3BhcnNlZCwNCj4gcHJvY2Vzc29yX25vZGVzX3BhcnNlZCk7DQo+ID4gKw0KPiA+ICsJLyogRmlu
YWxseSByZWdpc3RlciBub2RlcyAqLw0KPiA+ICsJZm9yX2VhY2hfbm9kZV9tYXNrKGksIGFsbF9u
b2Rlc19wYXJzZWQpDQo+ID4gKwl7DQo+ID4gKwkJdTY0IHNpemUgPSBub2Rlc1tpXS5lbmQgLSBu
b2Rlc1tpXS5zdGFydDsNCj4gPiArCQlpZiAoIHNpemUgPT0gMCApDQo+ID4gKwkJCXByaW50ayhL
RVJOX1dBUk5JTkcgIlNSQVQ6IE5vZGUgJXUgaGFzIG5vIG1lbW9yeS4gIg0KPiA+ICsJCQkgICAg
ICAgIkJJT1MgQnVnIG9yIG1pcy1jb25maWd1cmVkIGhhcmR3YXJlP1xuIiwgaSk7DQo+IA0KPiBO
b3QgYWxsIGFyY2hzIGhhdmUgYSBCSU9TIHNvIEknZCBzYXkgImZpcm13YXJlIGJ1ZyIuIExpa2Ug
bGFzdCB0aW1lLCB3ZQ0KPiB1c3VhbGx5IGRvbid0IGRvIGNvZGUgY2hhbmdlcyB0b2dldGhlciB3
aXRoIGNvZGUgbW92ZW1lbnQsIGJ1dCBpbiB0aGlzDQo+IGNhc2UgaXQgbWlnaHQgYmUgT0suIEkg
YW0gYWxzbyBoYXBweSB3aXRoIGEgc2VwYXJhdGUgcGF0Y2ggdG8gYWRqdXN0IHRoZQ0KPiB0d28g
Y29tbWVudHMgKHRoaXMgb25lIGFuZCB0aGUgb25lIGluIHRoZSBwcmV2aW91cyBwYXRjaCkuDQoN
Ck9LLCBJIHdpbGwgZG8gaXQuDQo=

