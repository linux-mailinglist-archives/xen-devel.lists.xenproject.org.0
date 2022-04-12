Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACAC4FD369
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303556.517860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDBZ-0004dz-FW; Tue, 12 Apr 2022 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303556.517860; Tue, 12 Apr 2022 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDBZ-0004c8-CQ; Tue, 12 Apr 2022 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 303556;
 Tue, 12 Apr 2022 09:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6AI=UW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1neDBX-0004c2-IK
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:51:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27677fdf-ba46-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 11:51:41 +0200 (CEST)
Received: from AS8PR04CA0163.eurprd04.prod.outlook.com (2603:10a6:20b:331::18)
 by AM4PR08MB2899.eurprd08.prod.outlook.com (2603:10a6:205:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Tue, 12 Apr
 2022 09:50:35 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::d) by AS8PR04CA0163.outlook.office365.com
 (2603:10a6:20b:331::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30 via Frontend
 Transport; Tue, 12 Apr 2022 09:50:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Tue, 12 Apr 2022 09:50:34 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 12 Apr 2022 09:50:34 +0000
Received: from 7ec17d0f6e68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1EEDF5F5-73E6-40F4-A10C-40BA31EC59A8.1; 
 Tue, 12 Apr 2022 09:50:24 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ec17d0f6e68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Apr 2022 09:50:24 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM5PR0802MB2579.eurprd08.prod.outlook.com (2603:10a6:203:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:50:20 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5164.018; Tue, 12 Apr 2022
 09:50:19 +0000
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
X-Inumbo-ID: 27677fdf-ba46-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asu0CyeScnBHv5f5vIkVFLQ6qpUK4+P2qZSyeGjOI/E=;
 b=pMCLBuzvURIEAxm9VzjaeUkHe3fsynCON3i6Y+DhAQfuVlK/sc5DVsrZToHM6Q+JWIx+bInEYQ03z0F94LCTVCncm5fO8UnepB4zHFV2nq81FbODTzH+3+0uQNl3oV/WrLRRRwo12fK82HfiJ9jVVTSpT6UItAUxWcgEb3H6tqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e8512fa307914e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDzT6W9lAgX5/+nu4O9pVwSAb0PzLu6j474SRxNqm2A1f1sEoMSqj7v2YJsRqTD6SQ2cbhBoHIU0VS4AJTnFUcS9cw76L/azC/gPl504FrBMI0PTG2aFh68Q0J2cu6wKWSfs/656tFdQU+Na+wSqpXsQtLe42ekq7pPdotGJ7jym6ckPBFtZV4nUFL0NaafXoVihc8bDPkVF+DRR4jsphL79XLGoLxl7AkhK8zvzQdFEdbgy8mnpMJWRpD9Gxikfvsc3T1nOU27PuACsr9UVHTtR/reGAoCdBG0Gxq5ITWp9tvFC1HegQZC8ZhIn66W15YOENR149ZHhGRL6CZKh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asu0CyeScnBHv5f5vIkVFLQ6qpUK4+P2qZSyeGjOI/E=;
 b=Z6jdYKs1IQQIPF79BLd2aDhTkBzfrstLXH6t7xOxbecwtfYfoODuBMxyDJVGDd+fc/yuQLRw2gkDSSfgGtVP72Bb9gsLSRCDkGFhuzEqXRVAob5LPXkup1nnlE5AUJwIQS/yMaU+9PaKRmjw+9YvI9uVeh0yh3icL3ytd4XhChrsskumeE75x/SN4TdLHI1OPMJnCPaEYS2bHwpqyiD3P3WwdB+vhKVDETFeItgtYKpj6v1fmFkPJt4AN7jg8rtsmYnQ3hCvhVnV0ahimjarDTE8TCJjGmMmT7lYxvCJDTS23t4DrthZ/v+LweY4GZbVTVBfhSg27aduhGUe9FMFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asu0CyeScnBHv5f5vIkVFLQ6qpUK4+P2qZSyeGjOI/E=;
 b=pMCLBuzvURIEAxm9VzjaeUkHe3fsynCON3i6Y+DhAQfuVlK/sc5DVsrZToHM6Q+JWIx+bInEYQ03z0F94LCTVCncm5fO8UnepB4zHFV2nq81FbODTzH+3+0uQNl3oV/WrLRRRwo12fK82HfiJ9jVVTSpT6UItAUxWcgEb3H6tqo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYTbfiNTg+IXy/G0GwaoqGDOL0yazq2Y4AgAEwcQA=
Date: Tue, 12 Apr 2022 09:50:19 +0000
Message-ID: <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
In-Reply-To: <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9aadea08-b703-4674-c7ae-08da1c69e3ea
x-ms-traffictypediagnostic:
	AM5PR0802MB2579:EE_|AM5EUR03FT020:EE_|AM4PR08MB2899:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB28995636B91803F93A70BC92E4ED9@AM4PR08MB2899.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OxOZv1BX6WT8KS8vhdUb5mZb2pK0q637o4eIsIwvpP3yDLIGXbLTd2rDETk4kuta66A3J6PPmRmP3ADEbfTOiSphenrLebup2ixv27lYQxxBlqkIRNKHuM6I1EybmjEIWhVYT2CGURVcbu9d2kyI8cUxTmwXPWs40D6L/itbY9oEkaOVNX/Z2EFenrTvHYztuF78xFjz/nfQ1rFkkDzMLxMoG8eG75pp5pTQJT9m4naBZkJzIV6oeW1aX2vEeM28e66g0+T1Xdm2PrnK65eNjvY5tcVRnReMMgyGFJnpLfWrfPVTa48UNTZ23IrwI2kJqSTPTVG1Rgt8zRgybdtHvdeounEX/MBVKQJw5V4jTt7LAe1hLDEpVAKq8+9bd/FjDQgJefviUOgZJ3Q1a3qT0qgx9gel28BCXKvzq8NgyEyCQTisQRzJJyePYpjLehtNepeE+awfO+N0KwoLqpwQdIthUeVCe45cLuTBCE0PsWWxKCiHzTf3DBwNqAwiWrWxXc2I7Xj84H8f+Y35XFREjlnouq+eiwCte+MSiL0GDtdBRwKIBcxRM97rAMlgQmKfKxVMaRZjyp3jojpnLbLKzlEsm28dlTxxClgY0Dv4TRda3xw4Bf8AzRzigEeKs7Qs2GrG4KITHxumGat5pM9a7HHrFhueiA3AGerW/Mxv0fQ87Mo+O5UWz1oah/T39BcE5rFDgDBBgL2RdtobbP0bSv8t6AG2xu/ZaFITbsFJhGtDl86d7mY/NZJiqRVVKIjf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(71200400001)(6486002)(36756003)(91956017)(86362001)(7416002)(4744005)(5660300002)(6506007)(66946007)(6916009)(2906002)(508600001)(316002)(64756008)(66476007)(76116006)(4326008)(8676002)(66446008)(66556008)(186003)(54906003)(33656002)(6512007)(26005)(122000001)(2616005)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7378AD8B2CF547468F0127F618F95353@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2579
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afd4bdf6-098c-45e9-4d0a-08da1c69db34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqjKytd5WbqCSdMcqugfVDAtjEyBnYkkr6uLmHY4wCdXMPd/WlTKYOl2YvEU4B6I9cBe4FxsYZTGTyyhsXIYbS4C36z+Tlo5vqbXca+zucJ75rzC7WYYOe7tNfxgpMUqaKH9UZOLslUD5BMaKmQYlqXzN3LQg3DhPo8q8ANghYbTrA8MZKpE4p2y/oDeW8SMTmd8Afi4Cv40RZ9bep03jJYItFmxzgOgdF0Hvw3nEOyCl8Z7snQoBohP9kcXxSweyiVNTdLTGy/R7WF0vsyC0t27Ms+atYrys/8pE4X15y+oLEViQk70h1NBCjuiJi2H+1GcIZaFxJ5xZ0hwvX+6bMylXkargWPpKOZUv+dTfU2T7ipCnSZIA6XrpvuNoIS3HyxvONLftsoNJ6x/37OGrdqkgY50G4CmLLMS+LG/4NwoJpXb8SmlLEGr3ZT6i6CEWP6dPcDJKFmrWOmxF+/OVix5e2DjorRUsOzlvfpMtrUUqHLljXyPbWWYl/IkGTuoMDIem1JjFMRNXvIOUeukn4dKFlHY83Tsm/ZSq5tZaeLe2bY8Bd40i+Znm95MED0LLiMTv2K+B+mAFS+uwztw2yOYjRl4viGtDFw1niXrUvFhDmF5ENZAw/EOxuHSowu2U2798SbwOs68CUS/LnyoyiipbdTOHvt6klxfFxF0OZwsP1xOIp/su2+sd2B2gz9A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(26005)(508600001)(86362001)(316002)(54906003)(6512007)(6506007)(4326008)(2616005)(6862004)(8676002)(70206006)(70586007)(8936002)(33656002)(36756003)(336012)(356005)(81166007)(6486002)(40460700003)(82310400005)(4744005)(5660300002)(47076005)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:50:34.6836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aadea08-b703-4674-c7ae-08da1c69e3ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2899

DQo+PiAtLS0NCj4+IE1BSU5UQUlORVJTIHwgMiArLQ0KPj4gZG9jcy9taXNjL2FybS9kZXZpY2Ut
dHJlZS9jcHVwb29scy50eHQgfCAxNDAgKysrKysrKysrKysrKysrKysNCj4+IHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyB8IDUgKy0NCj4+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zbXAu
aCB8IDMgKw0KPj4geGVuL2NvbW1vbi9LY29uZmlnIHwgNyArDQo+IA0KPiBGb3IgY29uc2lzdGVu
Y3ksIHNob3VsZCB0aGUgYWRkaXRpb24gaGVyZSAtIHdpdGggLi4uDQo+IA0KPj4geGVuL2NvbW1v
bi9zY2hlZC9NYWtlZmlsZSB8IDEgKw0KPj4geGVuL2NvbW1vbi9zY2hlZC9ib290LWNwdXBvb2wu
YyB8IDIwNyArKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiB4ZW4vY29tbW9uL3NjaGVkL2Nw
dXBvb2wuYyB8IDEyICstDQo+IA0KPiAuLi4gdGhlIG5ldyBmaWxlIG5vdyB1bmRlciBzY2hlZC8s
IGFsc28gYmUgcHV0IGluIHNjaGVkL0tjb25maWc/DQoNCkhpIEphbiwNCg0KSSB3YXMgbG9va2lu
ZyBmb3IgdGhpcyBjaGFuZ2UsIEkgc2VlIHhlbi9jb21tb24vS2NvbmZpZyBvZmZlcnMgdGhlIG1l
bnUg4oCcQ29tbW9uIEZlYXR1cmVz4oCdDQphbmQgdGhlIHhlbi9jb21tb24vc2NoZWQvS2NvbmZp
ZyBvZmZlcnMgdGhlIOKAnFNjaGVkdWxlcuKAnSBtZW51ICh2aXNpYmxlIHdpdGggRVhQRVJUKSwg
c28NCkkgdGhvdWdodCBpdCB3YXMgYmV0dGVyIHRvIGxlYXZlIGl0IGluIOKAnENvbW1vbiBGZWF0
dXJlc+KAnS4NCg0KQXJlIHlvdSBzdWdnZXN0aW5nIGFub3RoZXIgbWVudSB1bmRlciDigJxDb21t
b24gRmVhdHVyZXPigJ0/IA0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IEphbg0KDQo=

