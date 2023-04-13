Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D216E0E78
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520737.808663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwww-0004zp-L7; Thu, 13 Apr 2023 13:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520737.808663; Thu, 13 Apr 2023 13:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwww-0004wM-H3; Thu, 13 Apr 2023 13:25:18 +0000
Received: by outflank-mailman (input) for mailman id 520737;
 Thu, 13 Apr 2023 13:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HU9H=AE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pmwwv-0004vu-H0
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:25:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eb57539-d9fe-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:25:12 +0200 (CEST)
Received: from DB6PR0202CA0041.eurprd02.prod.outlook.com (2603:10a6:4:a5::27)
 by AM9PR08MB6035.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:25:10 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::ca) by DB6PR0202CA0041.outlook.office365.com
 (2603:10a6:4:a5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 13:25:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 13:25:08 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Thu, 13 Apr 2023 13:25:08 +0000
Received: from 29f2334368a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3E3F3F3-9300-48CD-8F68-80C65B1A15F0.1; 
 Thu, 13 Apr 2023 13:24:55 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29f2334368a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 13:24:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7691.eurprd08.prod.outlook.com (2603:10a6:10:3a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 13:24:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 13:24:50 +0000
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
X-Inumbo-ID: 9eb57539-d9fe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDlP7wrlTDsn66ctfF6VxZhhr/8wAWkk0cmlLOo5TMI=;
 b=6gjrkpCSXMvTAdYCkFA+OmOiKPfGrorpb2AiKmu1UC5tCI40Llx1sElxD7tCpzyHCvfEIJL14A6QIJNxC1SLOt4b37VIaDPOI+Zsq6dT1vcMSoN15W4JcQuADcnMh0/04DSRewl2S7y43/3CGQyYEczhocpEi62hoKCQvI1s9Z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43011ed1a40fe462
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrjZY6LJfv6PRH38ESwI4vnco6mFZp0yT6SYgYTI3luB0mizJxar5ARwViZKp+qe5Zu1ZXC0Fh3wEkoU4WJagq4JxbHeVaoCoJZWOKSwvhdszctlMHx9jZhEsoSxu6kFylXKioulH0gvOvMAd/tm9KD/xINN9jM5pIAC2WtqhRziWhcFYaIBTF/EaQNrCqh6hu5lBmdKXDrERTWUI4MVSsCIRg7y4hRpV73+CIIjP2cQ9rDwB98x1VLO90eG1oOag6DMyHNX0l3JngcUlnb48NSCPyUZdWuE6sXTl1BRj7E9+3xdFVoDFxCPHxH4kguGipZyUavG172FtL+EqmAFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDlP7wrlTDsn66ctfF6VxZhhr/8wAWkk0cmlLOo5TMI=;
 b=PhE3l549RZ1MKWMzN0ReFqWcZNk5upO0uXOTVVvrJXwlpIe0pzWY9GJUWcosS+NxgLG1vHZcAtvIDKUeyEOzNzThfTyBSTIxnjsumrUDW0uNWkTmZjq7hQ4JoikD45/xY2HmTlg+R1Zs6IIaj7IW+LBtrkFP1MZXYNbuKt3pCiqdyXeRodypeMs4Eu0CpR4KjhADMZxZoTwU3FgfaKrPdZA27oAkBFIsis+olZco4jWzGzqJrF4fCU5R8/kIveJGLhuRvyxxQ1VW/rL40BKwMw9NGZvn/RZZyWKyIGyR/wj1XHU8zbiwtarU3OWGpNp+RsVKTcFxHXb6sn14SiaoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDlP7wrlTDsn66ctfF6VxZhhr/8wAWkk0cmlLOo5TMI=;
 b=6gjrkpCSXMvTAdYCkFA+OmOiKPfGrorpb2AiKmu1UC5tCI40Llx1sElxD7tCpzyHCvfEIJL14A6QIJNxC1SLOt4b37VIaDPOI+Zsq6dT1vcMSoN15W4JcQuADcnMh0/04DSRewl2S7y43/3CGQyYEczhocpEi62hoKCQvI1s9Z4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZbSQ9GJqCFHqaX0uCiT+EC9U7s68pNK+AgAAHnIA=
Date: Thu, 13 Apr 2023 13:24:46 +0000
Message-ID: <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
In-Reply-To: <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7691:EE_|DBAEUR03FT032:EE_|AM9PR08MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: e61db3f3-91da-47a1-5a8f-08db3c228061
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QBbHbWAwViTAcr+WnJdHz4bWznUi8w8ZvcPYnJ+e8tjC6kKpQW00mqdvNnyopJlgssL5u7QXFXO8lex2an7iczrFSPru8lc184rgffOOcZCxmTQv3ZyLEtamUXFQ7SRX9gNUrbfKgRG0UQ9MScwVQ9/BnxdpbPrLy9Q8uCh98H8AJxLYC+BeUlWKfDJl0P0+dbWAHw1gkITCqIQYjFwxBftjuZSJWyCJLUDDEF8S4JFbyGO9UBnncpxlQhXtT97PfxuE90EJd6U554JJpqSiO052uujNWBv3gvXgSanw8xeuQUNm4hVT1e8jnGDIQBP/bdQSvq8i3iy1HZysYpsExC4afC+8t8V5FzzknH2nf3mZqW2SKu9JxkTFr2JBKytgDIVsi9z4TiXDiJpoKnGC9zh5GVxqszeLjdjG7KxUePXZ3PFKUj6fCQfnTx/FTi9nsRYebi3r1sAkhuIybfXKAaRMZ4Jhbf1l7bnCs/lBtSEruxJakhQYOWKXnnWa1C/otQLn7VQJ7dSowMm+VlUylmy8lSGUw2jAmViO+OzddWCc5r2W5wm9830aIDUNz5Hn3H47YOU01Rsn8dQHUneEE8gmBEI4z7UsJ3nGAgqqLmgSNBNPivuU4pEsZ7WQ1KQEI4sATu1bgildFScHpYuQ+NiRjU6u263VIx7qN/be1R957mVqLR9HPcB4hrkzq8+zKv8RsWv6C5zhVQ/nmahO2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(71200400001)(6666004)(478600001)(6506007)(186003)(6512007)(26005)(64756008)(6486002)(66476007)(2906002)(91956017)(66946007)(66556008)(54906003)(76116006)(41300700001)(5660300002)(8936002)(66446008)(316002)(6916009)(8676002)(4326008)(122000001)(38100700002)(36756003)(83380400001)(38070700005)(33656002)(2616005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3E62C8B6D6D41408E0431E1DFD8DBEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c0c4329-ba9a-437b-7502-08db3c2273ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MOw20nxea/NPqUvWozZbGcqpdj+OmrS9IhIiaKJf7RUocNNE538mfTtmDQv6nhfUPUDyFXVJR6uO0EGNwyldZcCFWUQT3IfbW4NJMTSdEseBM6gixwL/sf2rkFWMxgXawHz4NSP8GbxZvqsPUkLAKDeU06KbbD/LUxEq0wGZ4SI+U/wUTIx3jC68uH8IU7Yu5TzR/Q+3vtoMlEbSs14yLmixtR5iAfPNL88xXFFlfH1yRWNeziRYwD8akQMYfNEnzOW2YbKHAR3xsQ6ez14tHVN8LYtDzKq2hH2bvkdiTn4fpb1gs1hjbTa8E+4Ly3xO/mY+JZAqHMG7nHy5hKBn2lNvLrIWQCZbE0GAiEehi5vCphobzNEqaSZCJHqmkYuoeGsOETKFmzKesJ+eId25Sz0W3kwRMpCuDjaAdP63BaVMDTDHPBZ1l1VCZbFgOmb6+ZsWyagiRShsuRluWNBDXSaxVwe8GDSeK4pfjNWwyFpa61R3ggs+x+I5Ic2Jok+hKwbIv4gx11MuyZesRjGoFeNcgvZmM+tEdjW3qYS1ShaIzu/+SB2IQjaCjB9StrdXhyb+vS4nfvNVhkQV7r+8SClnrLEa1MB4nUSHAcjh2K/glHADEvhkt6owY2oAvAduL2YB5q5JctjFKGJTbhO3p/OaV0d5tn+IZdQtXshr+0GqFzUZ7Z4fhj0KxRtCyjm6fPKQcgZ76zpTg4XEXVj6YQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(316002)(6512007)(6666004)(6506007)(26005)(36860700001)(40480700001)(478600001)(81166007)(41300700001)(356005)(82740400003)(83380400001)(47076005)(2616005)(6486002)(186003)(336012)(70206006)(70586007)(4326008)(5660300002)(6862004)(8936002)(8676002)(2906002)(40460700003)(33656002)(86362001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:25:08.2225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e61db3f3-91da-47a1-5a8f-08db3c228061
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6035

SGkgSnVsaWVuLA0KDQoNCj4+ICBAQCAtNTk0LDYgKzU5Nyw3IEBAIGludCBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+
PiAgICAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7DQo+PiAgICAgIHVuc2lnbmVkIGludCBmbGFn
c19yZXF1aXJlZCA9IChYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NERl9oYXApOw0K
Pj4gICAgICB1bnNpZ25lZCBpbnQgZmxhZ3Nfb3B0aW9uYWwgPSAoWEVOX0RPTUNUTF9DREZfaW9t
bXUgfCBYRU5fRE9NQ1RMX0NERl92cG11KTsNCj4+ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9i
aXRzID0gc3ZlX2RlY29kZV92bChjb25maWctPmFyY2guc3ZlX3ZsKTsNCj4+ICAgICAgICBpZiAo
IChjb25maWctPmZsYWdzICYgfmZsYWdzX29wdGlvbmFsKSAhPSBmbGFnc19yZXF1aXJlZCApDQo+
PiAgICAgIHsNCj4+IEBAIC02MDIsNiArNjA2LDI2IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFp
bl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+PiAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICAgICAgfQ0KPj4gICsgICAgLyogQ2hlY2sgZmVhdHVy
ZSBmbGFncyAqLw0KPj4gKyAgICBpZiAoIHN2ZV92bF9iaXRzID4gMCApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHVuc2lnbmVkIGludCB6Y3JfbWF4X2JpdHMgPSBnZXRfc3lzX3ZsX2xlbigpOw0K
Pj4gKw0KPj4gKyAgICAgICAgaWYgKCAhemNyX21heF9iaXRzICkNCj4+ICsgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiU1ZFIGlzIHVuc3VwcG9ydGVkIG9u
IHRoaXMgbWFjaGluZS5cbiIpOw0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4g
KyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBzdmVfdmxfYml0cyA+IHpjcl9tYXhf
Yml0cyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5G
TywNCj4+ICsgICAgICAgICAgICAgICAgICAgICJSZXF1ZXN0ZWQgU1ZFIHZlY3RvciBsZW5ndGgg
KCV1KSA+IHN1cHBvcnRlZCBsZW5ndGggKCV1KVxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
IHN2ZV92bF9iaXRzLCB6Y3JfbWF4X2JpdHMpOw0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4gKyAgICAgICAgfQ0KPiANCj4gSXMgU1ZFIHN1cHBvcnRlZCBmb3IgMzItYml0IGd1
ZXN0PyBJZiBub3QsIHRoZW4geW91IHNob3VsZCBoYWQgYSBjaGVjayBoZXJlIHRvIHByZXZlbnQg
dGhlIGNyZWF0aW9uIG9mIHRoZSBkb21haW4gaWYgc3ZlX3ZsX2JpdHMgaXMgc2V0Lg0KDQpObyBT
VkUgaXMgbm90IHN1cHBvcnRlZCBmb3IgMzIgYml0IGd1ZXN0cywgaGVyZSBJIHRoaW5rIHdlIHdp
bGwgZ2V0IOKAnFNWRSBpcyB1bnN1cHBvcnRlZCBvbiB0aGlzIG1hY2hpbmXigJ0gYmVjYXVzZSBn
ZXRfc3lzX3ZsX2xlbigpIHdpbGwgcmV0dXJuIDAuDQoNCkkgY2FuIGhvd2V2ZXIgcHV0IGV2ZXJ5
dGhpbmcgaW5zaWRlICNpZmRlZiBDT05GSUdfQVJNNjRfU1ZFIG9yIENPTkZJR19BUk1fNjQgaWYg
eW91IHByZWZlcg0KDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG9tYWluLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+IGluZGV4
IGU3NzZlZTcwNGI3ZC4uNzhjYzJkYTNkNGU1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
ZG9tYWluLmgNCj4+IEBAIC0zMSw2ICszMSw4IEBAIGVudW0gZG9tYWluX3R5cGUgew0KPj4gICAg
I2RlZmluZSBpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAoKGQpLT5jZGYgJiBDREZfZGlyZWN0
bWFwKQ0KPj4gICsjZGVmaW5lIGlzX3N2ZV9kb21haW4oZCkgKChkKS0+YXJjaC5zdmVfdmwgPiAw
KQ0KPj4gKw0KPj4gIC8qDQo+PiAgICogSXMgdGhlIGRvbWFpbiB1c2luZyB0aGUgaG9zdCBtZW1v
cnkgbGF5b3V0Pw0KPj4gICAqDQo+PiBAQCAtNjcsNiArNjksOSBAQCBzdHJ1Y3QgYXJjaF9kb21h
aW4NCj4+ICAgICAgZW51bSBkb21haW5fdHlwZSB0eXBlOw0KPj4gICNlbmRpZg0KPj4gICsgICAg
LyogbWF4IFNWRSBlbmNvZGVkIHZlY3RvciBsZW5ndGggKi8NCj4+ICsgICAgdWludDhfdCBzdmVf
dmw7DQo+PiArDQo+IENhbiB3ZSBtb3ZlIHRoaXMgc29tZXdoZXJlIGVsc2UgdG8gYXZvaWQgYWRk
aW5nIGV4dHJhIHBhZGRpbmc/IEFsc28gc2hvdWxkbid0IHRoaXMgYmUgcHJvdGVjdGVkIHdpdGgg
I2lmZGVmIENPTkZJR19BUk1fNjQgdG8gbWFrZSBjbGVhciB0aGlzIGlzIG5vdCBzdXBwb3J0ZWQg
b24gWGVuIDMyLWJpdD8NCg0KWWVzLCBJ4oCZbGwgbW92ZSBpdCBhbmQgcHJvdGVjdCB3aXRoIENP
TkZJR19BUk1fNjQsIGlzIGl0IG9rIGZvciB5b3UgaWYgSSBtb3ZlIGl0IGFmdGVyOg0KDQovKiBN
b25pdG9yIG9wdGlvbnMgKi8NCnN0cnVjdCB7DQogICAgdWludDhfdCBwcml2aWxlZ2VkX2NhbGxf
ZW5hYmxlZCA6IDE7DQp9IG1vbml0b3I7DQoNCg0KDQo=

