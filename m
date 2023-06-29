Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E97428E3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556890.869744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEt0a-0003ph-KW; Thu, 29 Jun 2023 14:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556890.869744; Thu, 29 Jun 2023 14:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEt0a-0003me-HU; Thu, 29 Jun 2023 14:52:32 +0000
Received: by outflank-mailman (input) for mailman id 556890;
 Thu, 29 Jun 2023 14:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOj0=CR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qEt0Z-0003mU-8z
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:52:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9128a7a8-168c-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 16:52:28 +0200 (CEST)
Received: from DB3PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:8::29) by
 DBBPR08MB5914.eurprd08.prod.outlook.com (2603:10a6:10:200::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Thu, 29 Jun 2023 14:52:26 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::bd) by DB3PR08CA0016.outlook.office365.com
 (2603:10a6:8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 14:52:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 14:52:25 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Thu, 29 Jun 2023 14:52:25 +0000
Received: from 291c09c64051.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72F8A247-8D27-44E8-A444-52653B2642FE.1; 
 Thu, 29 Jun 2023 14:52:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 291c09c64051.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 14:52:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9634.eurprd08.prod.outlook.com (2603:10a6:10:461::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 14:52:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:52:11 +0000
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
X-Inumbo-ID: 9128a7a8-168c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLxL1mbR0RAOmf81uH2XVRc6X6tf+0MlnbuNrPz7d7s=;
 b=1STTCpbiZFWTrqR6llwko+Vce8RuGjWCYwvZVBkFyXqTCJ4T5hY76yb96cmOjbSKbPoaN3TXqX/A2PpI5NaJ5nim8wUIi6xOdJSXJzFI44IDF2igiVw5YjjgRE6t1wD7B0Cc1tYOr6Ssrep7A4FiY1tcV1lpUTFOp8xMrJ6MpxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97264ad89e80c58d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwP4i/nez3n/wzd3MA9h17rAJnSgy109locmgNI81SS1cPlwZYWEQzTJbP2/9l645fji7N5TUtMG3kKs+/fpbJRa9GuZWxA6XHcf1DAYnDRzc18nkYuCL4r9dtdpbzAFcxL9V/JsLcZ+DxHsDZCaZqGim/FJZ1aBqukSmqXg1UGrrj8hcviH9rRLsjH87gM5eksfNy02d3zqnvjDgqVsjRsLMTiQxYAvsuwfNxs3QQuG8YRmznDsJLr5koCqh8XNpheYoDw7fN4TqZJDe0NnOUyvW9c/Xp1zNzZvPrsSBBPNsJGcEUNukkqLS98vdZisW3suIDXyzXUbncuU3cDrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLxL1mbR0RAOmf81uH2XVRc6X6tf+0MlnbuNrPz7d7s=;
 b=XFJzLzxQmuSytpTJ1zzfk67ZnC6v9hDBuQ9AhAgaImQ1ap689c55nLtqGE3HDO46kERV9je5kp3m6F2DMuhf0xLK/5Qd322pu+DE3jmpwr2liRb9MwBSThzcF0Q6ywgoWPBJtea1mC2H02cYTq0+9/n5p/+z+ZcbVv4kD0qoWLe7NEjnK5PHefUpouslBCtBccnLnvDAUPD07ql4swHDw/tF3UUrbcBKoswXYkYyvR5fZwH5i7RSFzx/IjK8mENHuD6rP1BgqULEokP1CS+FOl6WkiIA01/z0JHQUnVSFdG3K0w9MjVAe8+5R8Lk7vRPk0Ged01qOiuRNG/45G0yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLxL1mbR0RAOmf81uH2XVRc6X6tf+0MlnbuNrPz7d7s=;
 b=1STTCpbiZFWTrqR6llwko+Vce8RuGjWCYwvZVBkFyXqTCJ4T5hY76yb96cmOjbSKbPoaN3TXqX/A2PpI5NaJ5nim8wUIi6xOdJSXJzFI44IDF2igiVw5YjjgRE6t1wD7B0Cc1tYOr6Ssrep7A4FiY1tcV1lpUTFOp8xMrJ6MpxU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Thread-Topic: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Thread-Index: AQHZqnGK1UuA6ay8JkaojZwzBrWkkK+h3aEA
Date: Thu, 29 Jun 2023 14:52:10 +0000
Message-ID: <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9634:EE_|DBAEUR03FT031:EE_|DBBPR08MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae492cf-9468-4d65-cc06-08db78b073f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yXszV+KXyUITyLLUnPLINy/ynqKyYsJOb0vaJEXNn2wcmjPvcDS3h7UGqU/kQy4+FPyKnPsRA7Iznql8ED/ovT0omE/QsUfdSBmiBF9G+lrBbeoO1eODRxJzKTyGMscN5mogHWXck3H7QqiU0kCk6lv+L3Nz4X13Dpnaq0sjaniQ1XlJj/ALeIPcoCbwsJlpMlIZ1Q9kIaxl5HUkKjW3pj5Bp+1D9VpxKiz3Drp+AidX42ZYBDOfjbk96fOe631FbDRrTekB5joepTTgdvv2ZQUnIyW4k44em3Y2fhhk0LjCbHVzSQJz62n/QvC4+lx9Uya2jGJeYPJjFUeGFxAZZ+mQT3cqAI3q3PqVyQ7Ar6qmB+/xTC/H3Pk9+mOsFr4c+dK8+IIzb3Im66qYF8bOHtTP9ibSY5RzeCUt3EyA7BZeW9R+BZozpLfNNtmgMsBsyvGCQ1T1hzCKucAgajOg323zNiCKso7xFvpVlpQJxPi/3TnFt4+w/FCZtkv5YDWaiIy7wc/2GTrtZDLCjakJd+iaTkB8yB3qPy5EPgMwkHo3Vz1rCWl76X3N3XUbOhe+/Y/pddICOj0LRYEi2C7m6cBLjGK1+CJv+J0KD+dHCCGzRMBz0eq9vMxC2Qnu7yS6PWk4w7dBHx65Y4g4q/cYJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(6916009)(2906002)(186003)(26005)(54906003)(38070700005)(316002)(86362001)(7416002)(36756003)(33656002)(8676002)(4326008)(6486002)(478600001)(122000001)(2616005)(38100700002)(71200400001)(8936002)(5660300002)(66476007)(91956017)(41300700001)(66946007)(66556008)(66446008)(83380400001)(64756008)(76116006)(6512007)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <33B04FF79BA2AF49A47F3322C3576A66@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8459de48-2d18-49a1-34ff-08db78b06b21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fe9GQfPQG1+JOwFf1NxKB22gnPlA4bQodWvR9xvYmHEpnbUK1uaPTZzTiHVFWUr/EepjzOU1NTZ8b4jr677F6DVQ3QddxRwKFRGeOwNful3VwIpvpdedsLYK/djxEerpkZGQJkxujE6JLoKWXLjLdnA7+Ycuo/PY3J4h/NCyKAZ7B+NFkdwprp0zC1Zt3Wo1l7bJXVPFyKJhsWLbHiNXP3XCxu9h3Q6SM+IaE84l7YEy5l/S3f86RMs18o48Qj6mFBhy4AKXo3tEYnSvfM6eqDD48Ryfdx3wpq4srs7qa/Oh6B/0UYVqaP35+dBKcTpyNvQnM/65QHJ2nbJ4Z+a8cdMFvRC7KMDhiMqcEOK/1P6p3Gi6YsWNm0WHEgRb4lJlX2iCXxC7/s+vUx0WULBZ1ObtPFCc/ukRGi3Q3wZASHSwTXj6JfsQziULIIzpNv/gJZxQOe/+8TzkGGvs9zMaYepEWNQoLQD8t0m4JUBKR6qIVTJpM96LR4vn7yr5lsl6bfgMNVUQwLpjo1AI3NH/DwUVTohaZCp3pcYGGEKXh/pvp7CLEBa8YAl5dgZXjicDgFIrBXh1Io7zhWbqA6kW4gI3z+GvW/eJfy8VqW4ZTXBukXCKP4FjB3XvH6ZprS/h7uV8IzlysPLITQovjQkVee5WSIBdwA+xmUjRY1xBMvCZUYx9p7+5WNMEAVPXJdJSQtAxoVSRdmbHqiw6JbE/kFzn/pISBypzwACGjBQJbJPM2PLd3ogC+bwpkJpSOBEC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(6862004)(8676002)(8936002)(5660300002)(36756003)(107886003)(54906003)(478600001)(6486002)(70586007)(70206006)(4326008)(316002)(6512007)(41300700001)(40460700003)(40480700001)(81166007)(356005)(47076005)(186003)(2616005)(6506007)(26005)(86362001)(336012)(83380400001)(82310400005)(36860700001)(53546011)(82740400003)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:52:25.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae492cf-9468-4d65-cc06-08db78b073f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5914

DQoNCj4gT24gMjkgSnVuIDIwMjMsIGF0IDExOjA2LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gSW4gdGhlIGZpbGUgYHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMnIHRoZXJlIGFyZSBhIGZldyBvY2N1cnJlbmNlcw0K
DQpoZXJlIHlvdSB1c2UgYSBkaWZmZXJlbnQgY2hhcmFjdGVyIHRvIGVuY2xvc2UgdGhlIGZpbGUg
cGF0aCAoYCB2cyDigJgpIG1heSBJIHN1Z2dlc3QgdG8NCnVzZSBvbmx5ICjigJgpPw0KDQo+IG9m
IG5lc3RlZCAnLy8nIGNoYXJhY3RlciBzZXF1ZW5jZXMgaW5zaWRlIEMtc3R5bGUgY29tbWVudCBi
bG9ja3MsIHdoaWNoIHZpb2xhdGUNCj4gUnVsZSAzLjEuDQo+IA0KPiBUaGUgcGF0Y2ggYWltcyB0
byByZXNvbHZlIHRob3NlIGJ5IHJlcGxhY2luZyB0aGUgbmVzdGVkIGNvbW1lbnRzIHdpdGgNCj4g
ZXF1aXZhbGVudCBjb25zdHJ1Y3RzIHRoYXQgZG8gbm90IHZpb2xhdGUgdGhlIHJ1bGUuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5j
b20+DQoNCllvdSBhcmUgbWlzc2luZyB0aGUg4oCcLS0t4oCcIGhlcmUsIG1lYW5pbmcgdGhhdCB0
aGUgbGluZXMgYmVsb3cgYXJlIHBhcnQgb2YgdGhlDQpjb21taXQgbWVzc2FnZSBhbmQgSeKAmW0g
c3VyZSB5b3UgZG9u4oCZdCB3YW50IHRoYXQuDQoNCkFsc28gaGVyZSwgbWF5IEkgc3VnZ2VzdCB0
byB1c2UgdGhpcyBjb21taXQgdGl0bGUgaW5zdGVhZD8NCuKAnHhlbi9hcm06IHNtbXV2MzogRml4
IHZpb2xhdGlvbnMgb2YgTUlTUkEgQzoyMDEyIFJ1bGUgMy4x4oCdDQoNCkFwYXJ0IGZyb20gdGhh
dCwgY2hhbmdlcyBsb29rcyBnb29kIHRvIG1lOg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxs
dSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpXaWxsIGJlIHRoZSBtYWludGFpbmVyL2NvbW1p
dHRlciB0byBkZWNpZGUgaWYgYWRkcmVzc2luZyB0aGVzZSBjb21tZW50LA0KaWYgYWNjZXB0ZWQs
IG9uIGNvbW1pdCBvciBpZiB5b3UgbmVlZCB0byBzZW5kIGFub3RoZXIgdmVyc2lvbiwgaW4gd2hp
Y2gNCmNhc2UgeW91IGNhbiByZXRhaW4gbXkgci1ieSBwcm92aWRlZCB0aGF0IG5vIG90aGVyIG1v
ZGlmaWNhdGlvbnMgYXJlIGRvbmUuDQoNCj4gQ2hhbmdlczoNCj4gLSBSZXNlbmRpbmcgdGhlIHBh
dGNoIHdpdGggdGhlIHJpZ2h0IG1haW50YWluZXJzIGluIENDLg0KPiBDaGFuZ2VzIGluIFYyOg0K
PiAtIFNwbGl0IHRoZSBwYXRjaCBpbnRvIGEgc2VyaWVzIGFuZCByZXdvcmtlZCB0aGUgZml4Lg0K
PiAtIEFwcGx5IHRoZSBmaXggdG8gdGhlIGFybTMyIGBmbHVzaHRsYi5oJyBmaWxlLCBmb3IgY29u
c2lzdGVuY3kNCj4gQ2hhbmdlcyBpbiBWMzoNCj4gLSBSZXZpc2VkIHRoZSBjb21tZW50IHRvIG1h
a2UgaXQgY2xlYXIgdGhlIGZ1bmN0aW9uIHRoZSBwYXJhbGxlbCBjb250cm9sDQo+IGZsb3dzIGlu
IHRoZSBjb21tZW50IGJlbG9uZyB0by4NCj4gLS0tDQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9zbW11LXYzLmMgfCA4ICsrKystLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11
LXYzLmMNCj4gaW5kZXggNzIwYWE2OWZmMi4uY2RiYjUwNTEzNCAxMDA2NDQNCj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+IEBAIC0xMDQ3LDEwICsxMDQ3LDEwIEBAIHN0YXRp
YyBpbnQgYXJtX3NtbXVfYXRjX2ludl9kb21haW4oc3RydWN0IGFybV9zbW11X2RvbWFpbiAqc21t
dV9kb21haW4sDQo+ICogYmVmb3JlIHdlIHJlYWQgJ25yX2F0c19tYXN0ZXJzJyBpbiBjYXNlIG9m
IGEgY29uY3VycmVudCBjYWxsIHRvDQo+ICogYXJtX3NtbXVfZW5hYmxlX2F0cygpOg0KPiAqDQo+
IC0gKiAvLyB1bm1hcCgpIC8vIGFybV9zbW11X2VuYWJsZV9hdHMoKQ0KPiAtICogVExCSStTWU5D
IGF0b21pY19pbmMoJm5yX2F0c19tYXN0ZXJzKTsNCj4gLSAqIHNtcF9tYigpOyBbLi4uXQ0KPiAt
ICogYXRvbWljX3JlYWQoJm5yX2F0c19tYXN0ZXJzKTsgcGNpX2VuYWJsZV9hdHMoKSAvLyB3cml0
ZWwoKQ0KPiArICogLS0tIHVubWFwKCkgLS0tICAgICAgICAgICAgICAgICAtLS0gYXJtX3NtbXVf
ZW5hYmxlX2F0cygpIC0tLQ0KPiArICogVExCSStTWU5DICAgICAgICAgICAgICAgICAgICAgICBh
dG9taWNfaW5jKCZucl9hdHNfbWFzdGVycyk7DQo+ICsgKiBzbXBfbWIoKTsgICAgICAgICAgICAg
ICAgICAgICAgIFsuLi5dDQo+ICsgKiBhdG9taWNfcmVhZCgmbnJfYXRzX21hc3RlcnMpOyAgIHBj
aV9lbmFibGVfYXRzKCkgKHNlZSB3cml0ZWwoKSkNCj4gKg0KPiAqIEVuc3VyZXMgdGhhdCB3ZSBh
bHdheXMgc2VlIHRoZSBpbmNyZW1lbnRlZCAnbnJfYXRzX21hc3RlcnMnIGNvdW50IGlmDQo+ICog
QVRTIHdhcyBlbmFibGVkIGF0IHRoZSBQQ0kgZGV2aWNlIGJlZm9yZSBjb21wbGV0aW9uIG9mIHRo
ZSBUTEJJLg0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCg0K

