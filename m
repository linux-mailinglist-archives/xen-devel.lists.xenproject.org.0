Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BE77720E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581878.911324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0fv-0006V4-S4; Thu, 10 Aug 2023 08:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581878.911324; Thu, 10 Aug 2023 08:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0fv-0006SU-PC; Thu, 10 Aug 2023 08:05:43 +0000
Received: by outflank-mailman (input) for mailman id 581878;
 Thu, 10 Aug 2023 08:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qU0fu-0006SM-Qf
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:05:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23628a8-3754-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:05:40 +0200 (CEST)
Received: from DU2P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::35)
 by GV2PR08MB8656.eurprd08.prod.outlook.com (2603:10a6:150:b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:05:37 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::b) by DU2P251CA0023.outlook.office365.com
 (2603:10a6:10:230::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 08:05:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 08:05:36 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Thu, 10 Aug 2023 08:05:36 +0000
Received: from b37406533283.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5159D727-7F3B-4A80-B3F6-A1440D0B9B4A.1; 
 Thu, 10 Aug 2023 08:05:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b37406533283.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 08:05:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB7522.eurprd08.prod.outlook.com (2603:10a6:102:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:05:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 08:05:27 +0000
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
X-Inumbo-ID: b23628a8-3754-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZD7CLFAqUvED8V61Les8HdNJWRfoQwW8H68dSyjoIw=;
 b=1VF3NtHXCmHQ0fqIW8jqJxTzKH8inJ3sOxed9ECBZhW4Q0Iixb6lOkahB1Z3gHx/mILRGw1OWIWZUtL3VeSvetR1W4lzvquyDcIsSOOpB6IiWjrXRacyi+6IHhgy67oJrXo3wkHo6KPGbmO1LoAJNy/W/UxNyo5dRWRIQZvaHoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6213792cd2192da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4vga6U14VwxOaE2uXhK3hPiWiLBY9bB95HI86X1jntBJXFAYhmo8lYq4LFlEQSbhLE+TecV2xkzg7n3H4rnhr/3wH49mmR+5C/nJf6Qix86xieqcySQ74Fr4ItooWLNZJCzdzmQSZTtDxfhB1ct+/BA8g83aw7woFO3lCQJDXya98y8CrMPVDhPUNqziMsiS+yHngnKtgHfT9RFzMJYQJ4hph/YlVniNO+UpYyBSsZI/kUXCqef3Pmg2/0tYN2k85vZvvMsJQwh1YCqp5dk+7NU5KB5aDXasv4EbyMX+fTigf33gcrkS4coYl9zW8FgS106ufqmyf1nISM1x5Gihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZD7CLFAqUvED8V61Les8HdNJWRfoQwW8H68dSyjoIw=;
 b=Y0IGfigGOvu88rI1+5BZvD9LL5jNA1WXND1BoAwQFAa8gcMeOW7pah/wr3dlfpGUgoSZNNr2Jvaesw2AY+dRArVZ+TrqgJbWRlw9W9drgPb8gdAkynwNi5T+0nyiy6rc2ATT/Zcy9yVDWdoReAI7UfGMRE28vr6JGc3ZdJLStKyUvY9nfigSM9uw5Y4ls/Vpq1YceJB8QK7U1NjFK3vW/vTAX1L/STvxFc5iNi2FG9UXGK9zeTlyXCZCtJdE3o3CneLyA2W4rQ2La8OEOEyrRrZGooECs4F+3GXsZ0jMKP7KCC0c7YmNV/UHKmV0AQIZVHWJsjtsGrAx9Kcsis45Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZD7CLFAqUvED8V61Les8HdNJWRfoQwW8H68dSyjoIw=;
 b=1VF3NtHXCmHQ0fqIW8jqJxTzKH8inJ3sOxed9ECBZhW4Q0Iixb6lOkahB1Z3gHx/mILRGw1OWIWZUtL3VeSvetR1W4lzvquyDcIsSOOpB6IiWjrXRacyi+6IHhgy67oJrXo3wkHo6KPGbmO1LoAJNy/W/UxNyo5dRWRIQZvaHoc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 06/13] xen/arm64: Move setup_fixmap() to
 create_page_tables()
Thread-Topic: [PATCH v4 06/13] xen/arm64: Move setup_fixmap() to
 create_page_tables()
Thread-Index: AQHZxCqVen/+EDcaZkm/mD7lV8P3ta/h8aoAgAFIywA=
Date: Thu, 10 Aug 2023 08:05:27 +0000
Message-ID: <9222878F-E2A2-4881-A984-D76B5A3A4430@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-7-Henry.Wang@arm.com>
 <1307da1d-5d56-4fe1-932a-c384323264ec@xen.org>
In-Reply-To: <1307da1d-5d56-4fe1-932a-c384323264ec@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB7522:EE_|DBAEUR03FT007:EE_|GV2PR08MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: f4237f7e-7b41-4f07-c91b-08db99789459
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3wXZKfFq/yh/TXlqH48nwAkbegcKK6jedmTBPko3FhvMmv/3Z6s9346Fblvz0Q3e2YRRDnSz7AAuxfPBCxpCVYsDGh2BpcQW5RXDGZVGtrLyYz1gw30Ooy9SeWdAyNBOzHxHCtUlZmwa30j6gxhnCRwjXYIdyhnOa3Ok6ay+03vVYgRaFVUDh33Nf5XidFFR4wxnCHkYSgqhwUOL2cZ8FYWSnLRJRDwMppXbS4EgfoU70FitA0zrbNCxW8+cjaJFLlKZcLUYDkPjWnZB7LrFjbpffldtGJycrIizQqiJXE4Sz1tFOJxyOabaianZcggzDRSpkZf9JemlJTO/NASi14vONLarfgcxIoLT2xQd6AVGcgH63EBJTvsUjSLGFDBKNIRkI8BnVTMdsQenQ8HG0YmYMHytQbKTbf/fmqigOsTnxcxaMQOpIQt6p8XqHSK2WlwlxikQVxP+hPQ8aD2kwdAP/UmXVDEQ7X2cWrkfAsz0rKrL3xob7+JUdQ6PjUYuy5ex7BgbYTgtU6ux6xe0xQ3qUmkA+rXWbnJYF1aV8pzY4b9LJhT5Gym0z4dRmO98TMSxu9Is8p7H7iFOQVM4dYUIzD2QB08Tz12tF5S7p90z/yBbSGmkU1OWm9yA8QCoc7/iJBI62AlFFqkTDYvE5g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(186006)(1800799006)(86362001)(76116006)(2616005)(36756003)(2906002)(33656002)(66556008)(8936002)(5660300002)(8676002)(478600001)(66446008)(38070700005)(64756008)(71200400001)(54906003)(6506007)(91956017)(26005)(6486002)(66476007)(66946007)(6512007)(4326008)(41300700001)(316002)(6916009)(966005)(38100700002)(122000001)(53546011)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <16AE7C9D69CB8548A0EADE0C881F1368@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	244360f3-4c76-4d5a-2fc7-08db99788f05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ul4FYMx0Grqk7sHFTfoZf4Z5Qjr4c9yW5IWLN2G0ELreNFoZzPgiQ7ba2ol/6ymccdwraPTvwJ/m2ekrBAzf/cHt9JpO/uk1wxLFY5jAK5GCsgnEpCkHJO1rSk8KFv13oW7QufFzzR+FA+wVqhbydNMd/A6L4jf6vqbr+gEVfZPzXPihYxfuj4ec8DrVFoMqtGYxmZ4wLxPJCFZU9IiTqhL3yvFXXJJmtLiN6tlUN0Br9Nm/WSnsI0oqpDh/faRAnM1LxswIaggpqdvh+Z8H+d6Cft8Y75mbOu3sriUadDcNczI52TojuqK+wk94IeonlnlozT5DUCqR/rrFk64gWw6Y6ebQPOfGMjohSQsk1O0oFXCPs09jHKT5OYyTag9FPOzpMhVy2xUxUPAUMSC/v3YhYsTJ3lK5CyXMcRHkLx2Pnm/Ku625tQdDjVfhFGXdM2Zuj/6HBnZLvBbtagYEFcNv3dMg5Vwy+MKGgSsMxtPX+72CCXTN8wPUNQkZFT6NwI0FYLbrqfXitXTKiP2V8E+92ix+mGRCErj/fawcihPtVrXMnTpPiOE31Azofi0z0/+ZXaDux85b6lYUjI0QvOZQW6BulGu1MTiO7adcw+ta/Ju3MucLSvpo9aOIdoKhnztQ1+QtQYPvslEno9XZHcmkvaSYLVABQk7itD8Zt0kGrvb7HoOtfQ6+V0PRPqozwKMkF26Pwc4ZSk4YR5n85TM96YBoBvchKlNJvNtrHMM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(82310400008)(451199021)(1800799006)(186006)(40470700004)(46966006)(36840700001)(26005)(6862004)(53546011)(6506007)(8676002)(8936002)(41300700001)(40460700003)(107886003)(36860700001)(36756003)(33656002)(47076005)(2906002)(83380400001)(2616005)(356005)(81166007)(86362001)(82740400003)(336012)(5660300002)(40480700001)(54906003)(70586007)(4326008)(70206006)(6512007)(966005)(478600001)(6486002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:05:36.6938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4237f7e-7b41-4f07-c91b-08db99789459
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8656

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyA5LCAyMDIzLCBhdCAyMDoyOCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IFRpdGxlOiBOSVQ6
IEl0IGlzIG1vcmUgYSBmb2xkIHJhdGhlciB0aGFuIG1vdmUuDQoNCllvdSBhcmUgY29ycmVjdCwg
dXNpbmcg4oCcZm9sZOKAnSBoZXJlIGlzIG1vcmUgYXBwcm9wcmlhdGUuDQoNCj4gDQo+IE9uIDAx
LzA4LzIwMjMgMDQ6NDQsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBGb3IgdGhlDQo+PiBmdXR1cmUg
TVBVIHN1cHBvcnQgd29yaywgdGhlIGVhcmx5IFVBUlQgbWFwcGluZyBjb3VsZCB0aGVuIGJlIG1v
dmVkDQo+PiBpbiBwcmVwYXJlX2Vhcmx5X21hcHBpbmdzKCkuDQo+IA0KPiBJIHdvdWxkIGRyb3Ag
dGhpcyBzZW50ZW5jZSBhcyB0aGlzIGlzIG1vcmUgcmVsYXRlZCB0byB0aGUgZnV0dXJlIGltcGxl
bWVudGF0aW9uIG9mIE1QVSByYXRoZXIgdGhhbiB0aGlzIHBhdGNoIGl0c2VsZi4NCg0KU3VyZSwg
djUgd2lsbCBkcm9wIHRoaXMuDQoNCj4gDQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4NCj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvNzg4NjJiYjgtZmQ3
Zi01YTUxLWE3YWUtM2M1YjU5OThlZDgwQHhlbi5vcmcvDQo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+PiAtLS0NCj4+IHY0Og0KPj4gLSBSZXdvcmsg
Ilt2MywxMi81Ml0geGVuL21tdTogZXh0cmFjdCBlYXJseSB1YXJ0IG1hcHBpbmcgZnJvbSBzZXR1
cF9maXhtYXAiDQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICB8ICAx
IC0NCj4+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUyB8IDUwICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCAzNCBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPj4gaW5kZXggZTRmNTc5YTQ4ZS4u
NTZmNjhhOGUzNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4+IEBAIC0yNzUsNyArMjc1LDYgQEAg
cmVhbF9zdGFydF9lZmk6DQo+PiAgICAgICAgICBiICAgICBlbmFibGVfYm9vdF9jcHVfbW0NCj4+
ICAgIHByaW1hcnlfc3dpdGNoZWQ6DQo+PiAtICAgICAgICBibCAgICBzZXR1cF9maXhtYXANCj4+
ICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USw0KPj4gICAgICAgICAgLyogVXNlIGEgdmlydHVh
bCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8NCj4+ICAgICAgICAgIGxkciAgIHgyMywg
PUVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTY0L21tdS9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUw0KPj4gaW5k
ZXggYjdjM2RkNDIzYS4uNmJkOTRjM2E0NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9h
cm02NC9tbXUvaGVhZC5TDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUw0K
PiANCj4gVGhlIHNlY29uZCBwYXJhZ3JhcGggaW4gY3JlYXRlX3BhZ2VfdGFibGVzKCkgbm93IG5l
ZWRzIHRvIGJlIGRyb3BwZWQuDQoNClRoYW5rcyBmb3IgZmluZGluZyB0aGlzISBZZXMgdGhpcyBz
aG91bGQgYmUgZHJvcHBlZC4NCg0KPiANCj4+IEBAIC0yMzEsNiArMjMxLDIzIEBAIGxpbmtfZnJv
bV9zZWNvbmRfaWQ6DQo+PiAgICAgICAgICBjcmVhdGVfdGFibGVfZW50cnkgYm9vdF9zZWNvbmRf
aWQsIGJvb3RfdGhpcmRfaWQsIHgxOSwgMiwgeDAsIHgxLCB4Mg0KPj4gIGxpbmtfZnJvbV90aGly
ZF9pZDoNCj4+ICAgICAgICAgIGNyZWF0ZV9tYXBwaW5nX2VudHJ5IGJvb3RfdGhpcmRfaWQsIHgx
OSwgeDE5LCB4MCwgeDEsIHgyDQo+PiArDQo+PiArI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsN
Cj4+ICsgICAgICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8NCj4+ICsgICAg
ICAgIGxkciAgIHgwLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MNCj4+ICsgICAgICAgIC8q
IHgyMzogRWFybHkgVUFSVCBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgKi8NCj4+ICsgICAgICAgIGNy
ZWF0ZV9tYXBwaW5nX2VudHJ5IHhlbl9maXhtYXAsIHgwLCB4MjMsIHgxLCB4MiwgeDMsIHR5cGU9
UFRfREVWX0wzDQo+PiArI2VuZGlmDQo+PiArICAgICAgICAvKiBNYXAgZml4bWFwIGludG8gYm9v
dF9zZWNvbmQgKi8NCj4+ICsgICAgICAgIGxkciAgIHgwLCA9RklYTUFQX0FERFIoMCkNCj4+ICsg
ICAgICAgIGNyZWF0ZV90YWJsZV9lbnRyeSBib290X3NlY29uZCwgeGVuX2ZpeG1hcCwgeDAsIDIs
IHgxLCB4MiwgeDMNCj4+ICsgICAgICAgIC8qIEVuc3VyZSBhbnkgcGFnZSB0YWJsZSB1cGRhdGVz
IG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJlZC4gKi8NCj4+ICsgICAgICAgIGRzYiAgIG5zaHN0DQo+
PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogVGhlIGZpeG1hcCBhcmVhIHdpbGwgYmUgdXNl
ZCBzb29uIGFmdGVyLiBTbyBlbnN1cmUgbm8gaGFyZHdhcmUNCj4+ICsgICAgICAgICAqIHRyYW5z
bGF0aW9uIGhhcHBlbnMgYmVmb3JlIHRoZSBkc2IgY29tcGxldGVzLg0KPj4gKyAgICAgICAgICov
DQo+PiArICAgICAgICBpc2INCj4gDQo+IFRoZSBEU0IvSVNCIGlzIG5vdCBuZWNlc3NhcnkgYW55
bW9yZSBhcyB5b3UgYXJlIG5vdCBtb2RpZnlpbmcgbGl2ZSBwYWdlLXRhYmxlcy4gU28gSSB3b3Vs
ZCBwcmVmZXIgaWYgdGhpcyBpcyByZW1vdmVkLg0KDQpTdXJlLg0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

