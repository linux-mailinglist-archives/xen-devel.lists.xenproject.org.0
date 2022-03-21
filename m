Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6B4E2EF5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 18:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293153.497900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWLhJ-0004tu-5i; Mon, 21 Mar 2022 17:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293153.497900; Mon, 21 Mar 2022 17:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWLhJ-0004rb-2R; Mon, 21 Mar 2022 17:20:01 +0000
Received: by outflank-mailman (input) for mailman id 293153;
 Mon, 21 Mar 2022 17:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nWLhH-0004rV-Fw
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 17:19:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe06::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21e42719-a93b-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 18:19:58 +0100 (CET)
Received: from FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::9) by
 VI1PR08MB3600.eurprd08.prod.outlook.com (2603:10a6:803:85::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 17:19:54 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::ae) by FR3P281CA0010.outlook.office365.com
 (2603:10a6:d10:1d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.15 via Frontend
 Transport; Mon, 21 Mar 2022 17:19:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 17:19:54 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Mon, 21 Mar 2022 17:19:53 +0000
Received: from 66b25b662af0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49B8C7F8-8CE9-4BD6-9E7B-F28439C3DDCB.1; 
 Mon, 21 Mar 2022 17:19:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66b25b662af0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Mar 2022 17:19:42 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by PAXPR08MB6463.eurprd08.prod.outlook.com (2603:10a6:102:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 17:19:40 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::a857:4da:bb40:96dc]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::a857:4da:bb40:96dc%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 17:19:40 +0000
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
X-Inumbo-ID: 21e42719-a93b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnE7Q1HVCAfMp+GsTmO8+lyaDeda8GLWEWGTk+z4Wek=;
 b=p8Yq6VgLctc2LFo29AndjPTAqsJkZOujgT4PPiHTh/cXaQT8ix2smdrFpl1QbMObk9zguoy+F8uZMECWUz49W/lukQysftau0LlbvgQ305feCPXJaZiG+JtZc+KsLZ59WB3goTUwYE9oezianrGBpU3DZfXI6frmX67PzYqJOxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8d669e14ec3c208
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcTvyNsQUwz9fjHwjGXPpQojKQtUS0oNGJnvLGaoU2xSni6RtsutlFqoEz5gzDjOSoD0KSsQ1XAkj5YXp+B8JiUo5QeguTiCmLukWyAEE3WmMC2yYvEp5ckmmH4hanvQTdAKbV8644UrWRp+wuOjppLMPLT5H5qtnOFOLrQui0fpakmuM8PJDbVbAlHZ4LZgg9Fh/95Y+41otmqLDObiV8oy0W8iQ45MzFX79TuFFZsbiWvPeXzGeGJ4YmnRM73JJSRDX8mgm9RcdE4tqo8uSp8DQq8QL7t9cGvTISduIC+UVlmT/ybduKegA/INIRNNescZwD8Pmp/IXiqpt3e6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnE7Q1HVCAfMp+GsTmO8+lyaDeda8GLWEWGTk+z4Wek=;
 b=aaWwCCycQg9xpkY8TFqbr4G0RWaqQdKWyROKCHWJRn9lJPXeTSqIiI3jI0kI0QSP3RPEzQtx2Fcp0DS08JPyNZtUKFOxQrsQYYJQdcSkeCsPpNsx6n2d20DOmeoZYnaahB1X5wIvKRKeFu2cTJtwmVP4OXJsOrMqTR82c9Kf26ifTp6sFNb9RxTUQIiYyvegUbDaBaz6kJ520nNADyNyKHN+bHXWTiSK8R0FprdIBU+BPTHLGAAhbj2o6FvinkJuAGpcGIY7jUtp/dVuHe7/7EHFhnOnWAdV+T2JD795bUvat/ScPOTuAQgJvgvCgDDXq8If7IOt1q+tp3DPNA63Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnE7Q1HVCAfMp+GsTmO8+lyaDeda8GLWEWGTk+z4Wek=;
 b=p8Yq6VgLctc2LFo29AndjPTAqsJkZOujgT4PPiHTh/cXaQT8ix2smdrFpl1QbMObk9zguoy+F8uZMECWUz49W/lukQysftau0LlbvgQ305feCPXJaZiG+JtZc+KsLZ59WB3goTUwYE9oezianrGBpU3DZfXI6frmX67PzYqJOxU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYOtyBwlLK7ts4vEKxgpEPsRlgQ6zFUCoAgASzLwCAAAp/AIAADB+A
Date: Mon, 21 Mar 2022 17:19:40 +0000
Message-ID: <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
In-Reply-To: <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 21b51560-e134-45bf-7167-08da0b5f03f4
x-ms-traffictypediagnostic:
	PAXPR08MB6463:EE_|VE1EUR03FT032:EE_|VI1PR08MB3600:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3600C3DB3A0DB0346008789A9D169@VI1PR08MB3600.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g3SrTVHotjmCziaBvhdlILjyBK8orJqEHD3d36xL8y+kUn6YSs+rMwzzKPUeuHTVnRQp3SU4N+/X5o9nPvXEC0CObseEaKq+p3eh2HojlEyIrKKTFM8lYq8QbHWss4OUBmZ5WBNQ3IGJYPeKq7YkqyuQNy2Y3j0scTgnwvAPRQtJ7mNs2KSQrHFc6WrDnaYYTrlNXnjZKkpcbGDmNp3wynM9acgYduNZ3lynjch4Bit1AqjY29gtiOmXsgnUHuTEDRpruQYyRv3AHXubUtvv8l9KjFF1+VcjQzBf9xKDjefop220jNcso2ezZ2YHqf3PHOitZNmPh+yHRcA4dsWtr3PXw1Ju06jIIJpQ6WwJOlrVIml/490MxoxFxwAIVKvu7YYV5XqNd8KDMQkpUNvbmU/uhw7D3wvIkC7nq5p3f0Hj0WL8wza9F2Xum7GkZGarvpHJqTljthm5GkR+4N2v5tGqez/YBYqfGpsXEzEGtvLr8wnXfb8cAghUpZqSaGPXmFU+XCWB5PFkqjMqXC/3hcTD/u6N4ji4SBXQmwjAOdmxv7z0tWIF5UDvIXOsI1kM4gwnMBMoBdFR9AwTK+Gv8OtuPpKJvInigLYVihpyr03WSdTGNJOw0b3jhjmk4LxSgbpl/HFEYMLXCMu5YJwRjGQEncCzsIzQi0e6xmiBGm5RbuwQLTy/Y6smakYjQvG4ttcgbAYdjJds15ZZ3yX7BRegzbinKSNFkZIYcc9pbiGgtwSsVJoplkKYXf/QNxFFUJy1Qz9TQkBEkMzN2ArFecn8ymf0ycuAHinoqvq9Qq6N/r7tiId5MV7QN0vfrYteIAK9xCRr2jt9DZ31rJZ61Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(86362001)(6512007)(33656002)(6506007)(6486002)(508600001)(966005)(71200400001)(2906002)(122000001)(91956017)(38070700005)(64756008)(4326008)(8676002)(66946007)(76116006)(66446008)(66476007)(66556008)(53546011)(2616005)(36756003)(5660300002)(186003)(54906003)(6916009)(7416002)(316002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05E7C44D6B717E40A190A09D4CB14EAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6463
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	520e7621-d8d7-4555-dee5-08da0b5efbc6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O7L38NdbnjRWDoAW0qVayZFqP2Egk/W5sbqyzBeApatodtvREljKF5TLW02J6ui+/QNpJCPxQkmfCwZcJhYW9d7TC30ENtYGEU36hfJV2NlDZxKaP2nBMOfg/H4qe/qAS6mKm51BGhkkWG1spWdIUBvQpvvSigEIl3xAeeV7N62gbO8NGql9XzPpQs8mr6ebEZ8bly18SV3ZhdGMJAgReiLMa3vF1SnDRdFlFqMLnHwEYBjjXLvhNuNnGM4bl22WHnoIv2UUpFdNUVD6+p+uk02G3VUijMNdJxZhIwST3/Lde3QGbPNYqFFCBSfcXYrE13HPonlnjhv0Ve7bq9JyyAO2PFLKFhMD9AcbfTS4uzjc3kgdWN5jGtRS3NVY80/tB4IyC/CDLrtSnpccRL2WUq6XLmqcoLmX26JJPaTvc9qO01lg02cgddeN31r1UQIBxml4eqbOXrhrW+g+d28V3pvmjw6aEaNwmlllV5LIGu+ikfxkhZGdZK75LFWYO6WxSKqyflQyCAnWpS2SCE4+ELqK8WsEv6yrA15GeckaEifI8tRykkFW2kLl2BOVJmCZgBweagDY3DVfYtdiF1jMfawnUlLnXRG6H1mc2VikFDwIUnc1349n/t92+8EkPwEPX2fCbEurXM28VCSjM4TGji4uwu4MdmaBysCVECZ4AoYfNJ2G3TZOBtLUtqOFP9NFWoaPemLwzpB4aZHyPgSCg5n1FSvyJ9+XWkUCS0Ns9gXu9RRyuzxyAtZwNKAdpsDVlOGblBvPBpK/OZHYMzfElA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(26005)(186003)(5660300002)(53546011)(316002)(83380400001)(33656002)(6506007)(6512007)(336012)(82310400004)(2906002)(36756003)(356005)(2616005)(40460700003)(70586007)(6862004)(4326008)(8676002)(70206006)(47076005)(36860700001)(81166007)(8936002)(508600001)(107886003)(54906003)(6486002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:19:54.0295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b51560-e134-45bf-7167-08da0b5f03f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3600

SGkgSnVsaWVuLA0KDQo+IE9uIDIxIE1hciAyMDIyLCBhdCAxNzozNiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIxLzAzLzIwMjIgMTU6
NTgsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMTggTWFyIDIwMjIsIGF0IDE2OjEyLCBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBMdWNhLA0K
Pj4+IA0KPj4+IEkgb25seSBza2ltbWVkIHRocm91Z2ggdGhlIHNlcmllcy4gSSBoYXZlIG9uZSBx
dWVzdGlvbiBiZWxvdzoNCj4+PiANCj4+PiBPbiAxOC8wMy8yMDIyIDE1OjI1LCBMdWNhIEZhbmNl
bGx1IHdyb3RlOg0KPj4+PiArdm9pZCBfX2luaXQgYnRjcHVwb29sc19hbGxvY2F0ZV9wb29scyh2
b2lkKQ0KPj4+PiArew0KPj4+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4+PiArICAgIGJvb2wg
YWRkX2V4dHJhX2NwdXBvb2wgPSBmYWxzZTsNCj4+Pj4gKw0KPj4+PiArICAgIC8qDQo+Pj4+ICsg
ICAgICogSWYgdGhlcmUgYXJlIG5vIGNwdXBvb2xzLCB0aGUgdmFsdWUgb2YgbmV4dF9wb29sX2lk
IGlzIHplcm8sIHNvIHRoZSBjb2RlDQo+Pj4+ICsgICAgICogYmVsb3cgd2lsbCBhc3NpZ24gZXZl
cnkgY3B1IHRvIGNwdXBvb2wwIGFzIHRoZSBkZWZhdWx0IGJlaGF2aW9yLg0KPj4+PiArICAgICAq
IFdoZW4gdGhlcmUgYXJlIGNwdXBvb2xzLCB0aGUgY29kZSBiZWxvdyBpcyBhc3NpZ25pbmcgYWxs
IHRoZSBub3QNCj4+Pj4gKyAgICAgKiBhc3NpZ25lZCBjcHUgdG8gYSBuZXcgcG9vbCAobmV4dF9w
b29sX2lkIHZhbHVlIGlzIHRoZSBsYXN0IGlkICsgMSkuDQo+Pj4+ICsgICAgICogSW4gdGhlIHNh
bWUgbG9vcCB3ZSBjaGVjayBpZiB0aGVyZSBpcyBhbnkgYXNzaWduZWQgY3B1IHRoYXQgaXMgbm90
DQo+Pj4+ICsgICAgICogb25saW5lLg0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIGZvciAoIGkg
PSAwOyBpIDwgbnJfY3B1X2lkczsgaSsrICkNCj4+Pj4gKyAgICAgICAgaWYgKCBjcHVtYXNrX3Rl
c3RfY3B1KGksICZjcHVfb25saW5lX21hcCkgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAg
ICAgICAgICAvKiBVbmFzc2lnbmVkIGNwdSBnZXRzIG5leHRfcG9vbF9pZCBwb29sIGlkIHZhbHVl
ICovDQo+Pj4+ICsgICAgICAgICAgICBpZiAoIHBvb2xfY3B1X21hcFtpXSA8IDAgKQ0KPj4+PiAr
ICAgICAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAgIHBvb2xfY3B1X21hcFtpXSA9IG5l
eHRfcG9vbF9pZDsNCj4+Pj4gKyAgICAgICAgICAgICAgICBhZGRfZXh0cmFfY3B1cG9vbCA9IHRy
dWU7DQo+Pj4+ICsgICAgICAgICAgICB9DQo+Pj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9H
X0lORk8gIkxvZ2ljYWwgQ1BVICV1IGluIFBvb2wtJXUuXG4iLCBpLA0KPj4+PiArICAgICAgICAg
ICAgICAgICAgIHBvb2xfY3B1X21hcFtpXSk7DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyAgICAg
ICAgZWxzZQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICBpZiAoIHBvb2xfY3B1
X21hcFtpXSA+PSAwICkNCj4+Pj4gKyAgICAgICAgICAgICAgICBwYW5pYygiUG9vbC0lZCBjb250
YWlucyBjcHUldSB0aGF0IGlzIG5vdCBvbmxpbmUhXG4iLA0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgIHBvb2xfY3B1X21hcFtpXSwgaSk7DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKw0KPj4+
PiArICAgIGlmICggYWRkX2V4dHJhX2NwdXBvb2wgKQ0KPj4+PiArICAgICAgICBuZXh0X3Bvb2xf
aWQrKzsNCj4+Pj4gKw0KPj4+PiArICAgIC8qIENyZWF0ZSBjcHVwb29scyB3aXRoIHNlbGVjdGVk
IHNjaGVkdWxlcnMgKi8NCj4+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5leHRfcG9vbF9pZDsg
aSsrICkNCj4+Pj4gKyAgICAgICAgY3B1cG9vbF9jcmVhdGVfcG9vbChpLCBwb29sX3NjaGVkX21h
cFtpXSk7DQo+Pj4+ICsNCj4+Pj4gKyNpZmRlZiBDT05GSUdfWDg2DQo+Pj4+ICsgICAgLyogQ3B1
MCBtdXN0IGJlIGluIGNwdXBvb2wwIGZvciB4ODYgKi8NCj4+Pj4gKyAgICBpZiAoIHBvb2xfY3B1
X21hcFswXSAhPSAwICkNCj4+Pj4gKyAgICAgICAgcGFuaWMoIkNwdTAgbXVzdCBiZSBpbiBQb29s
LTBcbiIpOw0KPj4+PiArI2VuZGlmDQo+Pj4gDQo+Pj4gQ2FuIHlvdSBkb2N1bWVudCB3aHkgdGhp
cyBpcyBuZWNlc3Nhcnkgb24geDg2IGJ1dCBub3Qgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcz8NCj4+
IEhpIEp1bGllbiwNCj4+IEkgcmVjZWl2ZWQgdGhlIHdhcm5pbmcgYnkgSnVlcmdlbiBoZXJlOiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvbW1lbnQvMjQ3NDA3NjIvIHRoYXQgYXQgbGVh
c3Qgb24geDg2IHRoZXJlIGNvdWxkIGJlDQo+PiBzb21lIHByb2JsZW1zIGlmIGNwdTAgaXMgbm90
IGluIGNwdXBvb2wwLCBJIHRlc3RlZCBpdCBvbiBhcm0gYW5kIGl0IHdhcyB3b3JraW5nIGZpbmUg
YW5kIEkgZGlkbuKAmXQgZmluZCBhbnkgcmVzdHJpY3Rpb24uDQo+IA0KPiBXaGF0IGV4YWN0bHkg
ZGlkIHlvdSB0ZXN0IG9uIEFybT8NCj4gDQo+PiBTbyBJIGRvbuKAmXQga25vdyB3aHkgb24geDg2
IHdlIG11c3QgaGF2ZSBjcHUwIGluIGNwdXBvb2wwLCBtYXliZSB4ODYgbWFpbnRhaW5lciBoYXZl
IG1vcmUga25vd2xlZGdlIGFib3V0IHRoYXQgYW5kDQo+PiBJIGNhbiBwdXQgYSBjb21tZW50IGhl
cmUuDQo+IA0KPiBPbiBBcm0sIHdlIGFyZSBub3QgeWV0IHN1cHBvcnRpbmcgYWxsIHRoZSBDUFUg
ZmVhdHVyZXMgdGhhdCB4ODYgc3VwcG9ydHMgKGUuZy4gQ1BVIGhvdHBsdWcsIHN1c3BlbmQvcmVz
dW1lLi4uKS4gU28gSSBhIGFtIGJpdCBjb25jZXJuZWQgdGhhdCB0aGUgcmVzdHJpY3Rpb24gaXMg
anVzdCBub3QgdGhlcmUgeWV0IChvciBwb3NzaWJseSBoaWRkZW4pLg0KPiANCj4gVGhlcmVmb3Jl
LCBiZWZvcmUgbGlmdGluZyB0aGUgcmVzdHJpY3Rpb24gb24gQXJtIChhbmQgb3RoZXIgYXJjaCks
IEkgd291bGQgbGlrZSB1cyB0byB1bmRlcnN0YW5kIHdoeSBpdCBpcyBuZWNlc3Nhcnkgb24geDg2
Lg0KPiANCj4gV2UgbWF5IG5vdCBoYXZlIHRoZSBhbnN3ZXIgcXVpY2tseSwgc28gaXMgaXQgZ29p
bmcgdG8gYmUgYSBwcm9ibGVtIHRvIGtlZXAgdGhlIHJlc3RyaWN0aW9uIG9uIEFybT8NCg0KSSBh
bSBvayB0byBrZWVwIHRoZSBsaW1pdGF0aW9uIHRvIGhhdmUgZG9tMCBhbHdheXMgcnVubmluZyBv
biBjcHUwLg0KT25seSBsaW1pdGF0aW9uIEkgY2FuIHNlZSBpcyB0aGF0IG9uIGEgYmlnIGxpdHRs
ZSBzeXN0ZW0sIGRvbTAgbmVlZHMgdG8gc3RheSBvbiB0aGUgdHlwZSBvZiBjb3JlIG9mIHRoZSBm
aXJzdCBib290ZWQgY29yZS4NCkJ1dCBhcyB0aGUgdXNlciBjb3VsZCBtb2RpZnkgaGlzIGZpcm13
YXJlIHRvIGJvb3Qgb24gdGhlIHR5cGUgb2YgY29yZSBoZSB3YW50cywgdGhpcyBsaW1pdGF0aW9u
IGNhbiB1c3VhbGx5IGJlIHdvcmtlZCBhcm91bmQuDQpTbyBpdCBpcyBub3QgYSBwcm9ibGVtLg0K
TWF5YmUgd2UgY291bGQgbWFrZSB0aGF0IGFuIHVuc3VwcG9ydGVkIGZlYXR1cmUgdGhhdCBvbmUg
Y291bGQgYWN0aXZhdGUgdGhyb3VnaCB0aGUgY29uZmlndXJhdGlvbiA/DQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

