Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964046A923F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 09:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505627.778494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0at-000705-Ba; Fri, 03 Mar 2023 08:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505627.778494; Fri, 03 Mar 2023 08:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0at-0006yN-8O; Fri, 03 Mar 2023 08:16:47 +0000
Received: by outflank-mailman (input) for mailman id 505627;
 Fri, 03 Mar 2023 08:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY0as-0006yH-0W
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 08:16:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb574ef2-b99b-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 09:16:43 +0100 (CET)
Received: from AM6P192CA0102.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::43)
 by AS2PR08MB9221.eurprd08.prod.outlook.com (2603:10a6:20b:59f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 08:16:41 +0000
Received: from VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::65) by AM6P192CA0102.outlook.office365.com
 (2603:10a6:209:8d::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 08:16:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT019.mail.protection.outlook.com (100.127.144.122) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 08:16:40 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Fri, 03 Mar 2023 08:16:40 +0000
Received: from ea51ec8a2d3b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9973518E-C20B-4D77-B966-0FBC94FF0BE8.1; 
 Fri, 03 Mar 2023 08:16:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea51ec8a2d3b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 08:16:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8640.eurprd08.prod.outlook.com (2603:10a6:10:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 08:16:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 08:16:25 +0000
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
X-Inumbo-ID: bb574ef2-b99b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMYrynd5Duu+Muxj+mi+Jg2tyzDYTTiu/AxTTYD/COk=;
 b=9bqkdEbolSJH7vEGZ+KKzCbKzjacLYjQ85P7Ov0Ok+cxdESTEK8EcrXYZtIqA3QwzDyh3llheqbFMI50Dxf46uFeXV2z+WCI0v6uzZRYFAuEh/3BL/Q+/7UNDRIT0M+gKmHaewewFXNSNSGgTRVhtlMDG664q9wctWaagNhs5HM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c5746d1d8e42980
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDNB+Roh7qQgRlktpOT6WyeKKX86+n4OZfYaPJWrEHRe26ly6obGGy5WjQ4pyO+Fvk5uu0f80Ou89L8rHcNs3NtiklnlVOXLGWX1pOPOXF/JQnxuHuk6Lx2T06FliSnEfzTC3GkHyAI7cMenPNKiwPdjhkQMJiykzzc0N7Ii+Fq9Msl1++H7Ohk76io13Z3+TkgyOEWUhPMPde8gShDvotXzzgPpqfDP1llDLdDqk7V/eZnfXrsFVljw57Kie+GGxFwgzt+Z24h1VSXnzP71zZ9Ru5M3l4tpPlOcJriMTxzyRYD01LnCDOnEXpPgwDro1ctB98y/xwwcIXsyJFhjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMYrynd5Duu+Muxj+mi+Jg2tyzDYTTiu/AxTTYD/COk=;
 b=akamxxjq2WGiX1DIkOZSzf2/qQW8QQCZAke6mgcyVebO4JfiskxKhRlUHrWGIcmfbI3dnlnwTWFcAZH/Pko6O242ZvkCUPKFo4iWy7PgDhTLAcyRcKENSafSAiM7YT0tf1in06OGn+9s00Uahqj+BBOyi3f0ie994heIbHWGrt3sVIVsDL7L6ElrBXG5L1+Ybi6os5J701lpwJCmXMLeuPfQYOhNk6s/g9AW767q3FeHY5wrt406aAUqZrXq2aceYUo/V+Iz19iYTj3rBEvgY7X/e3Km8C/iGYS/Gc6cZxtQ6+XVUROy4/mHJZREW81mco7+CoFu1GGNAdL3JpvjwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMYrynd5Duu+Muxj+mi+Jg2tyzDYTTiu/AxTTYD/COk=;
 b=9bqkdEbolSJH7vEGZ+KKzCbKzjacLYjQ85P7Ov0Ok+cxdESTEK8EcrXYZtIqA3QwzDyh3llheqbFMI50Dxf46uFeXV2z+WCI0v6uzZRYFAuEh/3BL/Q+/7UNDRIT0M+gKmHaewewFXNSNSGgTRVhtlMDG664q9wctWaagNhs5HM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Topic: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Index: AQHZRtMeFpHwz1fcdEO/uVmQactk+a7noysAgAEWNoCAAAnRgA==
Date: Fri, 3 Mar 2023 08:16:25 +0000
Message-ID: <7A0F0605-7A22-4DE1-AF0A-FE7921F4935C@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <be5a37c0ec23bf8119f5cb68ec58d8cca16d9812.1677079672.git.jens.wiklander@linaro.org>
 <BE16E58C-FBDF-4815-A6C1-CB0D3C573816@arm.com>
 <CAHUa44HmBsH2tCk=N=sovVVbgs9v5kLkOfJNzLfqXifZ=8iZtw@mail.gmail.com>
In-Reply-To:
 <CAHUa44HmBsH2tCk=N=sovVVbgs9v5kLkOfJNzLfqXifZ=8iZtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8640:EE_|VI1EUR03FT019:EE_|AS2PR08MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 2608f1be-e66e-446a-e327-08db1bbf9df0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a13VbmGgkSdmdFuGnqGJyfE4oBQ9das9/j2oz6Z6guJF/JsWGy1rU7JyiKaHEdVhz9XUBBmd38icwjBNRbhDW2HeKvWJYFT8JoAy0k+mC/RxK3zlLXG+qLnVYcjitvHYtBAIv8jyEYPSlkTWTAzJ3wM8VKKUuiQq/7pEzDYPIPhnpyAyk5NAR8przN+Nu4zjk6dWgLzAZ+1cXRtVpewaXGcmkWig7xnVqlFOlthN1lS3lCIN39aYgKDI0RdbpDMTwM1bkb3V6UK95G7kqQb2MGDCac4RdSPbRvoIMKEjYZ7MrRTy1WuBhb94Am3P1ubvT3q0sWCk9YmTvnDJhxfB4Rmoe20FXk1UZWaFfkoPFjhll2QFroujU2zdtg7jLxHIk8Kvf+f/c6RfrSouEvcTgy0W4vb5DIM71QzFwEA0N0MZk0D/42/JMvKs8ZxDh28fY2ho8307jJBYSygJQfO7tyajvzvW2ZtwW78CrjVSADPKePhJqbdXUKSJSaedS/cu1Ni/rpihg8iH1To1ifuQ/lZfYk/3aiAD6nR79qvYJsYrvJ+WBNV+4J+cP7kc6kZr9dy9BKa2ex1H/rQrz4rEo3i77hw9tWTbVKR0D2cOh7av9j3f5htRWwuAqUmzr/83iatKr2EDX6OVU93QeNxEyR58QC3hQlKPJGdBn8uDg//J20vQj5u0dQV0l6vAqxeLaTEE5o0Nmt9VtuX2f9Q/XjquihodTLhVL7Olw53WEtc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199018)(38070700005)(6512007)(6506007)(26005)(186003)(53546011)(54906003)(316002)(76116006)(5660300002)(478600001)(36756003)(6486002)(2906002)(71200400001)(33656002)(86362001)(8936002)(91956017)(8676002)(83380400001)(6916009)(4326008)(66556008)(66476007)(64756008)(66446008)(66946007)(41300700001)(38100700002)(2616005)(66899018)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <66FDA746909A194EA927E4C75D0A935B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fe35c39-1694-419a-2443-08db1bbf9501
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	289vDrxR5RzRVn0S17shOK2P92DERBwswLq2mtoZe79JeUF6rbOE8XEJubBHdReZmWBjEJLV/UqUZyD2dKcllPL6uW7bk/l35LCkfB2ksvsWgPW++Y95NxBOEQv90vI00vSH040AKClYJtmjc8FbmpcNdnSiWi27TH57y2TU7BmtcKExupG9pFLXBLQo6mf4QTm/WxdBsbiUPU5B4T6vOGky8wE1tGcz9KtCzQvF3jkWAopnVkrEBAbjBrME/JagxbAnWSFIcKXSjMSK1HNO1dOKYph3Jqt5p9QXmF7EWN3bNI4lG7/smrj3xjBETtER2o6BYi/avr8UuNwApjQqS1D0CduCsdPm02VZJ6adJPqCkD35xc8E2mZrEhB00/2e82d7IwNnqTZYVqZgYaqfkr2E5IMOlqal+w8QnHhu8DkCykge39lWLjIKrLawEw0vCHIUzjAYFgp5lmz2V9v7N0j9oFkZAHs+ncAwUBFL35BSTLHsNRwS00tXA0RCEVxJcKJfapVZQfTgc7k/I5b09LRQEmJZonhc2Gn98RQdJ2amoTQh3llfhDAH69f9EdvYM/T4m6qZvLtgDcTTr8+v6mT1P/45AS+RK8sKhLO3xbVWUzGRq6c+JlcoLN1RXszh0IJRShqz7f2f6LF+OSV+21C1J9uHRHQ5ILp1HkJNtaRk7bqPRCDHq89LIPAI8MDmK9y/PTHkgrt7RtGN/XXtog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(6506007)(53546011)(6512007)(6486002)(2616005)(336012)(26005)(186003)(41300700001)(54906003)(4326008)(8676002)(70586007)(316002)(2906002)(478600001)(82740400003)(5660300002)(8936002)(81166007)(6862004)(33656002)(40480700001)(82310400005)(356005)(86362001)(36860700001)(70206006)(83380400001)(66899018)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 08:16:40.4164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2608f1be-e66e-446a-e327-08db1bbf9df0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9221

SGkgSmVucywNCg0KPiBPbiAzIE1hciAyMDIzLCBhdCAwODo0MSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDQ6MDXigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4gDQo+
Pj4gT24gMjIgRmViIDIwMjMsIGF0IDE2OjMzLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5k
ZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gQWRkcyBzdXBwb3J0IGluIHRoZSBtZWRp
YXRvciB0byBtYXAgYW5kIHVubWFwIHRoZSBSWCBhbmQgVFggYnVmZmVycw0KPj4+IHByb3ZpZGVk
IGJ5IHRoZSBndWVzdCB1c2luZyB0aGUgdHdvIEZGLUEgZnVuY3Rpb25zIEZGQV9SWFRYX01BUCBh
bmQNCj4+PiBGRkFfUlhUWF9VTk1BUC4NCj4+PiANCj4+PiBUaGVzZSBidWZmZXIgYXJlIGxhdGVy
IHVzZWQgdG8gdG8gdHJhbnNtaXQgZGF0YSB0aGF0IGNhbm5vdCBiZSBwYXNzZWQgaW4NCj4+PiBy
ZWdpc3RlcnMgb25seS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBKZW5zIFdpa2xhbmRlciA8
amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiB4ZW4vYXJjaC9hcm0vdGVl
L2ZmYS5jIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4gMSBmaWxlIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+Pj4g
aW5kZXggZjFiMDE0YjZjN2Y0Li45NTNiNmRmZDVlY2EgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3RlZS9mZmEuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+PiBA
QCAtMTQ5LDEwICsxNDksMTcgQEAgc3RydWN0IGZmYV9wYXJ0aXRpb25faW5mb18xXzEgew0KPj4+
IH07DQo+Pj4gDQo+Pj4gc3RydWN0IGZmYV9jdHggew0KPj4+ICsgICAgdm9pZCAqcng7DQo+Pj4g
KyAgICBjb25zdCB2b2lkICp0eDsNCj4+PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnJ4X3BnOw0K
Pj4+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqdHhfcGc7DQo+Pj4gKyAgICB1bnNpZ25lZCBpbnQg
cGFnZV9jb3VudDsNCj4+PiAgICB1aW50MzJfdCBndWVzdF92ZXJzOw0KPj4+ICsgICAgYm9vbCB0
eF9pc19taW5lOw0KPj4+ICAgIGJvb2wgaW50ZXJydXB0ZWQ7DQo+Pj4gfTsNCj4+PiANCj4+PiAr
DQo+PiBOZXdsaW5lIHByb2JhYmx5IGFkZGVkIGJ5IG1pc3Rha2UuDQo+IA0KPiBZZXMsIEknbGwg
cmVtb3ZlIGl0Lg0KPiANCj4+IA0KPj4+IC8qIE5lZ290aWF0ZWQgRkYtQSB2ZXJzaW9uIHRvIHVz
ZSB3aXRoIHRoZSBTUE1DICovDQo+Pj4gc3RhdGljIHVpbnQzMl90IGZmYV92ZXJzaW9uIF9fcm9f
YWZ0ZXJfaW5pdDsNCj4+PiANCj4+PiBAQCAtMzM3LDYgKzM0NCwxMSBAQCBzdGF0aWMgdm9pZCBz
ZXRfcmVncyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgcmVnaXN0ZXJfdCB2MCwgcmVnaXN0
ZXJfdCB2MSwNCj4+PiAgICAgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDcsIHY3KTsNCj4+PiB9DQo+
Pj4gDQo+Pj4gK3N0YXRpYyB2b2lkIHNldF9yZWdzX2Vycm9yKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzLCB1aW50MzJfdCBlcnJvcl9jb2RlKQ0KPj4+ICt7DQo+Pj4gKyAgICBzZXRfcmVncyhy
ZWdzLCBGRkFfRVJST1IsIDAsIGVycm9yX2NvZGUsIDAsIDAsIDAsIDAsIDApOw0KPj4+ICt9DQo+
Pj4gKw0KPj4+IHN0YXRpYyB2b2lkIHNldF9yZWdzX3N1Y2Nlc3Moc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MsIHVpbnQzMl90IHcyLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCB3MykNCj4+PiB7DQo+Pj4gQEAgLTM1OCw2ICszNzAsOTkgQEAgc3RhdGljIHZvaWQg
aGFuZGxlX3ZlcnNpb24oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4gICAgc2V0X3Jl
Z3MocmVncywgdmVycywgMCwgMCwgMCwgMCwgMCwgMCwgMCk7DQo+Pj4gfQ0KPj4+IA0KPj4+ICtz
dGF0aWMgdWludDMyX3QgaGFuZGxlX3J4dHhfbWFwKHVpbnQzMl90IGZpZCwgcmVnaXN0ZXJfdCB0
eF9hZGRyLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3Qg
cnhfYWRkciwgdWludDMyX3QgcGFnZV9jb3VudCkNCj4+PiArew0KPj4+ICsgICAgdWludDMyX3Qg
cmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+Pj4gKyAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gY3VycmVudC0+ZG9tYWluOw0KPj4+ICsgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQt
PmFyY2gudGVlOw0KPj4+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqdHhfcGc7DQo+Pj4gKyAgICBz
dHJ1Y3QgcGFnZV9pbmZvICpyeF9wZzsNCj4+PiArICAgIHAybV90eXBlX3QgdDsNCj4+PiArICAg
IHZvaWQgKnJ4Ow0KPj4+ICsgICAgdm9pZCAqdHg7DQo+Pj4gKw0KPj4+ICsgICAgaWYgKCAhc21j
Y2NfaXNfY29udl82NChmaWQpICkNCj4+PiArICAgIHsNCj4+PiArICAgICAgICB0eF9hZGRyICY9
IFVJTlQzMl9NQVg7DQo+Pj4gKyAgICAgICAgcnhfYWRkciAmPSBVSU5UMzJfTUFYOw0KPj4+ICsg
ICAgfQ0KPj4gDQo+PiBJIGFtIGJpdCB3b25kZXJpbmcgaGVyZSB3aGF0IHdlIHNob3VsZCBkbzoN
Cj4+IC0gd2UgY291bGQganVzdCBzYXkgdGhhdCAzMmJpdCB2ZXJzaW9uIG9mIHRoZSBjYWxsIGlz
IG5vdCBhbGxvd2VkIGZvciBub24gMzJiaXQgZ3Vlc3RzDQo+PiAtIHdlIGNvdWxkIGNoZWNrIHRo
YXQgdGhlIGhpZ2hlc3QgYml0cyBhcmUgMCBmb3IgNjRiaXQgZ3Vlc3RzIGFuZCByZXR1cm4gYW4g
ZXJyb3IgaWYgbm90DQo+PiAtIHdlIGNhbiBqdXN0IG1hc2sgaG9wcGluZyB0aGF0IGlmIHRoZXJl
IHdhcyBhIG1pc3Rha2UgdGhlIGFkZHJlc3MgYWZ0ZXIgdGhlIG1hc2sNCj4+IGRvZXMgbm90IGV4
aXN0IGluIHRoZSBndWVzdCBzcGFjZQ0KPj4gDQo+PiBBdCB0aGUgZW5kIG5vdGhpbmcgaW4gdGhl
IHNwZWMgaXMgcHJldmVudGluZyBhIDY0Yml0IGd1ZXN0IHRvIHVzZSB0aGUgMzJiaXQgc28gaXQg
bWlnaHQNCj4+IGJlIGEgZ29vZCBpZGVhIHRvIHJldHVybiBhbiBlcnJvciBpZiB0aGUgaGlnaGVz
dCAzMmJpdCBhcmUgbm90IDAgaGVyZSA/DQo+IA0KPiBUaGUgU01DIENhbGxpbmcgQ29udmVudGlv
biBzYXlzOg0KPiBXaGVuIGFuIFNNQzMyL0hWQzMyIGNhbGwgaXMgbWFkZSBmcm9tIEFBcmNoNjQ6
DQo+IC0gQSBGdW5jdGlvbiBJZGVudGlmaWVyIGlzIHBhc3NlZCBpbiByZWdpc3RlciBXMC4NCj4g
LSBBcmd1bWVudHMgYXJlIHBhc3NlZCBpbiByZWdpc3RlcnMgVzEtVzcuDQo+IA0KPiBTbyBtYXNr
aW5nIG9mZiB0aGUgaGlnaGVyIGJpdHMgaXMgYWxsIHRoYXQgc2hvdWxkIGJlIGRvbmUuDQoNClBs
ZWFzZSBwdXQgYSBjb21tZW50IHNheWluZyB0aGF0IGluIDMyIGJpdCBjb252ZW50aW9uIGhpZ2hl
ciBiaXRzIHNob3VsZCBiZSBpZ25vcmVkLg0KDQo+IA0KPj4gDQo+Pj4gKw0KPj4+ICsgICAgLyog
Rm9yIG5vdyB0byBrZWVwIHRoaW5ncyBzaW1wbGUsIG9ubHkgZGVhbCB3aXRoIGEgc2luZ2xlIHBh
Z2UgKi8NCj4+PiArICAgIGlmICggcGFnZV9jb3VudCAhPSAxICkNCj4+PiArICAgICAgICByZXR1
cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gDQo+PiBQbGVhc2UgYWRkIGEgVE9ETyBoZXJl
IGFuZCBhIHByaW50IGFzIHRoaXMgaXMgYSBsaW1pdGF0aW9uIHdlIHdpbGwgcHJvYmFibHkgaGF2
ZSB0bw0KPj4gd29yayBvbiBzb29uLg0KPiANCj4gSSdsbCBhZGQgYW4gYXJiaXRyYXJ5IHVwcGVy
IGxpbWl0IGFuZCBhIHByaW50IGlmIGl0J3MgZXhjZWVkZWQuDQoNCnRoYW5rcw0KDQo+IA0KPj4g
DQo+PiANCj4+PiArDQo+Pj4gKyAgICAvKiBBbHJlYWR5IG1hcHBlZCAqLw0KPj4+ICsgICAgaWYg
KCBjdHgtPnJ4ICkNCj4+PiArICAgICAgICByZXR1cm4gRkZBX1JFVF9ERU5JRUQ7DQo+Pj4gKw0K
Pj4+ICsgICAgdHhfcGcgPSBnZXRfcGFnZV9mcm9tX2dmbihkLCBnZm5feChnYWRkcl90b19nZm4o
dHhfYWRkcikpLCAmdCwgUDJNX0FMTE9DKTsNCj4+PiArICAgIGlmICggIXR4X3BnICkNCj4+PiAr
ICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+Pj4gKyAgICAvKiBP
bmx5IG5vcm1hbCBSQU0gZm9yIG5vdyAqLw0KPj4+ICsgICAgaWYgKCAhcDJtX2lzX3JhbSh0KSAp
DQo+Pj4gKyAgICAgICAgZ290byBlcnJfcHV0X3R4X3BnOw0KPj4+ICsNCj4+PiArICAgIHJ4X3Bn
ID0gZ2V0X3BhZ2VfZnJvbV9nZm4oZCwgZ2ZuX3goZ2FkZHJfdG9fZ2ZuKHJ4X2FkZHIpKSwgJnQs
IFAyTV9BTExPQyk7DQo+Pj4gKyAgICBpZiAoICF0eF9wZyApDQo+Pj4gKyAgICAgICAgZ290byBl
cnJfcHV0X3R4X3BnOw0KPj4+ICsgICAgLyogT25seSBub3JtYWwgUkFNIGZvciBub3cgKi8NCj4+
PiArICAgIGlmICggIXAybV9pc19yYW0odCkgKQ0KPj4+ICsgICAgICAgIGdvdG8gZXJyX3B1dF9y
eF9wZzsNCj4+PiArDQo+Pj4gKyAgICB0eCA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCh0eF9w
Zyk7DQo+Pj4gKyAgICBpZiAoICF0eCApDQo+Pj4gKyAgICAgICAgZ290byBlcnJfcHV0X3J4X3Bn
Ow0KPj4+ICsNCj4+PiArICAgIHJ4ID0gX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKHJ4X3BnKTsN
Cj4+PiArICAgIGlmICggIXJ4ICkNCj4+PiArICAgICAgICBnb3RvIGVycl91bm1hcF90eDsNCj4+
PiArDQo+Pj4gKyAgICBjdHgtPnJ4ID0gcng7DQo+Pj4gKyAgICBjdHgtPnR4ID0gdHg7DQo+Pj4g
KyAgICBjdHgtPnJ4X3BnID0gcnhfcGc7DQo+Pj4gKyAgICBjdHgtPnR4X3BnID0gdHhfcGc7DQo+
Pj4gKyAgICBjdHgtPnBhZ2VfY291bnQgPSAxOw0KPj4gDQo+PiBwbGVhc2UgdXNlIHBhZ2VfY291
bnQgaGVyZSBpbnN0ZWFkIG9mIDEgc28gdGhhdCB0aGlzIGlzIG5vdCBmb3Jnb3R0ZW4gb25jZQ0K
Pj4gd2UgYWRkIHN1cHBvcnQgZm9yIG1vcmUgcGFnZXMuDQo+IA0KPiBPSw0KDQpDaGVlcnMNCkJl
cnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+IA0KPj4gDQo+PiBDaGVlcnMN
Cj4+IEJlcnRyYW5kDQo+PiANCj4+PiArICAgIGN0eC0+dHhfaXNfbWluZSA9IHRydWU7DQo+Pj4g
KyAgICByZXR1cm4gRkZBX1JFVF9PSzsNCj4+PiArDQo+Pj4gK2Vycl91bm1hcF90eDoNCj4+PiAr
ICAgIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCh0eCk7DQo+Pj4gK2Vycl9wdXRfcnhfcGc6DQo+
Pj4gKyAgICBwdXRfcGFnZShyeF9wZyk7DQo+Pj4gK2Vycl9wdXRfdHhfcGc6DQo+Pj4gKyAgICBw
dXRfcGFnZSh0eF9wZyk7DQo+Pj4gKw0KPj4+ICsgICAgcmV0dXJuIHJldDsNCj4+PiArfQ0KPj4+
ICsNCj4+PiArc3RhdGljIHZvaWQgcnh0eF91bm1hcChzdHJ1Y3QgZmZhX2N0eCAqY3R4KQ0KPj4+
ICt7DQo+Pj4gKyAgICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoY3R4LT5yeCk7DQo+Pj4gKyAg
ICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoY3R4LT50eCk7DQo+Pj4gKyAgICBwdXRfcGFnZShj
dHgtPnJ4X3BnKTsNCj4+PiArICAgIHB1dF9wYWdlKGN0eC0+dHhfcGcpOw0KPj4+ICsgICAgY3R4
LT5yeCA9IE5VTEw7DQo+Pj4gKyAgICBjdHgtPnR4ID0gTlVMTDsNCj4+PiArICAgIGN0eC0+cnhf
cGcgPSBOVUxMOw0KPj4+ICsgICAgY3R4LT50eF9wZyA9IE5VTEw7DQo+Pj4gKyAgICBjdHgtPnBh
Z2VfY291bnQgPSAwOw0KPj4+ICsgICAgY3R4LT50eF9pc19taW5lID0gZmFsc2U7DQo+Pj4gK30N
Cj4+PiArDQo+Pj4gK3N0YXRpYyB1aW50MzJfdCBoYW5kbGVfcnh0eF91bm1hcCh2b2lkKQ0KPj4+
ICt7DQo+Pj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOw0KPj4+ICsg
ICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggIWN0eC0+cnggKQ0KPj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURfUEFSQU1F
VEVSUzsNCj4+PiArDQo+Pj4gKyAgICByeHR4X3VubWFwKGN0eCk7DQo+Pj4gKw0KPj4+ICsgICAg
cmV0dXJuIEZGQV9SRVRfT0s7DQo+Pj4gK30NCj4+PiArDQo+Pj4gc3RhdGljIHZvaWQgaGFuZGxl
X21zZ19zZW5kX2RpcmVjdF9yZXEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90
IGZpZCkNCj4+PiB7DQo+Pj4gICAgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncyBhcmcgPSB7IC5h
MCA9IGZpZCwgfTsNCj4+PiBAQCAtNDIzLDYgKzUyOCw3IEBAIHN0YXRpYyBib29sIGZmYV9oYW5k
bGVfY2FsbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+PiAgICB1aW50MzJfdCBmaWQg
PSBnZXRfdXNlcl9yZWcocmVncywgMCk7DQo+Pj4gICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJl
bnQtPmRvbWFpbjsNCj4+PiAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+
Pj4gKyAgICBpbnQgZTsNCj4+PiANCj4+PiAgICBpZiAoICFjdHggKQ0KPj4+ICAgICAgICByZXR1
cm4gZmFsc2U7DQo+Pj4gQEAgLTQzNSw2ICs1NDEsMjQgQEAgc3RhdGljIGJvb2wgZmZhX2hhbmRs
ZV9jYWxsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+ICAgIGNhc2UgRkZBX0lEX0dF
VDoNCj4+PiAgICAgICAgc2V0X3JlZ3Nfc3VjY2VzcyhyZWdzLCBnZXRfdm1faWQoZCksIDApOw0K
Pj4+ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+PiArICAgIGNhc2UgRkZBX1JYVFhfTUFQXzMyOg0K
Pj4+ICsjaWZkZWYgQ09ORklHX0FSTV82NA0KPj4+ICsgICAgY2FzZSBGRkFfUlhUWF9NQVBfNjQ6
DQo+Pj4gKyNlbmRpZg0KPj4+ICsgICAgICAgIGUgPSBoYW5kbGVfcnh0eF9tYXAoZmlkLCBnZXRf
dXNlcl9yZWcocmVncywgMSksIGdldF91c2VyX3JlZyhyZWdzLCAyKSwNCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdldF91c2VyX3JlZyhyZWdzLCAzKSk7DQo+Pj4gKyAgICAgICAg
aWYgKCBlICkNCj4+PiArICAgICAgICAgICAgc2V0X3JlZ3NfZXJyb3IocmVncywgZSk7DQo+Pj4g
KyAgICAgICAgZWxzZQ0KPj4+ICsgICAgICAgICAgICBzZXRfcmVnc19zdWNjZXNzKHJlZ3MsIDAs
IDApOw0KPj4+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPj4+ICsgICAgY2FzZSBGRkFfUlhUWF9V
Tk1BUDoNCj4+PiArICAgICAgICBlID0gaGFuZGxlX3J4dHhfdW5tYXAoKTsNCj4+PiArICAgICAg
ICBpZiAoIGUgKQ0KPj4+ICsgICAgICAgICAgICBzZXRfcmVnc19lcnJvcihyZWdzLCBlKTsNCj4+
PiArICAgICAgICBlbHNlDQo+Pj4gKyAgICAgICAgICAgIHNldF9yZWdzX3N1Y2Nlc3MocmVncywg
MCwgMCk7DQo+Pj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4gICAgY2FzZSBGRkFfTVNHX1NF
TkRfRElSRUNUX1JFUV8zMjoNCj4+PiAjaWZkZWYgQ09ORklHX0FSTV82NA0KPj4+ICAgIGNhc2Ug
RkZBX01TR19TRU5EX0RJUkVDVF9SRVFfNjQ6DQo+Pj4gQEAgLTUxNSw2ICs2MzksOSBAQCBzdGF0
aWMgaW50IGZmYV9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+ICAg
ICAgICAgICAgICAgICAgIGdldF92bV9pZChkKSwgc3Vic2NyX3ZtX2Rlc3Ryb3llZFtuXSwgcmVz
KTsNCj4+PiAgICB9DQo+Pj4gDQo+Pj4gKyAgICBpZiAoIGN0eC0+cnggKQ0KPj4+ICsgICAgICAg
IHJ4dHhfdW5tYXAoY3R4KTsNCj4+PiArDQo+Pj4gICAgWEZSRUUoZC0+YXJjaC50ZWUpOw0KPj4+
IA0KPj4+ICAgIHJldHVybiAwOw0KPj4+IC0tDQo+Pj4gMi4zNC4xDQoNCg0K

