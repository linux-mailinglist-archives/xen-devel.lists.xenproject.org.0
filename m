Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D274FF85B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 16:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304179.518763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedZx-0003iz-4F; Wed, 13 Apr 2022 14:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304179.518763; Wed, 13 Apr 2022 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedZx-0003gP-0G; Wed, 13 Apr 2022 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 304179;
 Wed, 13 Apr 2022 14:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JnL=UX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nedZv-0003gA-A8
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 14:02:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6029024c-bb32-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 16:02:38 +0200 (CEST)
Received: from DB6PR0301CA0086.eurprd03.prod.outlook.com (2603:10a6:6:30::33)
 by AM6PR08MB3063.eurprd08.prod.outlook.com (2603:10a6:209:46::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 14:02:35 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::60) by DB6PR0301CA0086.outlook.office365.com
 (2603:10a6:6:30::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30 via Frontend
 Transport; Wed, 13 Apr 2022 14:02:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 14:02:34 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Wed, 13 Apr 2022 14:02:34 +0000
Received: from bca559506bb5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B406407-B2EF-4E6B-A886-47741C2E89D1.1; 
 Wed, 13 Apr 2022 14:02:27 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bca559506bb5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 14:02:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR08MB2838.eurprd08.prod.outlook.com (2603:10a6:6:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 14:02:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 14:02:24 +0000
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
X-Inumbo-ID: 6029024c-bb32-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlaXcmPF2Jq7FkbqtO6VrKeWGtKMPoFB6D4/Mr4ZmJ8=;
 b=kBj52NaeXEVDpc93zt4EB6vJ5WMjkVHNIIU6RHoCuVACgBv99brTBWR1/FafvdAW6FigxCSagIMad916iiIdll2U9Fk3Knq6IAyEvpuGBl2LDjLk/QC7x+rjg0vfA2w5/o/sKaG965N+6aryrzZT0BMvin95XZLVJTr41Fl/8sU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1679c511e32461d9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gcb3ex33roGbLtvXPA1ApFvgcleMcjoWIfOFTXXwF4/dpi1IyswmP3lyik9X3oeVR6fEDbBjlOAGZV7Uj/sN8y/knGQdIrOfmqpS7o8b2oKGu2DA8PbtxMlzMqDm7LrYFKFokeBdwJFrcBVC5sSyQMO7suvmxNEEtC4m3xqH9XCHxjRdckXlBikScLwv/OPKRzoFes7Ezn0yEHX0+0t1bzPyxb7Za1AbvxXg0Mc004DKQUZPwwmK6vN8lmr4g/cuI7rDEGQ9+KYxua5NYbRXNH7uSZoUsvMb4qclSVNFY6lCji3YE5opZLhuvuqJBbiNfG3G3vw42izdv/e3e7rNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlaXcmPF2Jq7FkbqtO6VrKeWGtKMPoFB6D4/Mr4ZmJ8=;
 b=NlM5r0j6Z9RaSWTYGl7U94glBtXHZrr8dftGFcopCGErOrEs9j+F7faJDGJs/NYRiQ7Aty2UWN/w3Ms404HYspbdfTfiEJHQSwyN3eshmA92PALHJbau7R+YUATx60bkoCs2smzgdta/DuMxaRp/XBlTF/6E0igu0bpQcELYh/tWsxgGPbup31U2RAWedA83WccV+PwgWpKP+VqsovUU+ecAnx1GyabcR+cf7XrsZ9LHjMXXJcqepiXMfCilNt9VPEqGzc1hSpZzZXsYqW7AMdf5gRaiTr8fr46RszMkqjWYA63UWHjnhG9XzaycqhcChGI1/KyIVS/Rvwf4DkoYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlaXcmPF2Jq7FkbqtO6VrKeWGtKMPoFB6D4/Mr4ZmJ8=;
 b=kBj52NaeXEVDpc93zt4EB6vJ5WMjkVHNIIU6RHoCuVACgBv99brTBWR1/FafvdAW6FigxCSagIMad916iiIdll2U9Fk3Knq6IAyEvpuGBl2LDjLk/QC7x+rjg0vfA2w5/o/sKaG965N+6aryrzZT0BMvin95XZLVJTr41Fl/8sU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Topic: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Index:
 AQHYM6fbReeSkSu3okSScrrMlkjRu6zQNoyAgAAKUgCAAAMDAIAAAf4AgAABeACAFHxvgIAJUxsA
Date: Wed, 13 Apr 2022 14:02:24 +0000
Message-ID: <B0A4B2C7-D63F-4796-9C4A-7DD7FD688698@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
 <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
 <7069C935-A275-4D1A-80EF-C20DE1D3103C@arm.com>
 <284b300e-d400-4bd7-0b0e-aa53983d6ee8@xen.org>
 <099CD8F1-C92A-4402-897F-538821AD66EE@arm.com>
 <7ff80bc6-5937-43aa-784b-fbba016bcfe3@xen.org>
In-Reply-To: <7ff80bc6-5937-43aa-784b-fbba016bcfe3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8b0269bb-0429-419e-3bd3-08da1d564276
x-ms-traffictypediagnostic:
	DB6PR08MB2838:EE_|DB5EUR03FT025:EE_|AM6PR08MB3063:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB30631E7FC53FD33B73B559339DEC9@AM6PR08MB3063.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jPPMrlpMmvrUhYTqlRDmsptuaXF9SxoAQzuFRBiNo1D43Ao/44NdUe2m/nJz9mDlYwl63Jw8HVzS770FLTxH87t8G+ePlxqab2GAbiAFQTEFphg7MofsXXgDp+WjTqHCjaUI5+l9hG5PS8M0EHKn9DsjjkYASLfeRI2xHNv4ENZmEiA9JwX3xKi++hZ7WNIxpwsLwuTul+UJFyKmvn8nr8nCd2bgVZf45r3pbYuL5joLWxcJbVYZp9etGhKNiTJuEenSyQCNE58f8r/SHB5wss/ZjILEE85IXPg+wAf+trid+ncjv2JHYhzKIarQYSzEraYi5rWZIkG6tI3djIBId8EDbdPfEh+JyO+oITtlqPTOoGcXrkmmb9s8dzf+evqWP2ASkQsQLaz9L8CqX3OYqFNZ81LTELi912BPjn8CM32AHqDiZaV+kIr0SjdoHNenT+Xk9dvm5w4HmLkH9fKhbCgHc4AW/te58wJfymXUlezMLD1D/GmrPeK4ETFxwz9SWifE9Drzup055cMCLwRCLc5OLEJPi+XbeAvy36SdphrgJOE7bQF29Zin4nAoMfkQgXh6iXjHNfAg78Bo0GjDgJ09RJEUk7IgkggBO4b51pbNfQyX+j3o8nZvAT3X6v0IPfNr9umu4t+HufIG9yPP6ABf4wAvIMAJu+6Ph45uTAh6RPNYHEHxMe8l+ryPnqBFwN5Iuoivg6YxLPATye0463FgazERcK2YfMVfIyROPS+ejpL3/CwaMo1lMfbXfi1pwPuOW2j6EImOH0kvwfj/tg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(38100700002)(66476007)(66446008)(66556008)(83380400001)(76116006)(66946007)(6512007)(53546011)(498600001)(2616005)(26005)(5660300002)(4326008)(6486002)(186003)(2906002)(8676002)(36756003)(8936002)(91956017)(38070700005)(33656002)(64756008)(122000001)(6506007)(6916009)(54906003)(86362001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EA2764CEFAA324887413FD22981D123@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2838
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7be172d7-9667-4076-4ea7-08da1d563cad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	msueOpJd8pbO3K+jUKqfvDIuKoWqQ3u7pRQvIiJ+attMwmVYd0jmDf4v7/Ld9lYzmFC7G2oTUU7YrK9GM+YmHXwW97OKv+7GZTvRVEov2BjSZhd28TXLQlu8bBdKBEjxD0hImTLHWFEsLnpxixZDrs4ROuXqsGKKpjQlAhi1xuY2uwykefokJFT7YlfqKVOPhwIboXr8INze9vRxzbWT25UnCZCdHunrNDfujyBR8KwQ15ABEu2HvlhnM3ilMFqdrCewEVHVe4CspLKcb2wBXr/5iXdOT6gWZkOfa4U7N9M4CO3KxkxJ9QoDYtVtLZfn7D/AKJdZ79N9zSeU/3IS+D9w9WcLmflaIV+t0MU/ytid6H6v55IjYBpxee5tTjEDhIZW+TRsMTHqvpNhkHEWJ6z9mYYFn8HVJw+dXWsCM2HYAjLc6dbQvdTf5+xuBuYmTNOSupZJ9Rw/KgAkH8ASzfc2OS+mf8ZKMQ3329JGK55nhYPsPGNfKgHrM214Xc9/g+iCdNjv/4aLxE7zcnbG1NoqFTXCmGqsI7INU5lolks4lj8coDTcXzwI3BA/adM+2oMDdkcS03KJaxJSiOAa5jJjf10v30/Q555sjRwQbhjKlisaYhJORGslTz59HkYk/Q6s9MSCWWsIiHoKk2523lAeLk73mjMZkueE5wEzUDqdpQsFJtXx/GnYtXZaYbbyWFD4G+oAiPhWTQCnhUOyjg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(107886003)(2906002)(82310400005)(2616005)(498600001)(6486002)(70206006)(70586007)(53546011)(8676002)(33656002)(83380400001)(4326008)(6862004)(54906003)(8936002)(336012)(26005)(186003)(36756003)(6512007)(40460700003)(356005)(81166007)(5660300002)(47076005)(6506007)(86362001)(36860700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:02:34.5784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0269bb-0429-419e-3bd3-08da1d564276
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3063

SGkgSnVsaWVuLA0KDQo+IE9uIDcgQXByIDIwMjIsIGF0IDE2OjM4LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjUvMDMvMjAyMiAxNDo0
OCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAyNSBNYXIgMjAyMiwgYXQgMTU6NDIs
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEJlcnRy
YW5kLA0KPj4+IA0KPj4+IE9uIDI1LzAzLzIwMjIgMTQ6MzUsIEJlcnRyYW5kIE1hcnF1aXMgd3Jv
dGU6DQo+Pj4+PiBPbiAyNSBNYXIgMjAyMiwgYXQgMTU6MjQsIEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gT24gMjUvMDMvMjAyMiAxMzo0NywgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+Pj4+PiBIaSBKdWxpZW4sDQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRyYW5k
LA0KPj4+Pj4gDQo+Pj4+Pj4+IE9uIDkgTWFyIDIwMjIsIGF0IDEyOjIwLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBdCB0aGUgbW9tZW50
LCBzd2l0Y2hfdHRicigpIGlzIHN3aXRjaGluZyB0aGUgVFRCUiB3aGlsc3QgdGhlIE1NVSBpcw0K
Pj4+Pj4+PiBzdGlsbCBvbi4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFN3aXRjaGluZyBUVEJSIGlzIGxp
a2UgcmVwbGFjaW5nIGV4aXN0aW5nIG1hcHBpbmdzIHdpdGggbmV3IG9uZXMuIFNvDQo+Pj4+Pj4+
IHdlIG5lZWQgdG8gZm9sbG93IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IEluIHRoaXMgY2FzZSwgaXQgbWVhbnMgdGhlIE1NVSBuZWVkcyB0byBiZSBz
d2l0Y2hlZCBvZmYgd2hpbGUgdGhlDQo+Pj4+Pj4+IFRUQlIgaXMgdXBkYXRlZC4gSW4gb3JkZXIg
dG8gZGlzYWJsZSB0aGUgTU1VLCB3ZSBuZWVkIHRvIGZpcnN0DQo+Pj4+Pj4+IGp1bXAgdG8gYW4g
aWRlbnRpdHkgbWFwcGluZy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFJlbmFtZSBzd2l0Y2hfdHRicigp
IHRvIHN3aXRjaF90dGJyX2lkKCkgYW5kIGNyZWF0ZSBhbiBoZWxwZXIgb24NCj4+Pj4+Pj4gdG9w
IHRvIHRlbXBvcmFyeSBtYXAgdGhlIGlkZW50aXR5IG1hcHBpbmcgYW5kIGNhbGwgc3dpdGNoX3R0
YnIoKQ0KPj4+Pj4+PiB2aWEgdGhlIGlkZW50aXR5IGFkZHJlc3MuDQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBzd2l0Y2hfdHRicl9pZCgpIGlzIG5vdyByZXdvcmtlZCB0byB0ZW1wb3JhcmlseSB0dXJuIG9m
ZiB0aGUgTU1VDQo+Pj4+Pj4+IGJlZm9yZSB1cGRhdGluZyB0aGUgVFRCUi4NCj4+Pj4+Pj4gDQo+
Pj4+Pj4+IFdlIGFsc28gbmVlZCB0byBtYWtlIHN1cmUgdGhlIGhlbHBlciBzd2l0Y2hfdHRicigp
IGlzIHBhcnQgb2YgdGhlDQo+Pj4+Pj4+IGlkZW50aXR5IG1hcHBpbmcuIFNvIG1vdmUgX2VuZF9i
b290IHBhc3QgaXQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBp
bnN0cnVjdGlvbiBjYWNoZSBmbHVzaCBhcyB0aGUgb3BlcmF0aW9uIGlzDQo+Pj4+Pj4+IG9ubHkg
bmVjZXNzYXJ5IHdoZW4gdGhlIG1lbW9yeSBpcyB1cGRhdGVkLg0KPj4+Pj4+IFlvdXIgY29kZSBp
cyBhY3R1YWxseSByZW1vdmUgdGhlIGluc3RydWN0aW9uIGNhY2hlIGludmFsaWRhdGlvbiBzbw0K
Pj4+Pj4+IHRoaXMgc2VudGVuY2UgaXMgYSBiaXQgbWlzbGVhZGluZy4NCj4+Pj4+IA0KPj4+Pj4g
SSBmb3Jnb3QgdG8gYWRkIHRoZSB3b3JkICJyZW1vdmUiIGluIHRoZSBzZW50ZW5jZS4NCj4+Pj4g
T2sgKG15IHNlbnRlbmNlIHdhcyBhbHNvIHdyb25nIGJ5IHRoZSB3YXkpDQo+Pj4+PiANCj4+Pj4+
PiBBbHNvIGFuIG9wZW4gcXVlc3Rpb246IHNob3VsZG7igJl0IHdlIGZsdXNoIHRoZSBkYXRhIGNh
Y2hlID8NCj4+Pj4+IERvIHlvdSBtZWFuIGNsZWFuL2ludmFsaWRhdGUgdG8gUG9DL1BvVT8gU29t
ZXRoaW5nIGVsc2U/DQo+Pj4+IFllcywgcHJvYmFibHkgdG8gUG9VLg0KPj4+Pj4gDQo+Pj4+Pj4g
QXMgd2Ugc3dpdGNoIGZyb20gb25lIFRUQlIgdG8gYW4gb3RoZXIsIHRoZXJlIG1pZ2h0IGJlIHNv
bWUgZGF0YQ0KPj4+Pj4+IGluIHRoZSBjYWNoZSBkZXBlbmRlbnQgdGhhdCBjb3VsZCBiZSBmbHVz
aGVkIHdoaWxlIHRoZSBNTVUgaXMgb2ZmDQo+Pj4+PiANCj4+Pj4+IEkgYW0gYSBiaXQgY29uZnVz
ZWQuIFRob3NlIGZsdXNoIGNvdWxkIGFsc28gaGFwcGVuIHdpdGggdGhlIE1NVSBvbi4gU28gaG93
IHR1cm5pbmcgb2ZmIHRoZSBNTVUgd291bGQgcmVzdWx0IHRvIGEgcHJvYmxlbT8gTm90ZSB0aGF0
IHRoZSBkYXRhIGNhY2hlIGlzIHN0aWxsIGVuYWJsZWQgZHVyaW5nIHRoZSBzd2l0Y2guDQo+Pj4+
IElmIHRoZSBmaXJzdCBsZXZlbCBvZiBjYWNoZSBpcyBWSVBUIGFuZCB3ZSB0dXJuIG9mZiB0aGUg
TU1VLCBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGNvdWxkIG5vdCBjcmVhdGUgdHJvdWJsZXMgYW5k
IGNvdWxkIHJlcXVpcmUgdGhlIGNhY2hlIHRvIGJlIGZsdXNoZWQgYmVmb3JlIHR1cm5pbmcgdGhl
IE1NVSBvZmYuDQo+Pj4gTXkgcmVhZGluZyBvZiB0aGUgQXJtIEFybSAoRDUuMTEuMSAiRGF0YSBh
bmQgdW5pZmllZCBjYWNoZXMiIEFSTSBEREkgMDQ4N0YuYykgc3VnZ2VzdHMgdGhlIGRhdGEgY2Fj
aGUgaXMgYWx3YXlzIFBJUFQuDQo+PiBZb3UgYXJlIHJpZ2h0LCBvbmx5IHRoZSBpbnN0cnVjdGlv
biBjYWNoZSBpcyBWSVBULg0KPj4gU28gdGhlIHByb2JsZW0gbW9zdCBwcm9iYWJseSBkb2VzIG5v
dCBleGlzdC4NCj4gDQo+IEFzIGRpc2N1c3NlZCB5ZXN0ZXJkYSwgSSB0d2Vha2VkIGEgYml0IHN3
aXRjaF90dGJyKCkuIEJlbG93IHRoZSB2ZXJzaW9uIEkgcGxhbiB0byB1c2U6DQo+IA0KPiAgICAg
ICAgLyogMSkgRW5zdXJlIGFueSBwcmV2aW91cyByZWFkL3dyaXRlIGhhdmUgY29tcGxldGVkICov
DQo+ICAgICAgICBkc2IgICBzeSAvKiBYWFg6IENhbiB0aGlzIGJlIGEgaXNoPyAqLw0KDQpJIHRo
aW5rIGhlcmUg4oCcaXNo4oCdIGlzIGVub3VnaCBhcyB3ZSBvbmx5IG5lZWQgdGhlIGRvbWFpbiBp
bXBhY3RlZCBieSB0aGUgTU1VIG9mZiBvcGVyYXRpb24gdG8gaGF2ZSBoaXMgb3BlcmF0aW9ucyBk
b25lLg0KDQpGb3IgcmVmZXJlbmNlIHRoaXMgaXMgYW4gZXh0cmFjdCBmcm9tIHRoZSBjb2RlIG9m
IHRydXN0ZWQgZmlybXdhcmUgYmVmb3JlIGVuYWJsaW5nIE1NVToNCg0KICAgICAgICAvKg0KICAg
ICAgICAgKiBFbnN1cmUgYWxsIHRyYW5zbGF0aW9uIHRhYmxlIHdyaXRlcyBoYXZlIGRyYWluZWQg
aW50byBtZW1vcnksIHRoZSBUTEINCiAgICAgICAgICogaW52YWxpZGF0aW9uIGlzIGNvbXBsZXRl
LCBhbmQgdHJhbnNsYXRpb24gcmVnaXN0ZXIgd3JpdGVzIGFyZQ0KICAgICAgICAgKiBjb21taXR0
ZWQgYmVmb3JlIGVuYWJsaW5nIHRoZSBNTVUNCiAgICAgICAgICovDQogICAgICAgIGRzYiBpc2gN
CiAgICAgICAgaXNiDQoNCg0KPiAgICAgICAgaXNiDQo+IA0KPiAgICAgICAgLyogMikgVHVybiBv
ZmYgTU1VICovDQo+ICAgICAgICBtcnMgICAgeDEsIFNDVExSX0VMMg0KPiAgICAgICAgYmljICAg
IHgxLCB4MSwgI1NDVExSX0F4eF9FTHhfTQ0KPiAgICAgICAgbXNyICAgIFNDVExSX0VMMiwgeDEN
Cj4gICAgICAgIGlzYg0KPiANCj4gICAgICAgIC8qDQo+ICAgICAgICAgKiAzKSBGbHVzaCB0aGUg
VExCcy4NCj4gICAgICAgICAqIFNlZSBhc20vYXJtNjQvZmx1c2h0bGIuaCBmb3IgdGhlIGV4cGxh
bmF0aW9uIG9mIHRoZSBzZXF1ZW5jZS4NCj4gICAgICAgICAqLw0KPiAgICAgICAgZHNiICAgbnNo
c3QNCj4gICAgICAgIHRsYmkgIGFsbGUyDQo+ICAgICAgICBkc2IgICBuc2gNCj4gICAgICAgIGlz
Yg0KPiANCj4gICAgICAgIC8qIDQpIFVwZGF0ZSB0aGUgVFRCUiAqLw0KPiAgICAgICAgbXNyICAg
VFRCUjBfRUwyLCB4MA0KPiAgICAgICAgaXNiDQo+IA0KPiAgICAgICAgLyogNSkgVHVybiBvbiB0
aGUgTU1VICovDQo+ICAgICAgICBtcnMgICB4MSwgU0NUTFJfRUwyDQo+ICAgICAgICBvcnIgICB4
MSwgeDEsICNTQ1RMUl9BeHhfRUx4X00gIC8qIEVuYWJsZSBNTVUgKi8NCj4gICAgICAgIG1zciAg
IFNDVExSX0VMMiwgeDENCj4gICAgICAgIGlzYg0KDQpSZXN0IGhlcmUgc291bmRzIG9rIHRvIG1l
Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+ICAgICAgICByZXQNCj4gDQo+IENoZWVycywN
Cj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

