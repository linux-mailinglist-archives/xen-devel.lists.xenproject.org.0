Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2E61EFF7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439208.693212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orz4n-00009v-7x; Mon, 07 Nov 2022 10:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439208.693212; Mon, 07 Nov 2022 10:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orz4n-00007L-4o; Mon, 07 Nov 2022 10:09:57 +0000
Received: by outflank-mailman (input) for mailman id 439208;
 Mon, 07 Nov 2022 10:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XaRo=3H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1orz4l-00007F-HM
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:09:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52888cc5-5e84-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 11:09:53 +0100 (CET)
Received: from FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::15)
 by PA4PR08MB7388.eurprd08.prod.outlook.com (2603:10a6:102:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 10:09:46 +0000
Received: from VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::68) by FR0P281CA0142.outlook.office365.com
 (2603:10a6:d10:96::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11 via Frontend
 Transport; Mon, 7 Nov 2022 10:09:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT052.mail.protection.outlook.com (100.127.144.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 10:09:45 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 07 Nov 2022 10:09:45 +0000
Received: from 944b92fe2d98.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 994304F8-EF50-4BD8-86BD-46582A5873F3.1; 
 Mon, 07 Nov 2022 10:09:39 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 944b92fe2d98.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 10:09:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5444.eurprd08.prod.outlook.com (2603:10a6:208:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 10:09:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 10:09:36 +0000
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
X-Inumbo-ID: 52888cc5-5e84-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nbZI5eNcl05vRuGz6hmB8OuJ+P6pAbKi1bWnpMQn5IrJqapTQkDDsAHdCvvbE8UedydOsIIpKfqv6CbmKOpKLFPT28xZ4ltPY74AS9soIwQF7LdNLx6ajHzvRK5Y9F/TFHwRpT38C8HFHqh2eOCmGbwmViiSW57DOO61BDF0bPyHk87oczDU8eQ86ZEL3R4vOhUsNDkcI9resdCTCB1msvigf5I9H18pVwLBN2a9jXhyAZx1pJap/07DiDaBWRR4bDEldA8yylFgXqgagjHKrxwOrNWmEFr5+GDL3fl2sdkVHmidvVoWLB9qEjbZdQKZy9RtFdkaH+shrJfXHn9mtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2D1WVBIkXQWLQXPSwj6jwCDPYZEn9bTpcIizuYfUcw=;
 b=kbXjVRsiUwI1Sbs1tQFuhcrWSaJ5nL4fJh6fTVzMNya8QyBsXsygs9J8RrQbnVyF+xM221zwmmzNJq815Rki7wGAthadzsKY/sKEaP/UCAEz9lCbwfeixMOCVbTpXnVhMQ9wforpGJk9y0iA5TOLnaEz57ti2CkEa+3HnyFfJ6gBEIH8ma1v91u8z7H6qDFlnH7MwoiqUeecd5vc1t+M+/jT+MO0IdauCiSC257+sj9t6gHHnIiq4PJrlF0tRZFUJB4bizNe4R3JZJ1WkWpT6GTPyofwe+ObMg0vMSlG9rS0iXQ5+BBxt+R5RBBSwrehA9YZFFVzUEMwuEM6GyGujQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2D1WVBIkXQWLQXPSwj6jwCDPYZEn9bTpcIizuYfUcw=;
 b=YkIkELxw7xKk9dU+ElmbJN0Pg8P9U6xNjs6uxPAfVp0AP7gouAa/e1kZrTg+ydUa/iopQZw6lAlxHQrt25DVT/shUPzkI8m4r95tn4Fd7b1dDXVP/sl+EoLy8rRIXUZzKVlrPd5yO4XlCZHyqoMeh0VdncPAtVQjfaHblX0Tltg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6VCzhO9owUydYJKeuLfFZxCMrnDRjJbaULqgpBPguA6nTzOUSpwYz4gptAlUetHOBzglOyAaEfRpEsaMa25jHlU6MMkNiE7gbS9N0wXJUFXOxly81zVIHFVa06rHJ3WFfe3WdJpHVTGqcU+ljbW7bwJxW/TLavTUxtaFzhmXIbSif/IJ+CV35n9T2A1CGc5aLQw0NLSdbmFdetC9T32aS9+jzalAXR0sPc88Mi7jMSvy9gNRkAvrB63lvEDnVqLTZ37eqth0+5cS9pNo0jVXBTOuK6DGN/Rma4QIp6E3cSKere7snBsCb3YmeUadk15azEPIlC+GO8erP4sldhx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2D1WVBIkXQWLQXPSwj6jwCDPYZEn9bTpcIizuYfUcw=;
 b=hFvAAiT9hUpejXNIongaU/NO+vi9ENIDGeynGyeRvleQPEu+48agjVTy7xD4Jewb9e8tLM8OQqhGH3RXc6A1Cb9oOKbRgEH3AJ8fh7vjn5mfvNe3nzHe61KENBnMW8x2UGAMLDsqLhyvbkFnRfXO80QMl8x/1H+hEAe5+3KHw9df2g2ncASiZVkuLEteFpzQRkcdSyHgFTsnudI2J2uP5bXiFbStuxyA4Se8A5wUxrVwHZBr5zTmGCM91bjlk2MjoD7vvGuUrUaY5ZMwKtyaUFmWNesVzlHk9ayzt+rvfYe3tG5sOUZHzYZyhFEFyBTYswP3PnjwoVyl1i8ahBWSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2D1WVBIkXQWLQXPSwj6jwCDPYZEn9bTpcIizuYfUcw=;
 b=YkIkELxw7xKk9dU+ElmbJN0Pg8P9U6xNjs6uxPAfVp0AP7gouAa/e1kZrTg+ydUa/iopQZw6lAlxHQrt25DVT/shUPzkI8m4r95tn4Fd7b1dDXVP/sl+EoLy8rRIXUZzKVlrPd5yO4XlCZHyqoMeh0VdncPAtVQjfaHblX0Tltg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v7 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHY5EtNNbUvPHFuhkmLf666GxDtVa4tV7mAgAX/kBA=
Date: Mon, 7 Nov 2022 10:09:36 +0000
Message-ID:
 <PAXPR08MB7420FB5EE6A3A8990894563A9E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-3-wei.chen@arm.com>
 <78036eeb-2585-97e5-9f80-bb84f297cc08@suse.com>
In-Reply-To: <78036eeb-2585-97e5-9f80-bb84f297cc08@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A43C7E7D16765542A32553B3C0B6ED9E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AM0PR08MB5444:EE_|VI1EUR03FT052:EE_|PA4PR08MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d63ad8-56f1-4cbb-13ac-08dac0a83268
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4FXS6HlAEuT4Lxqpy8vxBXz6G88cxFZIFeHLm2oWKOUMV8qu80N00Cj2Wxe7mEmJfnmhF39HPs8Sv3QM21S93ip3CB809yHu73AWu375eWgKLXKT4iPgP3b9UzaOn7MLO3tg/qHlmjJ5BMt4PVJtVMGJU2ryG9EkzsLQwi9zn6x5UZYxXnrtkVt57lGkCubgjlPF9s/Ep0W/RTXISl2PhHs10dDdB+BoTx21YUYhlHdq4ud9H5kc9TMVjSSC+R6zLZTgQyDNaYSB1fYo/XRBpI9qwlzT8YKDUpFFMTYgDWC+i0B8VPOKlSF9WfdNSuL9sumo64TUOgGdwpZV9oQZWoCJywahbdyQt5zyTmkGoacJxrWkD78fHmuDARUUMl+P5XBUKojArt2IjQZhvPUsU8em/biW7lm6fY7IbYwk1TFw1p0HxlPr5Z/qC+eM0G987p1e8Vwncpcu83lr1q/z08YJFUzrcW66PuGeICVOOifm0/KhXQb+QuX97Rse48yuJATWZUAio3GckP2IFSWOxgIkTBBminIKgnBHCWOEHgCd5D4/QCTjYvlxFc0ImOz473khQ7PMsSD5/8BV+RxLnBVldr8i4pJ7omF7Zs8ordocVPgH2+E7SvgYoDL4qr2JyOufu+loTcHXxBY9CEzZl2Tb9SRJy3A3E6ETUG+9xPizxQbZpbt0IGBDC178EjtLDVu4oRb+KTSzu2gDX/rifqI+Ur8fHR44BLl/IG46dF65J/f1/1xbo5uftckNg1TEf7KZjp+7ZTZbd13qSKkJ3RJ9avYLTe8YPc1/gpxTxvE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(38070700005)(478600001)(71200400001)(38100700002)(122000001)(86362001)(55016003)(5660300002)(53546011)(316002)(52536014)(41300700001)(7696005)(6506007)(186003)(6916009)(54906003)(8936002)(66476007)(9686003)(83380400001)(64756008)(76116006)(66946007)(66556008)(33656002)(8676002)(4326008)(26005)(66446008)(2906002)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5444
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d62d1267-26e1-4104-f8c9-08dac0a82cab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OHOwrgZsmTJC1RZhCI1KSQNmaY4BFPrB7cPj5nv0BYmMeK+GX8lMNyu/VqK015Ak37CaVIEnqeBuX1MRIDVGa5Za6w12dVTicLkF0V+BJmrOMmBAVPv8nknsdmf0Pk2QhIg1O/fUO2E92F6kk+HQGwvzNxEsceqS9Qnh6edV8jh8vf3xEIEssgpBY9FzSQCb2RG6+nC2YtTPJfwNNUbFS8TtYZbfBanxjzaqosKesNUS2BqR1NkOwnrMGMthcUR7Btjdihr8uJb/cChd/urojeYQdf13xygu4k4UcbGwGJYMpGG4XzsVzbRJsGUopqTjKLeAxsIRT7j23gp8xOY8iwWrHgel56fFJM/naYAKVK71s3kUWlduzoRV886m2qUEo4hnqf/C8IrsQunEcXV8v+V2Gqxula8Rkm15kdlrcp4zUqC0COgTiMEzqbhjBRdqpqXEhYZmry4R4sY2SQ1xbOnWbe0qR37R1vlXh7gVNoexWGSlU3WhBVTBfq9ylyVbBtblKVXINa/BVpXVloMKPBMWPn2xnO0KIJAMrCmZ6WArT44txaOSNpW7yUEAlSQKwmuuJrXPTiQVQ4aHtWMuolGiIjgZnIdw4XHqzYto74WYQXfcwptueq8pYnmgfwKhXT4474i6r/rMoiOhV1qQVSrZo6TvDlJ2ele5foJ5XwpPjXsjqhY5oeCbSpG6WDJSxtlWiuu0VOaopwKQmB2grgs/kwxh81+R21ZcODiIPjPXa3PdoLghMKfoHngNjyBGVCfzs/VuZPzRYIx2uJqxBC4PXeDDV7tBYgJXQE6r/To=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(55016003)(70206006)(70586007)(4326008)(8676002)(40480700001)(316002)(36860700001)(33656002)(5660300002)(336012)(54906003)(2906002)(8936002)(6862004)(82740400003)(41300700001)(6506007)(7696005)(52536014)(186003)(40460700003)(53546011)(26005)(47076005)(9686003)(83380400001)(478600001)(86362001)(356005)(81166007)(82310400005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:09:45.7660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d63ad8-56f1-4cbb-13ac-08dac0a83268
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7388

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIM+aXpSAyMjoyNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjcgMi82XSB4ZW4veDg2OiBtb3ZlIGdlbmVyaWNhbGx5IHVzYWJsZSBOVU1BIGNvZGUNCj4g
ZnJvbSB4ODYgdG8gY29tbW9uDQo+IA0KPiBPbiAyMC4xMC4yMDIyIDA4OjE0LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiBUaGVyZSBhcmUgc29tZSBjb2RlcyBpbiB4ODYvbnVtYS5jIGNhbiBiZSBzaGFy
ZWQgYnkgY29tbW9uDQo+ID4gYXJjaGl0ZWN0dXJlcyB0byBpbXBsZW1lbW50IE5VTUEgc3VwcG9y
dC4gSnVzdCBsaWtlIHNvbWUNCj4gPiB2YXJpYWJsZXMgYW5kIGZ1bmN0aW9ucyB0byBjaGVjayBh
bmQgc3RvcmUgTlVNQSBtZW1vcnkgbWFwLg0KPiA+IEFuZCBzb21lIHZhcmlhYmxlcyBhbmQgZnVu
Y3Rpb25zIHRvIGRvIE5VTUEgaW5pdGlhbGl6YXRpb24uDQo+ID4NCj4gPiBJbiB0aGlzIHBhdGNo
LCB3ZSBtb3ZlIHRoZW0gdG8gY29tbW9uL251bWEuYyBhbmQgeGVuL251bWEuaA0KPiA+IGFuZCB1
c2UgdGhlIENPTkZJR19OVU1BIHRvIGdhdGUgdGhlbSBmb3Igbm9uLU5VTUEgc3VwcG9ydGVkDQo+
ID4gYXJjaGl0ZWN0dXJlcy4gQXMgdGhlIHRhcmdldCBoZWFkZXIgZmlsZSBpcyBYZW4tc3R5bGUs
IHNvDQo+ID4gd2UgdHJpbSBzb21lIHNwYWNlcyBhbmQgcmVwbGFjZSB0YWJzIGZvciB0aGUgY29k
ZXMgdGhhdCBoYXMNCj4gPiBiZWVuIG1vdmVkIHRvIHhlbi9udW1hLmggYXQgdGhlIHNhbWUgdGlt
ZS4NCj4gPg0KPiA+IEFzIGFjcGlfc2Nhbl9ub2RlcyBoYXMgYmVlbiB1c2VkIGluIGEgY29tbW9u
IGZ1bmN0aW9uLCBpdA0KPiA+IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byB1c2UgYWNwaV94eHggaW4g
Y29tbW9uIGNvZGUsIHNvIHdlDQo+ID4gcmVuYW1lIGl0IHRvIG51bWFfcHJvY2Vzc19ub2RlcyBp
biB0aGlzIHBhdGNoIHRvby4gQWZ0ZXIgdGhhdA0KPiA+IGlmIHdlIHN0aWxsIHVzZSBDT05GSUdf
QUNQSV9OVU1BIGluIHRvIGdhdGUgbnVtYV9wcm9jZXNzX25vZGVzDQo+ID4gaW4gbnVtYV9pbml0
bWVtX2luaXQsIHRoYXQgZG9lc24ndCBtYWtlIHNlbnNlLiBBcyBDT05GSUdfTlVNQQ0KPiA+IHdp
bGwgYmUgc2VsZWN0ZWQgYnkgQ09ORklHX0FDUElfTlVNQSBmb3IgeDg2LiBTbywgd2UgcmVwbGFj
ZQ0KPiA+IENPTkZJR19BQ1BJX05VTUEgYnkgQ09ORklHX05VTUEgdG8gZ2F0ZSBudW1hX3Byb2Nl
c3Nfbm9kZXMuDQo+ID4NCj4gPiBBcyBhcmNoX251bWFfZGlzYWJsZWQgaGFzIGJlZW4gaW1wbGVt
ZW1udGVkIGZvciBBQ1BJIE5VTUEsDQo+ID4gd2UgY2FuIHJlbmFtZSBzcmF0X2Rpc2FibGVkIHRv
IG51bWFfZGlzYWJsZWQgYW5kIG1vdmUgaXQNCj4gPiB0byBjb21tb24gY29kZSBhcyB3ZWxsLg0K
PiA+DQo+ID4gVGhlIG1hY3JvIG5vZGVfdG9fZmlyc3RfY3B1KG5vZGUpIGhhc24ndCBiZWVuIHVz
ZWQgYW55d2hlcmUsDQo+ID4gc28gd2UgZHJvcCBpdCBpbiB0aGlzIHBhdGNoIHRvby4NCj4gPg0K
PiA+IEJlY2F1c2Ugc29tZSBhcmNoaXRlY3R1cmVzIGFsbG93IHRvIHVzZSBhbGwgNjQgcGh5c2lj
YWwgYWRkcmVzcw0KPiA+IGJpdHMsIGJ1dCBzb21lIGFyY2hpdGVjdHVyZXMgYXJlIG5vdCAobGlr
ZSBBcm02NCBhbGxvd3MgNTIsIDQ4DQo+ID4gYml0cykuIEluIHRoaXMgY2FzZSwgd2UgdXNlIG1p
bihQQUREUl9CSVRTLCBCSVRTX1BFUl9MT05HIC0gMSkNCj4gPiB0byBjYWxjdWxhdGUgdGhlIHNo
aWZ0IHdoZW4gb25seSBvbmUgbm9kZSBpcyBpbiB0aGUgc3lzdGVtIGluDQo+ID4gdGhpcyBwYXRj
aCB0b28uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNv
bT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
IHdpdGggb25lIHNtYWxsIGZ1cnRoZXIgcmVxdWVzdCAoY291bGQgYmUgdGFrZW4gY2FyZSBvZiBh
bHNvIHdoaWxlDQo+IGNvbW1pdHRpbmcgaWYgbm8gb3RoZXIgbmVlZCBmb3IgYSB2OCBhcmlzZXMp
Og0KPiANCg0KVGhhbmtzLiBUaGlzIHNlcmllcyBpcyBpbiBtZXJnZSBjb25mbGljdCBzdGF0dXMg
bm93LCBkbyBJIG5lZWQgdG8NCnNlbmQgYSB2OCB0byBmaXggdGhlIG1lcmdlIGNvbmZsaWN0PyBJ
ZiB5ZXMsIEkgd2lsbCBmaXggYWJvdmUgYXMNCndlbGwsIGFmdGVyIFBBVENIIzUgYmUgcmV2aWV3
ZWQuDQoNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2NvbW1vbi9udW1hLmMNCj4g
PiBAQCAtMCwwICsxLDQ2NCBAQA0KPiA+ICsvKg0KPiA+ICsgKiBHZW5lcmljIFZNIGluaXRpYWxp
emF0aW9uIGZvciBOVU1BIHNldHVwcy4NCj4gPiArICogQ29weXJpZ2h0IDIwMDIsMjAwMyBBbmRp
IEtsZWVuLCBTdVNFIExhYnMuDQo+ID4gKyAqIEFkYXB0ZWQgZm9yIFhlbjogUnlhbiBIYXJwZXIg
PHJ5YW5oQHVzLmlibS5jb20+DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbi9p
bml0Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPg0KPiA+ICsjaW5jbHVkZSA8
eGVuL21tLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPiArI2luY2x1ZGUg
PHhlbi9udW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4gPiArI2luY2x1ZGUg
PHhlbi9zY2hlZC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4gPiArDQo+ID4g
K3N0cnVjdCBub2RlX2RhdGEgX19yb19hZnRlcl9pbml0IG5vZGVfZGF0YVtNQVhfTlVNTk9ERVNd
Ow0KPiA+ICsNCj4gPiArLyogTWFwcGluZyBmcm9tIHBkeCB0byBub2RlIGlkICovDQo+ID4gK3Vu
c2lnbmVkIGludCBfX3JvX2FmdGVyX2luaXQgbWVtbm9kZV9zaGlmdDsNCj4gPiArdW5zaWduZWQg
bG9uZyBfX3JvX2FmdGVyX2luaXQgbWVtbm9kZW1hcHNpemU7DQo+ID4gK25vZGVpZF90ICpfX3Jv
X2FmdGVyX2luaXQgbWVtbm9kZW1hcDsNCj4gPiArc3RhdGljIHR5cGVvZigqbWVtbm9kZW1hcCkg
X19yb19hZnRlcl9pbml0IF9tZW1ub2RlbWFwWzY0XTsNCj4gPiArDQo+ID4gK25vZGVpZF90IF9f
cmVhZF9tb3N0bHkgY3B1X3RvX25vZGVbTlJfQ1BVU10gPSB7DQo+ID4gKyAgICBbMCAuLi4gTlJf
Q1BVUy0xXSA9IE5VTUFfTk9fTk9ERQ0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArY3B1bWFza190IF9f
cmVhZF9tb3N0bHkgbm9kZV90b19jcHVtYXNrW01BWF9OVU1OT0RFU107DQo+ID4gKw0KPiA+ICtu
b2RlbWFza190IF9fcmVhZF9tb3N0bHkgbm9kZV9vbmxpbmVfbWFwID0geyB7IFswXSA9IDFVTCB9
IH07DQo+ID4gKw0KPiA+ICtib29sIF9fcm9fYWZ0ZXJfaW5pdCBudW1hX29mZjsNCj4gPiArDQo+
ID4gK2Jvb2wgbnVtYV9kaXNhYmxlZCh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICByZXR1cm4gbnVt
YV9vZmYgfHwgYXJjaF9udW1hX2Rpc2FibGVkKCk7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qDQo+
ID4gKyAqIEdpdmVuIGEgc2hpZnQgdmFsdWUsIHRyeSB0byBwb3B1bGF0ZSBtZW1ub2RlbWFwW10N
Cj4gPiArICogUmV0dXJucyA6DQo+ID4gKyAqIDEgaWYgT0sNCj4gPiArICogMCBpZiBtZW1ub2Rt
YXBbXSB0b28gc21hbGwgKG9mIHNoaWZ0IHRvbyBzbWFsbCkNCj4gDQo+IE1heSBJIGFzayB0aGF0
IHlvdSBjb3JyZWN0IHRoaXMgY29tbWVudCBsaW5lOiAib2YiIChhbG9uZSkgbWFrZXMgbm8gc2Vu
c2UNCj4gaGVyZS4gRWl0aGVyICJvciIgd2FzIG1lYW50IG9yIGl0IHdvdWxkIHdhbnQgdG8gYmUg
ImJlY2F1c2Ugb2YiLiBVbmxlc3MNCj4gdGhpcyBpcyBhIGxhbmd1YWdlIHR3ZWFrIEknbSBlbnRp
cmVseSB1bmF3YXJlIG9mIC4uLg0KDQpZZXMsIGlmIHdlIG5lZWQgYSB2OCwgSSB3aWxsIGNvcnJl
Y3QgaXQuDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gDQo+IEphbg0K

