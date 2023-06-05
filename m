Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A7A7221FE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 11:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543584.848677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66P3-0001EV-Ai; Mon, 05 Jun 2023 09:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543584.848677; Mon, 05 Jun 2023 09:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66P3-0001Bs-7q; Mon, 05 Jun 2023 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 543584;
 Mon, 05 Jun 2023 09:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1ki=BZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q66P1-0001Bi-Uf
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 09:21:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f21ccb-0382-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 11:21:25 +0200 (CEST)
Received: from AM5PR0601CA0032.eurprd06.prod.outlook.com
 (2603:10a6:203:68::18) by AS8PR08MB7371.eurprd08.prod.outlook.com
 (2603:10a6:20b:447::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 09:21:22 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::c3) by AM5PR0601CA0032.outlook.office365.com
 (2603:10a6:203:68::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31 via Frontend
 Transport; Mon, 5 Jun 2023 09:21:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13 via Frontend Transport; Mon, 5 Jun 2023 09:21:21 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Mon, 05 Jun 2023 09:21:21 +0000
Received: from 016deb3e8a28.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F336F58-C42C-4868-B730-157AB0D45FD6.1; 
 Mon, 05 Jun 2023 09:21:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 016deb3e8a28.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jun 2023 09:21:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8263.eurprd08.prod.outlook.com (2603:10a6:20b:552::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 09:21:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:21:08 +0000
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
X-Inumbo-ID: 57f21ccb-0382-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3mZamDBq2EinkxHRl5kFuPQoPN7Rn+XdV8haiv4SHk=;
 b=Vuosrif0uJhnBfKIzm15fBDcryg52o7Pbd4xU9OyubdOT6U+qa+cNikH6ufFbW7C9Yb69G2KtwYPjrl/UHxsy0r57NwPnEbW0GRnQTumwKAjg4QvV4OvVZn3jKZKub/7DlJ04JrT8iPdK+DfxPGxuOq2ZSoxv3WJb98/sCSG+uU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd29677a477b4dc5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6J9qFIyd4YILV9RnOrgpB4K/sQ7yJdsjxiqJxC+sIkFAZTFFVLjKoFn3XUPQgAwss86lBhIRtgj1ned/mVoQvCOifELzBQ9NU4YQkgE1or2Qm1f6G3JaW+P8Makg/Qqkv5+OCWsnXliKrB9F+iDaRlr2dNMhTtbUEu0hj+EfNFZ/2WGOW7/+xWuFTEbT8yOPHWSmYu/uKY3DbIRv9rsc/FgVRCfuUrfsN/cp1xqwkCptgBhldY8m/oyfbnxvgCXh5W4qHD4eqc77sW2kWjnXtFIM8ZDEJvlfkmL9wc3eaP7Tnj1vJkj3lgOo3xQClaKzeh0xug1y1YVK6ipHrNPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3mZamDBq2EinkxHRl5kFuPQoPN7Rn+XdV8haiv4SHk=;
 b=j3ht5zInzzfC7gnVTQPEDP44RYBYrpVcjj0L0u4Qiwws+XWqiws1/vhGdhcJzrZhM1ZEXXt8yPQRE4VJco1brDpLAGqSvkuHD9VTGlraksFRn9TYWlsjcRB6O98X0r9tLYDyIxgSLPCzLuZehr5ZkugMxD/oJb3ccGPkcAGVTaXgdwCNst5qFq0Ny42eO+FvY2aTd9Z4NrKp5MVdmo0ktudPBwQ1kdybu0mGE1y8K27zaIGfWr6eJwNe4+m6DGrZZ3G0TGGtvY/Vplph0RHtat7yW7hu4MXZioNQVnQIokKRA9z+ELOX6ha6XFbexYO8/4xk0WHCakWnt50pbZrMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3mZamDBq2EinkxHRl5kFuPQoPN7Rn+XdV8haiv4SHk=;
 b=Vuosrif0uJhnBfKIzm15fBDcryg52o7Pbd4xU9OyubdOT6U+qa+cNikH6ufFbW7C9Yb69G2KtwYPjrl/UHxsy0r57NwPnEbW0GRnQTumwKAjg4QvV4OvVZn3jKZKub/7DlJ04JrT8iPdK+DfxPGxuOq2ZSoxv3WJb98/sCSG+uU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 0/3] diff-report.py tool
Thread-Topic: [PATCH v3 0/3] diff-report.py tool
Thread-Index: AQHZjuO65byNYARZOk+RVM/vmas3Nq98AEqA
Date: Mon, 5 Jun 2023 09:21:08 +0000
Message-ID: <26F337DF-8A67-47E0-B1F5-7EF7B562957C@arm.com>
References: <20230525083401.3838462-1-luca.fancellu@arm.com>
In-Reply-To: <20230525083401.3838462-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8263:EE_|AM7EUR03FT058:EE_|AS8PR08MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 41553b05-24cd-4ddf-78d4-08db65a63a30
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gBdpjkvYOnp12se82z8Lek7SNrfA+l3OMbTI4sFfKDbCCfAX7ALClbrUAzN4hNzBmAxkt92CINSzndGIspbuzPhKHNg5aWHKzDPHPyBPhU3cJdDAeDL+E6/Eblx6xiI5UuTL6O3MguZIe+zCB7x/AiP8qMbXjKQ/s5oP1Ss6NGkxLjt0H7/F+CJA0CWZ9AV+xVlJWufBWF5tMjUv/4SPdIWwUQZIl1GGG/iSigCkYksGxB314vUtm8TwLD357Kd/lYlD5XbInrP50hOU/lTAyo0YfLgcTIYFpV8Mx48f3u/ggIcIAbAWlIq9O6xC/hffXBB9M6I1zim5nTHICDNW/TUPERg9Sw64rNqCCrm4xYPtHQv8O9aP15dvMi/Kzj5Awz5j3yGA460Al6kFPiD5zJuHj6UQF/2RUaXCnqLb6IpBrCpM6k4icbtMiNkdyRAT3jw53E+RyB2de1jQHZpz2nfuiEzymBqbl6dnOP0e7Y9ynq98bvrsBCaL+VrkGpy8xNIV8lZjmLldoGq1PMDpYMxRnqhP+ipyK/7m08Nf0Zgm/y7/zGkIcLKte38EH5kUZvQ6cqOHQQHTR8trFHgXhSCRKTYKzMhmA3FmmwE+jJst0QRfKbz3EH54hs5g67Ms7VIUqOIgwKXUYMMIhEFBUA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(26005)(6512007)(53546011)(6506007)(38100700002)(83380400001)(41300700001)(6486002)(186003)(966005)(71200400001)(66899021)(478600001)(54906003)(4326008)(122000001)(66446008)(66476007)(66556008)(64756008)(6916009)(91956017)(76116006)(316002)(66946007)(8936002)(8676002)(5660300002)(2906002)(86362001)(33656002)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92D4EFCF8D862489AA49EA3DB8D79C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8263
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb7842b1-9b98-4896-734e-08db65a6320f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PWzAO05SjlrOM2Smr59UvEs2104kTNT8O6b/cE42vvemaIc8Q0Bic+8w/dlTSdw6WNHwUDu65GMRhT7mtO3k+lOD0pwRVDWf7uZ2NaQ0vDFCUTXv7DA7ZeMUIsrQCngvX7xbCXBmGe+z4ecCM6oIUPstYWJ+SX01DMA2uFIn9c2UEg0wG44DXsK0bASk2m5KCRV2HN+/MRhl0QyInGTZOnwJwesh+a6cYPXUC5Q0q+h1sjUIjBsTkwbY2z7Mms6EO+M2Bfn9v4CeyHsnZ+h5iFKHLxi//bmnS2jCMso/uvsf3ekBxrZIejrnLefQAC1Asu+TF8MLFRuKqyTBPI8cADYX9B9UD32+XRu91YF2LOHCaS6buOlbr00k15icJWdqFdvl8bTyxhsG+YyXwmmInVuVDX7xIURxJKPGnX4yzFizDjcyAiSg127AKw9T+fHjPu4fOgjAv+xlY84KtHWgFWWsBuUaNiI5TbKtI/TQBvSA33hp8fEK81NaMwlumTzsaXgKb/ApVYFkenfMdGJHNbR/LM0zRIJdqPvhYjAP2kb2gkCFkqUfGimwkIw6TIPN3zt2R2vEuoGN3sKv4ZxiVDr6OUibVT3zD4Lu9RDck9t5bunfaxld0oTj5/qqy7mDeWGGy02H5agD3wvPBkL6bJgw8Oz5kk7jrB44izV3UuMOnD94ohJbFIiYn6FucFRuZR0wMqLw2JCOrLGaQqo24j4m+/iYaM5ZU4t9yHhqfhI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(966005)(336012)(82740400003)(54906003)(40480700001)(33656002)(478600001)(8676002)(8936002)(41300700001)(316002)(70206006)(70586007)(356005)(81166007)(5660300002)(6916009)(86362001)(40460700003)(4326008)(6486002)(36756003)(2906002)(36860700001)(82310400005)(6512007)(186003)(6506007)(26005)(53546011)(66899021)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 09:21:21.7507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41553b05-24cd-4ddf-78d4-08db65a63a30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7371

DQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDA5OjMzLCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gVGhp
cyBzZXJpZSBpcyBkZXBlbmRlbnQgb24gdGhpcyBwYXRjaCwgaW4gY2FzZSBjcHBjaGVjayByZXBv
cnQgYXJlIGdlbmVyYXRlZA0KPiB1c2luZyB4ZW4tYW5hbHlzaXMucHkgdGhhdCBjYWxscyB0aGUg
bWFrZWZpbGUgd2l0aCBpbi10cmVlIGJ1aWxkLCBiZWNhdXNlDQo+IHRoaXMgdG9vbCAoaW4gcGFy
dGljdWxhciB0aGUgcGF0Y2hpbmcgZmVhdHVyZSkgbmVlZHMgdGhlIHBhdGggZnJvbSB0aGUNCj4g
cmVwb3NpdG9yeSBpbnN0ZWFkIG9mIHRoZSBwYXRoIGZyb20gL3hlbi94ZW46DQo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMzA1MTkwOTMw
MTkuMjEzMTg5Ni00LWx1Y2EuZmFuY2VsbHVAYXJtLmNvbS8NCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gDQo+IE5vdyB0aGF0IHdlIGhhdmUgYSB0b29sICh4ZW4tYW5hbHlzaXMucHkpIHRo
YXQgd3JhcHMgY3BwY2hlY2sgdG8gZ2VuZXJhdGVzDQo+IHJlcG9ydHMsIHdlIGhhdmUgYSBnZW5l
cmljIG92ZXJ2aWV3IG9mIGhvdyBtYW55IHN0YXRpYyBhbmFseXNpcyBpc3N1ZXMgYW5kIG5vbg0K
PiBjb21wbGlhbmNlcyB0byBNSVNSQSBDIHdlIGhhdmUgZm9yIGEgY2VydGFpbiByZXZpc2lvbiBv
ZiB0aGUgY29kZWJhc2UuDQo+IA0KPiBUaGlzIGlzIGdyZWF0IGFuZCBldmVudHVhbGx5IHRoZSB3
b3JrIHRvIGJlIGRvbmUgc2hvdWxkIGJlIGp1c3QgaGF2aW5nIGxlc3MgYW5kDQo+IGxlc3MgZmlu
ZGluZ3MgaW4gdGhlIHJlcG9ydCB1bnRpbCB3ZSByZWFjaCB6ZXJvLg0KPiANCj4gVGhpcyBpcyBq
dXN0IGFuIGlkZWFsIHRyZW5kLCBiZWNhdXNlIGluIHByYWN0aWNlIHdlIG1pZ2h0IGhhdmUgaXNz
dWVzIHRoYXQNCj4gY29tZXMgZnJvbSBleGlzdGluZyBjb2RlIChtYWNybyBmb3IgZXhhbXBsZSkg
dGhhdCBhcmUgbm90IGdvaW5nIHRvIGJlIGZpeGVkDQo+IHNvb24gZm9yIGFueSByZWFzb24sIGJ1
dCB3ZSB3b3VsZCBsaWtlIHRvIGNoZWNrIGFuZCBzZWUgaG93IG1hbnkgaXNzdWVzIGFyZQ0KPiBp
bnRyb2R1Y2VkIGJ5IHRoZSBjb21taXRzIGFkZGVkIChpZGVhbGx5IHplcm8sIGJ1dCBpZiBhbnkg
aXMgYWRkZWQgYW5kIHRoZSBmYXVsdA0KPiByZXNpZGVzIG91dHNpZGUgdGhlIGNoYW5nZWQgY29k
ZSwgbWFpbnRhaW5lcnMgbWlnaHQgZGVjaWRlIHRvIGluY2x1ZGUgaXQNCj4gYW55d2F5KS4NCj4g
DQo+IFNvIHRoZSBpZGVhIGlzIHRvIGNoZWNrIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHJl
cG9ydHMgb2YgdGhlIGNvZGViYXNlOiBvbmUNCj4gY2FsbGVkICJiYXNlbGluZSIgd2hpY2ggaXMg
YmFzaWNhbGx5IHRoZSBjdXJyZW50IGNvZGViYXNlLCB0aGUgb3RoZXIgb25lIGNhbGxlZA0KPiAi
bmV3IHJlcG9ydCIgdGhhdCBpcyB0aGUgY29kZWJhc2UgYWZ0ZXIgdGhlIGNoYW5nZXMuDQo+IFRv
IGNoZWNrIGlmIGFueSBuZXcgZmluZGluZyBpcyBhZGRlZCwgd2UgbmVlZCB0byBoYXZlIGEgbG9v
ayBvbiBldmVyeSBmaW5kaW5nIGluDQo+IHRoZSAibmV3IHJlcG9ydCIgdGhhdCBpcyBub3QgbGlz
dGVkIGluIHRoZSAiYmFzZWxpbmUiLg0KPiANCj4gSXQgc2VlbXMgdmVyeSBzaW1wbGUsIGJ1dCB3
aGF0IGNhbiBoYXBwZW4gdG8gZXhpc3RpbmcgZmluZGluZ3MgaW4gdGhlIGNvZGUgYWZ0ZXINCj4g
YSBjb21taXQgaXMgYXBwbGllZD8NCj4gQmFzaWNhbGx5IGV4aXN0aW5nIGZpbmRpbmdzIGNhbiBi
ZSBzaGlmdGVkIGluIHBvc2l0aW9uIGR1ZSB0byBjaGFuZ2VzIHRvDQo+IHVucmVsYXRlZCBsaW5l
cywgb3IgdGhleSBjYW4gYmUgYWxzbyBkZWxldGVkIG9yIGZpeGVkIGZvciBjaGFuZ2VzIGludm9s
dmluZyB0aGUNCj4gZmluZGluZ3MgbGluZSAoTWljaGFsIHdhcyB0aGUgZmlyc3Qgb25lIHRvIHBv
aW50IHRoYXQgb3V0KS4NCj4gDQo+IFNvIGNvbXBhcmluZyB0aGUgdHdvIHJlcG9ydCBub3cgc2Vl
bXMgcXVpdGUgZGlmZmljdWx0LCBiZWNhdXNlIGlmIHdlIGNvbXBhcmUNCj4gdGhlbSB3ZSB3aWxs
IGhhdmUgYWxsIHRoZSBuZXcgZmluZGluZ3MgcGx1cyBhbGwgdGhlIGZpbmRpbmdzIHRoYXQgY2hh
bmdlZA0KPiBwb3NpdGlvbiBkdWUgdG8gdGhlIGNoYW5nZXMgYXBwbGllZC4NCj4gDQo+IFRvIG92
ZXJjb21lIHRoaXMsIHRoZSBkaWZmLXRvb2wucHkgaXMgY3JlYXRlZCBhbmQgaXQgYWxsb3dzIHRv
ICJwYXRjaCIgdGhlDQo+ICJiYXNlbGluZSIgcmVwb3J0LCBsb29raW5nIGludG8gdGhlIGNoYW5n
ZXMgYXBwbGllZCB0byB0aGUgYmFzZWxpbmUgY29kZWJhc2UsDQo+IGRlc2NyaWJlZCBieSBnaXQg
ZGlmZi4NCj4gDQo+IFRoaXMgc2VyaWUgaXMgb3JnYW5pc2VkIGluIHR3byBwYXRjaCwgSSd2ZSB0
cmllZCB0byBzcGxpdCB0aGUgYW1vdW50IG9mIGNvZGUgYW5kDQo+IHRvIGxlYXZlIGEgbWVhbmlu
Zywgc28gaW4gdGhlIGZpcnN0IHBhdGNoIHlvdSBoYXZlIGV2ZXJ5dGhpbmcgeW91IG5lZWQgdG8N
Cj4gaW1wb3J0IGNwcGNoZWNrIHJlcG9ydHMgYW5kIGRvIGEgInJhdyIgZGlmZiBiZXR3ZWVuIHJl
cG9ydHMsIHRoaXMgZ2l2ZXMgeW91DQo+IGFuIGhpbnQgYWJvdXQgbmV3IGZpbmRpbmdzICsgb2xk
IGZpbmRpbmdzIHRoYXQgaGFzIGNoYW5nZWQgcGxhY2UuDQo+IA0KPiBUaGUgc2Vjb25kIHBhdGNo
IGlzIGFkZGluZyB0aGUgInBhdGNoaW5nIiBzeXN0ZW0sIGhhdmluZyBhIGNsYXNzIHRoYXQgcGFy
c2VzDQo+IHRoZSBnaXQgZGlmZiBvdXRwdXQgYW5kIGxhdGVyICJwYXRjaGluZyIgdGhlIGJhc2Vs
aW5lIGJlZm9yZSBkb2luZyB0aGUNCj4gY29tcGFyaXNvbi4gVGhpcyBsYXN0IG9wdGlvbiBpcyBh
Y3RpdmF0ZWQgb25seSB3aGVuIHBhc3NpbmcgdGhlIGdpdCBkaWZmIGNoYW5nZXMNCj4gdG8gdGhl
IHRvb2wsIGJ1dCBldmVyeXRoaW5nIGlzIGRlc2NyaWJlZCAoSSBob3BlKSBpbiB0aGUgaGVscC4N
Cj4gDQo+IFNvbWUgY29uc2lkZXJhdGlvbiBuZWVkcyB0byBiZSBtYWRlLCB0aGlzIHRvb2wgY2Fu
IHRyYW5zbGF0ZSBpbiBjb29yZGluYXRlcw0KPiAoZmlsZSwgbGluZSkgdGhlIGZpbmRpbmdzIGZy
b20gdGhlICJiYXNlbGluZSIgdG8gdGhlICJuZXcgcmVwb3J0IiB1c2luZyB0aGUgZ2l0DQo+IGRp
ZmYgb3V0cHV0IGFzLCBsZXQgbWUgc2F5LCBhIHRyYW5zbGF0aW9uIG1hdHJpeC4NCj4gVGhpcyBk
b2Vzbid0IG1lYW4gaXQgY2FuIHVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2YgdGhlIGZpbmRpbmdz
IGFuZCByZWNvZ25pc2UNCj4gdGhlbSBpbiB0aGUgbmV3IGNvZGViYXNlLCBzbyBmb3IgZXhhbXBs
ZSwgYSBmaW5kaW5nIHJlbGF0ZWQgdG8gYSBsaW5lIHRoYXQgaXMNCj4gbW92ZWQgdG8gYW5vdGhl
ciBwYXJ0IG9mIHRoZSBmaWxlIHdvbid0IGJlIHJlY29nbmlzZWQgYXMgIm9sZCBmaW5kaW5nIiBh
bmQgd2lsbA0KPiBiZSBqdXN0IHJlbW92ZWQgZnJvbSB0aGUgImJhc2VsaW5lIHBhdGNoZWQgcmVw
b3J0IiwgaG93ZXZlciB3ZSB3aWxsIGZpbmQgaXQNCj4gaW4gdGhlIG5ldyByZXBvcnQgdW5sZXNz
IGl0IGNvbnRhaW5zIGEgZml4IGZvciB0aGUgcmVwb3J0ZWQgaXNzdWUuDQo+IA0KPiBUaGlzIG1l
YW5zIHRoYXQgdGhlIHRvb2wgaXMgbm90IHJlYWxseSBzdWl0ZWQgdG8gYmUgYSBnYXRla2VlcGVy
IGZvciB0aGUgbWVyZ2UNCj4gYWN0aW9uLCBpdCBpcyBtb3JlIHN1aXRhYmxlIHRvIGhlbHAgdGhl
IG1haW50YWluZXIgdG8gdW5kZXJzdGFuZCB3aGVuIGEgY2hhbmdlDQo+IGlzIGludHJvZHVjaW5n
IG5ldyBpc3N1ZXMgd2l0aG91dCBoYXZpbmcgdG8gY2hlY2sgYW5kIGNvbXBhcmUgbWFudWFsbHkg
dHdvDQo+IHJlcG9ydHMgb2YgKG5vd2FkYXlzKSBodW5kcmVkcyBvZiBmaW5kaW5nLg0KPiBFdmVu
dHVhbGx5IHdlIGNvdWxkIHJ1biBpdCBpbiB0aGUgQ0kgYW5kIG1ha2UgdGhlIENJIHJlcGx5IHRv
IHRoZSBwYXRjaHdvcmsNCj4gdGhyZWFkIHdpdGggaXRzIG91dHB1dCENCj4gDQo+IFRoZSB0b29s
IGhhcyBhbHNvIGEgZGVidWcgYXJndW1lbnQgdGhhdCB3aGVuIGFwcGxpZWQsIGdlbmVyYXRlcyBl
eHRyYSBmaWxlcw0KPiB0aGF0IGNhbiBiZSBjaGVja2VkIGFnYWluc3QgdGhlIG9yaWdpbmFsIGZp
bGVzLCBmb3IgZXhhbXBsZSB0aGUgcmVwb3J0cyBhcmUNCj4gaW1wb3J0ZWQgaW4gdGhlIHRvb2ws
IGFuZCBhZnRlcndhcmRzIHRoZSBkZWJ1ZyBjb2RlIHdpbGwgZ2VuZXJhdGUgdGhlbSBiYWNrIGZy
b20NCj4gdGhlIGltcG9ydGVkIGRhdGEgYW5kIHRoZXkgc2hvdWxkIGJlIHRoZSBzYW1lIChpZiBl
dmVyeXRoaW5nIHdvcmtzKS4NCj4gQW5vdGhlciBkZWJ1ZyBjaGVjayBpcyB0byBleHBvcnQgdGhl
IHJlcHJlc2VudGF0aW9uIG9mIHRoZSBwYXJzZWQgZ2l0IGRpZmYNCj4gb3V0cHV0LCBzbyB0aGF0
IHRoZSBkZXZlbG9wZXIgY2FuIGNoZWNrIGhvdyBhbmQgaWYgdGhlIHBhcnNlciBpbnRlcnByZXRl
ZA0KPiBjb3JyZWN0bHkgdGhlIGRhdGEuDQo+IA0KPiBGdXR1cmUgd29ya3MgZm9yIHRoaXMgdG9v
bCBtaWdodCBiZSB0byBwYXJzZSBhbHNvIENvdmVyaXR5IHJlcG9ydHMgYW5kDQo+IGV2ZW50dWFs
bHkgKGRvbid0IGtub3cgaWYgaXQgaXMgcG9zc2libGUpIGFsc28gZWNsYWlyIHRleHQgcmVwb3J0
Lg0KPiANCj4gTHVjYSBGYW5jZWxsdSAoMyk6DQo+ICB4ZW4vbWlzcmE6IGFkZCBkaWZmLXJlcG9y
dC5weSB0b29sDQo+ICB4ZW4vbWlzcmE6IGRpZmYtcmVwb3J0LnB5OiBhZGQgcmVwb3J0IHBhdGNo
aW5nIGZlYXR1cmUNCj4gIG1haW50YWluZXJzOiBBZGQgWGVuIE1JU1JBIEFuYWx5c2lzIFRvb2xz
IHNlY3Rpb24NCj4gDQo+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxMCArDQo+IHhlbi9zY3JpcHRzL2RpZmYtcmVwb3J0LnB5ICAgICAgICAgICAgICAg
ICAgICB8IDEzMCArKysrKysrKysrDQo+IC4uLi94ZW5fYW5hbHlzaXMvZGlmZl90b29sL19faW5p
dF9fLnB5ICAgICAgICB8ICAgMA0KPiAuLi4veGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9jcHBjaGVj
a19yZXBvcnQucHkgfCAgNDQgKysrKw0KPiB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZGlmZl90
b29sL2RlYnVnLnB5ICAgfCAgNjEgKysrKysNCj4geGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2Rp
ZmZfdG9vbC9yZXBvcnQucHkgIHwgMTg3ICsrKysrKysrKysrKysrDQo+IC4uLi9kaWZmX3Rvb2wv
dW5pZmllZF9mb3JtYXRfcGFyc2VyLnB5ICAgICAgICB8IDIzMiArKysrKysrKysrKysrKysrKysN
Cj4gNyBmaWxlcyBjaGFuZ2VkLCA2NjQgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA3
NTUgeGVuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9z
Y3JpcHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvX19pbml0X18ucHkNCj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvY3BwY2hlY2tfcmVwb3J0
LnB5DQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZGlmZl90
b29sL2RlYnVnLnB5DQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlz
aXMvZGlmZl90b29sL3JlcG9ydC5weQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3NjcmlwdHMv
eGVuX2FuYWx5c2lzL2RpZmZfdG9vbC91bmlmaWVkX2Zvcm1hdF9wYXJzZXIucHkNCj4gDQo+IC0t
IA0KPiAyLjM0LjENCj4gDQo+IA0KDQpIaSBBbGwsDQoNCklzIGl0IHBvc3NpYmxlIHRvIGNvbW1p
dCB0aGlzIHNlcmllPyBJIHRoaW5rIGl0IGhhcyBULWJ5IGFuZCBBLWJ5IFN0ZWZhbm8gZm9yIGFs
bCB0aGUgcGF0Y2hlcw0KYW5kIEkgZGlkbuKAmXQgcmVjZWl2ZSBzbyBmYXIgY29tbWVudHMgYWdh
aW5zdCBpdA0KDQpUaGFuayB5b3UsIHBsZWFzZSByZWFkIHRoaXMgbWFpbCBhcyBhIGdlbnRsZSBw
aW5nIDopDQoNCg0K

