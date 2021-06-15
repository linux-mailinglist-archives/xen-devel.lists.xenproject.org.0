Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B403A76E9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 08:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141898.261988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt2FN-00033H-M1; Tue, 15 Jun 2021 06:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141898.261988; Tue, 15 Jun 2021 06:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt2FN-00030v-J0; Tue, 15 Jun 2021 06:08:25 +0000
Received: by outflank-mailman (input) for mailman id 141898;
 Tue, 15 Jun 2021 06:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fd+K=LJ=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lt2FL-00030o-O0
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 06:08:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 906bb7b1-cf1e-4f24-9bff-6a39cd948d07;
 Tue, 15 Jun 2021 06:08:22 +0000 (UTC)
Received: from DBBPR09CA0006.eurprd09.prod.outlook.com (2603:10a6:10:c0::18)
 by DB9PR08MB7024.eurprd08.prod.outlook.com (2603:10a6:10:2cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 06:08:15 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::8b) by DBBPR09CA0006.outlook.office365.com
 (2603:10a6:10:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 15 Jun 2021 06:08:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 06:08:14 +0000
Received: ("Tessian outbound 9d3d496fabe8:v93");
 Tue, 15 Jun 2021 06:08:14 +0000
Received: from 8ef54cfc1d8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B30C6FE-8B39-46B9-A80D-39D0E1048434.1; 
 Tue, 15 Jun 2021 06:08:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ef54cfc1d8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Jun 2021 06:08:06 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3728.eurprd08.prod.outlook.com (2603:10a6:803:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 06:08:00 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 06:08:00 +0000
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
X-Inumbo-ID: 906bb7b1-cf1e-4f24-9bff-6a39cd948d07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmvLMnUyXKkeR1agEijox6oairFBDgNT7zNDdvTaZss=;
 b=S623XQ7tp26Lc0+X/oBVj0v8VGN53WzOW31MXXmFVQvy+U6tIY1NHLHeToaeWyVomunmtpfndfA5q5umlM3/s6us+84MMKuIY4QSaPAvTsUAvHLNyVeTTy4RIOJ2beGFfnpzsExizi0mfN2yQokGGeA0v5evdQj2Ql1lbaO/k6A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5FgR+lT2ndvnlB70+E7UDahJhpAuf1FQQrDQQoHkPTVjKfmBacI/gWo7s6U79QfyvfZMioevm3lz4bqrU9irI9annkajcPbaupfEDA79/9zJmAJD+pagUGCSLg/x16WheH4VwOkNsbPEB4kDGq4OwzphID7jWCSeNGtGwJ9bl8/IDSqsIwIie6ep5kA9Ikn70XTXd1wHBB5BR3IUkYjJEPPMAR2ptMt+WtEFM4h/BFNWVThKfXmw5Zcsi2VJrVCVFwjItJYB7ga7YCW0Pq9Ji1pPKxBzD0X44MA+0WmdP5T80mk8RLDvg4UKXuLi9QxY6aGc0sbXHyyZhIByOp84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmvLMnUyXKkeR1agEijox6oairFBDgNT7zNDdvTaZss=;
 b=Pj1lTERb8d1E+kUlMx7ILnLDZGB0lhZBgWwFNhN6kNEmbo4ZLEEFV7S9a8yamm/cGcbInsidSAkMjZlqO6Ea1B0kfO9RsNQgfWOCkR2CTF7oHoqT1IONdOBpiKUv9uP5ZwB+R5+CaP356TtaOdfXnhBmHB9a7z9MrDD9q3xsrYWpbwfyHllEnCC9c89nSGGU8tvST/XKwAEIym6o2wqnjFW1yiDlZFfHXvaix4XtiIU2IPWx05gx5muoSeblgKCmzFWT2RIcKbRxlC4/IoE84byqGyQpokADiD6PVUU2PfIrY5kNn05r0AKNbIq7n80c7HGq4WniEDenf1/4V3gXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmvLMnUyXKkeR1agEijox6oairFBDgNT7zNDdvTaZss=;
 b=S623XQ7tp26Lc0+X/oBVj0v8VGN53WzOW31MXXmFVQvy+U6tIY1NHLHeToaeWyVomunmtpfndfA5q5umlM3/s6us+84MMKuIY4QSaPAvTsUAvHLNyVeTTy4RIOJ2beGFfnpzsExizi0mfN2yQokGGeA0v5evdQj2Ql1lbaO/k6A=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien.grall.oss@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, nd
	<nd@arm.com>
Subject: RE: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index:
 AQHXS6WvvFnJG9tHGECWPMZXor2qraro8JyAgAAPtYCAAiGdAIAAuwwggAA2KACAFH+QgIABhnKAgADPmoCAAAmNAIAAHmCAgAXol4CAAprMgIAADkQAgAkaNQA=
Date: Tue, 15 Jun 2021 06:08:00 +0000
Message-ID:
 <VE1PR08MB52152038F1366DA9B8A7D3D8F7309@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
 <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
 <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
 <113937c2-f1a7-c27f-8e2e-79de729ea3ce@xen.org>
 <BAC8BC8D-9CD6-4857-88C0-7DCE9267EF0E@arm.com>
 <e3a81b21-fd11-852c-aed7-25e71e4b5539@xen.org>
In-Reply-To: <e3a81b21-fd11-852c-aed7-25e71e4b5539@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D79ECCA853884E4E892F233370117AD9.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ebaf0182-e710-4a9c-25f1-08d92fc3f66d
x-ms-traffictypediagnostic: VI1PR08MB3728:|DB9PR08MB7024:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7024ADE32B2E969B2E681B3DF7309@DB9PR08MB7024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vQJ9YZqfMlqViVeILQVcSIr/Zs9KgcjTZAFXhGodO9MmSwsnwUen2ErVjkDaZjf44eAfVZL856/fSYEdEf1ehSc0Yg6i/L/ghGB878BJomfVW+7ubEBhmM21yTk7HhO/BW9RJ6hIo0Oksp9XdYBDiyKVOVkW0ZAz3mVz30gl5CRUnF6VGQbXMFQneV7k3HYyLyuX4Pny9jG8QKBP5g0pBn1gvsuR/R6I6mEqu0gk8+ROBzO6YSJ3YJxfb9omcomUMAcIicQOha+IMII3v6hiyahAZw0yFzXPp/NtNgMFFAmfj5fj2UEr8+an6Oam/mhErbn/zHOZmso6j/fTc9yLbhlB/U1KvJ3fLktkA+YdAd0mejpPK94uJIRSUDd+0USmiqiVExFehXuF9lsD3Lr/ucqpfE8d/OFPtD+HoAP36Elq9fjCHAHUlgi+4PkZy3dbYfIfA/IKc7caBvA0NGTluzEo+n6/CYHZLP+W2WRZgHJzd+tLqsk4MJSZoMKjR8/I8qJj9omforC4AS0XBPjQqArFkG8cJW0im6a7iTIuEro71mD/KkkoogafizXWODUVjA4N4cxXx0gM9t5INdpiIBqE8Hptl8FmUOJhJWVb6Z4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(122000001)(83380400001)(66446008)(33656002)(38100700002)(64756008)(9686003)(66476007)(66946007)(55016002)(76116006)(66556008)(478600001)(2906002)(4326008)(53546011)(6506007)(86362001)(5660300002)(52536014)(6636002)(316002)(71200400001)(8676002)(54906003)(110136005)(8936002)(26005)(7696005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I1L3705etq525jGyGkHEj9vN8X0oxxLgfSx46k4o7X1GUpGzMJp7pkDqlFTb?=
 =?us-ascii?Q?1mLUbO9RbtyQeVQNGbD7mM4EOY5IcFljC73WGC2f/4ExcBzEER37kY4sDhOr?=
 =?us-ascii?Q?AVEO1xqjg8gvuby89J1bXrY/6pLTib8FcbS7Pl6ZyrtS5CbmWKqJ/hdGSUC6?=
 =?us-ascii?Q?DuvsyED8Kf/5lPdzWBDO7Y8hPqtytJnf5GRDreCT6HKZvzGigYzRLX+rj9Wj?=
 =?us-ascii?Q?g7ggCQ2huoGvJKCIpFQx5+fkOffGT8LifvKoxtddVZ4+0CrWxq3bALaHUA9F?=
 =?us-ascii?Q?BHZ06TETSx3cZFKW5ocmwVX0iV9kwuyQu2+xZn0+Z5OhRydR+l96gBrPClbH?=
 =?us-ascii?Q?ZV5+SOSiM5grhD2jy5/Y4y6v9HQ75ff31aQtTW2yK5285EZ7IlVruOxdYTKb?=
 =?us-ascii?Q?2jB6RwEJAe+OTS8PVrX3IJlFpVOqOx/iXPxz4i0/md3c+SNDX3r0IPYKIMvv?=
 =?us-ascii?Q?o960E17wTMyAW5borWGaFNv/9Ot7/fanHE4zvX5ZUkS4IZwf4922TMXSjm/8?=
 =?us-ascii?Q?YF1nlhEygYn592kV2to7dcUU9jYr3gsnU+a8DQ71JrJhwJ926GLcJDaDQWa1?=
 =?us-ascii?Q?a3Yj322DUPezQ/hajkJ7DFnkCNpys/c0dBbVuvUDk1XsoL4QVv91Mqpn/5ng?=
 =?us-ascii?Q?EpJTe/HkugkH3qceLPm7siOlnYTpa0D7RUGA8Q6CrXub9RbKBsnTZpoB69jm?=
 =?us-ascii?Q?njzM3dpoQ0ivnrYzrkho3iT4XNiPsi1cJR2yScAftvNiX1nE6pAw0XXy7AGC?=
 =?us-ascii?Q?2yJt1iUp2ubwNDBRNRvRTm+yUkhZfs4Zg3YiRkNuQh2MJM90HA5gowAWnl3W?=
 =?us-ascii?Q?uxjKwP3dbhjCCXaY/gRdENfTxTBhzNgrV2hLG6BFzC3bs2+K50Hn9xgAGFAk?=
 =?us-ascii?Q?dBqnoU07MupGV3HELz/4X566XeZ8raJ2vLVsRXZdx55PRcy6my8B66YUALGY?=
 =?us-ascii?Q?Y2Y/TQg4HfqFXUO4018bESTKpkv5/HRue6u2CdLxIPIH6wL0BN4pJZ7Je+oG?=
 =?us-ascii?Q?rMfcU8InE0WGn3T32qLHIgavLhdgpv5HXwZsGGNvKWfqUfGPmeItFwOAQX1n?=
 =?us-ascii?Q?kFNaCQDVCcfsYWvJMk34FWXPe8uLsBsgut5Ouanw2lcV4R0l8d4SzCFTsgwF?=
 =?us-ascii?Q?CUsUs3X4aOx6m6C/m1WonQbLJqQQk4mQLQ2cbpXYwwA6oHyzclYhabqkMwp9?=
 =?us-ascii?Q?nj6YdGcSBfpxm39K5bXbivBogY0ImfUuirmneXlWzSBwXr14rA6p0BoobN99?=
 =?us-ascii?Q?ODBx9BomTrI33ft7p7UmMiY0OduCEXPxYOMqjWLqqKt+SThZWZvUr6phpnc2?=
 =?us-ascii?Q?1wY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3728
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b274dda-83c1-4092-7a72-08d92fc3eddf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zC8djnkChjvGueQP+5yNARe6+ejdsMS/eLvX7qZ2MlbnJ+i4xKINiIllGpuwohiUCJqMAL4rKABEPL3jPH1TeueHyx8TaXXjwgY56RSheCVWEIgw8FmiVMpQ0l4ZyFa3gBewiUpXi3ntLdvZju/MnoNLPmHxhSVeVJQvCnIYdDKKJsMrn5/kA9HJg70hHLGYHB0HfRL6fI4O2frbTnGlW5mnoFBgYqENODXjeOpy2WOJOdWfSeqjyZ3Ube9Pqz8w2HWModq3SuETb3Cdz5YxxBUIk3Dvetf2o3h1pGqOiWtlXO7WdzkswUbQ5QhSoFtVsf5e2aMjix1NmlFp53XpA0gA0nOVIAf0vWQNyaFubECZNvjbnngd9GDgY3fMmh82aeBC4tVS1rnnYekGGRbgczJI60j3KRuD8eX92abrsefTyKba26jbW8M6FhPPqO5SW0dRZlCnb2Q8SatThOvG8ewI2gdYiMD8czVN/lIEgUOs5cFpq0jXtvJn49V57j0D8NZKnTWj26uGARwZWELYlQ0YYA01v6nXK0BNK+b+HsCZSu2jxhsoPjOo5adeyrVuRy+lDNddOBHN/KQg+vKcQi5fPed19a1a/ed2KkQi6BfRIWeKCw+awdie4nYZwOyDhEK6SEvJxVErFefdFgKUQLIW61F/9CATxhmzbk2hjNw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(70586007)(70206006)(478600001)(356005)(6506007)(7696005)(86362001)(336012)(8676002)(83380400001)(53546011)(186003)(81166007)(82740400003)(5660300002)(26005)(47076005)(6636002)(2906002)(4326008)(9686003)(316002)(8936002)(55016002)(54906003)(36860700001)(52536014)(82310400003)(110136005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 06:08:14.9032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf0182-e710-4a9c-25f1-08d92fc3f66d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7024

Hi julien

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: Wednesday, June 9, 2021 6:47 PM
> To: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien.grall.oss@gmail.com>; Penny Zheng <Penny.Zheng@arm.com>; xen-
> devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; nd
> <nd@arm.com>
> Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
>=20
>=20
>=20
> On 09/06/2021 10:56, Bertrand Marquis wrote:
> > Hi All,
>=20
> Hi,
>=20
> >> On 7 Jun 2021, at 19:09, Julien Grall <julien@xen.org
> >> <mailto:julien@xen.org>> wrote:
> >> Feel free to propose one. I suggested to use /reserved-memory because
> >> this is the approach that makes the most sense to me (see my reply abo=
ve).
> >>
> >> TBH, even after your explanation, I am still a bit puzzled into why
> >> /reserved-memory cannot be leveraged to exclude domain region from
> >> the hypervisor allocator.
> >
> > I really tend to think that the original solution from Penny is for
> > now the easiest and simplest to document.
>=20
> I can live with Penny's solution so long we don't duplicate the parsing a=
nd we
> don't create new datastructure in Xen for the new type of reserved memory=
.
> However...
>=20

Just to confirm what I understand here, you are not only worrying about the=
 duplication code imported in
dt_unreserved_regions, but also must introducing another path in func early=
_scan_node to parse my first implementation
"xen,static-mem =3D <...>", right?

On duplication code part, I could think of a way to extract common codes to=
 fix, but for introducing another new path to parse,
FWIT, it is inevitable if not re-using reserved-memory. ;/

> > In the long term, using directly memory and giving in it the address
> > range directly is the most natural solution but that would clash with
> > the current usage for it.
>=20
> ... we are already going to have quite some churn to support the system
> device-tree. So I don't want yet another binding to be invented in a few
> months time.
>=20
> IOW, the new binding should be a long term solution rather than a tempora=
ry
> one to fill the gap until we agree on what you call "domain v2".
>=20
> Cheers,
>=20
> --

Cheers

Penny
> Julien Grall

