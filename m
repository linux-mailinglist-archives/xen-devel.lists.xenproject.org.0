Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01995ACC09
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 09:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398518.639379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6EC-0007Yd-Ke; Mon, 05 Sep 2022 07:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398518.639379; Mon, 05 Sep 2022 07:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6EC-0007WE-GK; Mon, 05 Sep 2022 07:09:04 +0000
Received: by outflank-mailman (input) for mailman id 398518;
 Mon, 05 Sep 2022 07:09:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bd+d=ZI=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oV6EA-0007Vn-TR
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 07:09:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d7b03ac-2ce9-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 09:09:00 +0200 (CEST)
Received: from AS8PR04CA0207.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::32)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 07:08:58 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::9a) by AS8PR04CA0207.outlook.office365.com
 (2603:10a6:20b:2f3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 07:08:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 07:08:58 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 05 Sep 2022 07:08:57 +0000
Received: from 76ef96ecfdb3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B063553-31F6-4B55-BDC4-553C92EEE242.1; 
 Mon, 05 Sep 2022 07:08:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76ef96ecfdb3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 07:08:47 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DB3PR08MB8985.eurprd08.prod.outlook.com (2603:10a6:10:43f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 07:08:45 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 07:08:45 +0000
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
X-Inumbo-ID: 9d7b03ac-2ce9-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=afvDgb6RuGwykpHzY0NTwO2rLsZU4YPbbMb4ze3imRXYc6imd0KJtFp0cENMXneEZJy1O+TWWkdqzyO1yYZ7+65F7i9DWXVW92T7p/gLDSbz0es22lsr/Iijt76wS+eMghsp+sX5xV8mcqhrMXgPsJsa6Wu9ZKLkWNno3UXWKkk6WPV/tDDnxLrVvAUEafDnqy4wOyEDmXG+6pkyQU//BDPuYJCAbz1OVWl7ocmsByWwE0LyIqcqnPWwAhBG6dp38OLFYVGEIUvjfObY7oktYXaRtCFKQ3dj9BP6X7E/7btZrw+cYpVZqjxsS/vcdB31xxJLoiqXuKgsDl3SAyuwPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81EhxXJ+tLHvtuckNf5+P5UUedJHfF0Tr48WNZ+OcjM=;
 b=hw7QXHp0TVNuxawpetCkN4Mh63nEbkN7ZfkN+7yKwMm+h00SYf6YFt1dc2clRZpDHMzIoABtQEDBmzTL86GUVpLaQ0AoA7ZrcDKxPprHIr2WJVNEBRqu8BhyehJGgJ4dWALgcxRL8Cu/4lcGiOZI/7gQXaWG2c6QYSKrLlp6Cnsv6Y+2UyibCRsjYx+fn80dG4K4rTYntnE7DkbKmwzX3ZgigH5WcWxZB88MA3Vb5dQrK3jfQpnBPT/fuJwLtSpetIE/NZtFGqhyNDL1Hp+TCxxPl4x184Ur/sBfWxUUTRnHX4w0m2uJBgDgCQ34KZfcqK8/Rf9AXwFveXNGX4qaWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81EhxXJ+tLHvtuckNf5+P5UUedJHfF0Tr48WNZ+OcjM=;
 b=n/8tacabaqZsylb6u11SYmRSstcJHmUc+PxCYthzDCFQYQE3rGTfBJkIj/pGLiuzP4keo7LNTR0xc1K7fu2cZlwJjeu7PihaYF2meLIQye+BptygVnH3pkqsErTT79z24qnUEXrq+xOCYxQfk9ioQkahZiIw/etyY+OvJeZ+VDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du/jDcKlJjOcXFu1hZHFw9c9qGpvEEPrQcgjQItliHsIgjIljGvP0rvGBP/TQislTVkl7r8J4uluYXlbegz9ruW55spTwqcNBRCfxPPS2SbLE8Lc3uc0OEujfY4mywKO2+aw9dO4C5XTkXh8eN6jjcENxgYYgVrHSjTBBL7RfgKuReI8M0/j1Z60jvFavCvEMhT/qCi3MHw32QEBPrQUio/j2CndxMzzuRu5VA6XWvjBRVUTlT4XQCsPhk0WF7JTydkOHiSP2stFfX2IuSl2bfYzUsf776P1syNLphz9jOt5TauX+VgPMmXkpxQUpINZ9ohfcwBd0JV5HMMGFUSCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81EhxXJ+tLHvtuckNf5+P5UUedJHfF0Tr48WNZ+OcjM=;
 b=MylNE34wSFtbNnG4cIZaldN9EcKiGEn2gSm5Ca7OZ3NN6YnUDunzgeW6c2Ef8SmsYJ53h2e7iMUM16l0BacFldYjSdOoFoLzcbgA/1Ak7Clsq99co0ulgWX7hktOtRX1hq1oQJ6XvMU2Vyc/xi8q278PI4HxCFlku3HyDk/UBi2GgsbT8R7R/m45TlFJun+1U1VjlJWT8dBl8k7weFl9qjh+Ug0cF9KPvhqRtMY+1sw9rL4Q6C1TRVzjJexW2nfaWjKTTliPM+JqCSInJ145wjkPydU8jhwNoXneyUhjxFRHuaKM+NYiC/neRwJ9AKX96bb1ghlLgw710Fnr+bjGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81EhxXJ+tLHvtuckNf5+P5UUedJHfF0Tr48WNZ+OcjM=;
 b=n/8tacabaqZsylb6u11SYmRSstcJHmUc+PxCYthzDCFQYQE3rGTfBJkIj/pGLiuzP4keo7LNTR0xc1K7fu2cZlwJjeu7PihaYF2meLIQye+BptygVnH3pkqsErTT79z24qnUEXrq+xOCYxQfk9ioQkahZiIw/etyY+OvJeZ+VDk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYsRk4bhBJQxIp9UysK0xEJzOLuK2y32KAgB2pAvA=
Date: Mon, 5 Sep 2022 07:08:45 +0000
Message-ID:
 <AM0PR08MB4530A910E43B82D9B5226F42F77F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-9-Penny.Zheng@arm.com>
 <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
In-Reply-To: <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F44CA4A3385D094EBFCE5DEC597B9CB2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9081c912-4578-4d0b-08bf-08da8f0d80a4
x-ms-traffictypediagnostic:
	DB3PR08MB8985:EE_|AM7EUR03FT010:EE_|AM7PR08MB5301:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NodsnuQBnjCbOyY2yPZL4KCaOo5quDWVlIWKzx68mkbMmcHgryLvNPQ6hf0PaMpdNMLy5l0oyciPTcTX0sH21sVoa9OvR0WOR0iPrlQ2ylS3jYCWXS/3s8weZErRdhiY0lubveTog0sLTE9eqLsg46jM/A+pyv2DqVDAhk/QDQ8oOePdV6zqvK4yTGr2oC3OmnLUJfubBWYvzj6LEPOvoY+ONG8IfO0MKtlFJ7TejYyZ8WX1zlb/2jbBNzBs9LRx/+AV3mhyWuJjZEZvW9G17xejJg8b0rj6/mZg/MvcgX2vWkStBIMpmF5E+Pz6uLYV22N9Q4T6NMpG74nvQldwDb+SKYLkRn/8Tq09bgjsOFg6HBNfMVCEs6ox/SaEhIppS5VAq9uar06kl4tKTWXXZ/1ubwKio/RizaixDTuZXe3Na9b5M5NsAFvqQ4qQs/UAiAPYAiOemqwiViKQAkSsMqPUwCWwxKimuPNEYbPnaL6xJgkMSao5aKqCkPW5BTOkWoM7Y9sdKbPvoQ2447KZ0k4wg2CzuCNtzwf5uMEbjh+UJj10i/3BLy4KSeFzclfthC9RCmz4i7eU5d650twqa5H8zIdrZBFS0hX7uasNt0mEy4lb4aWYgCX4t3W5R5LCtXLvtetMd9RUL+0+htwh0RJxgFq1Uti4zdNNrIYN2LL3jflHP5piWkDAvnZnqOS4q0Ea8h9cukIhNPYapoUhMykGXHrDs6nOp259y6AqSp7qJ7NWU6Q7trpWdKDbfeDgGQL0Ejj9S1kJJx+xbe3NGQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(39850400004)(376002)(136003)(6916009)(54906003)(9686003)(83380400001)(71200400001)(41300700001)(55016003)(186003)(478600001)(6506007)(26005)(7696005)(53546011)(86362001)(38070700005)(66946007)(66556008)(66476007)(66446008)(64756008)(33656002)(38100700002)(4326008)(8676002)(76116006)(5660300002)(2906002)(52536014)(316002)(122000001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8985
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4e5b792-d673-4dbf-a5f6-08da8f0d792d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ryc14i1TfFTsX32xopMBKBcPPKXgxUovkLPYZsaLa/4EcxUVORTjQRrO+lKbJ5UKO0f1iGh5mntdrS468ff2+E/am58+o3TK+u2TBdpH/obSxhBNYNhYDrcn+r47JQyMtUjkciBadL8BNMuykwpsquPI/ygWzQjOUtG1WA2RuTfHH4SziGnXVq+pF1xVj5wKQvPy+mF21DiA0L7n0UZsfxH1BgxLyXjZfhfF6hPu6Tbrf+qHx6WIF3hjMCKMnL5iVcT95ttialQle2JrZQxXHC/li5PhXOVFa/l52lgdGjW8cZcl06bJ0if1GcG6vdG6/cq0T9gOoNsWqf8qjMKV0KUIpcEXrVpmCGhYaiGvZkcMXq053dZUP9pdYxzvyuFkWOZu/SZzV1eKPQqGZpYLtzgdVQ9KxlIAE73lwxBUp81DQWf4XmgdiOhbJ8AEfkBNr7hZgclpnRCiWFkn1Bccudnybzr1nTSBomnEhCgMI8Dt2OwRAO/xWB1TRlnaIuS6uGPvqU2cJY5i7C9+gz26jqF2JCtZLaCQw3nWfp5XCpKlwPIdp0PEkk7Zn2bPxlmNJjByyzlUuWquWDC+OMj76bvu53AA/bd11duBLICNKtz5FACUH6RfSVa+X2OI3UUI5nl8OrPcaWgO0IOx3tOlWp3G0ekAUJ1k0pXsnMgwO5A8eeWeD5JKE1jZGP4DPLqargSBfEVuUhwvBnkP3jp5cpF2t/Mz3aM7dTSEoECeZC23NsgfOxfuPgw6ykKIYUX6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(46966006)(36840700001)(81166007)(356005)(36860700001)(82740400003)(83380400001)(4326008)(8676002)(70586007)(82310400005)(316002)(54906003)(70206006)(55016003)(2906002)(9686003)(8936002)(40480700001)(6862004)(53546011)(6506007)(47076005)(5660300002)(336012)(186003)(52536014)(41300700001)(7696005)(478600001)(86362001)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:08:58.1302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9081c912-4578-4d0b-08bf-08da8f0d80a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301

SGkgamFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTcsIDIw
MjIgNjowNSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENj
OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCA4Lzld
IHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFnZXMgb24NCj4gcG9wdWxhdGVfcGh5c21hcA0KPiAN
Cj4gT24gMTYuMDguMjAyMiAwNDozNiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gQEAgLTI4Njcs
NiArMjg1NCw2MSBAQCBpbnQgX19pbml0IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzKHN0cnVjdA0K
PiA+IGRvbWFpbiAqZCwgbWZuX3Qgc21mbiwNCj4gPg0KPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4g
IH0NCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIEFjcXVpcmUgbnJfbWZucyBjb250aWd1b3VzIHBh
Z2VzLCBzdGFydGluZyBhdCAjc21mbiwgb2Ygc3RhdGljDQo+ID4gK21lbW9yeSwNCj4gPiArICog
dGhlbiBhc3NpZ24gdGhlbSB0byBvbmUgc3BlY2lmaWMgZG9tYWluICNkLg0KPiA+ICsgKi8NCj4g
PiAraW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBt
Zm5fdCBzbWZuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBucl9tZm5zLCB1bnNpZ25lZCBpbnQNCj4gPiArbWVtZmxhZ3MpIHsNCj4gPiArICAg
IHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+ICsNCj4gPiArICAgIEFTU0VSVF9BTExPQ19DT05U
RVhUKCk7DQo+ID4gKw0KPiA+ICsgICAgcGcgPSBhY3F1aXJlX3N0YXRpY21lbV9wYWdlcyhzbWZu
LCBucl9tZm5zLCBtZW1mbGFncyk7DQo+ID4gKyAgICBpZiAoICFwZyApDQo+ID4gKyAgICAgICAg
cmV0dXJuIC1FTk9FTlQ7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBhc3NpZ25fZG9tc3RhdGljX3Bh
Z2VzKGQsIHBnLCBucl9tZm5zLCBtZW1mbGFncykgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKg0K
PiA+ICsgKiBBY3F1aXJlIGEgcGFnZSBmcm9tIHJlc2VydmVkIHBhZ2UgbGlzdChyZXN2X3BhZ2Vf
bGlzdCksIHdoZW4NCj4gPiArcG9wdWxhdGluZw0KPiA+ICsgKiBtZW1vcnkgZm9yIHN0YXRpYyBk
b21haW4gb24gcnVudGltZS4NCj4gPiArICovDQo+ID4gK21mbl90IGFjcXVpcmVfcmVzZXJ2ZWRf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpDQo+ID4gK3sNCj4g
PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7DQo+ID4gKw0KPiA+ICsgICAgQVNTRVJUX0FM
TE9DX0NPTlRFWFQoKTsNCj4gPiArDQo+ID4gKyAgICAvKiBBY3F1aXJlIGEgcGFnZSBmcm9tIHJl
c2VydmVkIHBhZ2UgbGlzdChyZXN2X3BhZ2VfbGlzdCkuICovDQo+ID4gKyAgICBzcGluX2xvY2so
JmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4gKyAgICBwYWdlID0gcGFnZV9saXN0X3JlbW92ZV9o
ZWFkKCZkLT5yZXN2X3BhZ2VfbGlzdCk7DQo+ID4gKyAgICBzcGluX3VubG9jaygmZC0+cGFnZV9h
bGxvY19sb2NrKTsNCj4gPiArICAgIGlmICggdW5saWtlbHkoIXBhZ2UpICkNCj4gPiArICAgICAg
ICByZXR1cm4gSU5WQUxJRF9NRk47DQo+ID4gKw0KPiA+ICsgICAgaWYgKCAhcHJlcGFyZV9zdGF0
aWNtZW1fcGFnZXMocGFnZSwgMSwgbWVtZmxhZ3MpICkNCj4gPiArICAgICAgICBnb3RvIGZhaWw7
DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBhc3NpZ25fZG9tc3RhdGljX3BhZ2VzKGQsIHBhZ2UsIDEs
IG1lbWZsYWdzKSApDQo+ID4gKyAgICAgICAgZ290byBmYWlsX2Fzc2lnbjsNCj4gPiArDQo+ID4g
KyAgICByZXR1cm4gcGFnZV90b19tZm4ocGFnZSk7DQo+ID4gKw0KPiA+ICsgZmFpbF9hc3NpZ246
DQo+ID4gKyAgICBmcmVlX3N0YXRpY21lbV9wYWdlcyhwYWdlLCAxLCBtZW1mbGFncyAmIE1FTUZf
bm9fc2NydWIpOw0KPiANCj4gRG9lc24ndCB0aGlzIG5lZWQgdG8gYmUgIShtZW1mbGFncyAmIE1F
TUZfbm9fc2NydWIpPyBBbmQgdGhlbiAtIHdpdGgNCg0KSSBnb3QgYSBiaXQgY29uZnVzZWQgYWJv
dXQgdGhpcyBmbGFnIE1FTUZfbm9fc2NydWIsIGRvZXMgaXQgbWVhbiBubyBuZWVkDQp0byBzY3J1
Yj8gDQpTaW5jZSBJIHNhdyB0aGF0IGluIGFsbG9jX2RvbWhlYXBfcGFnZXMoLi4uKQ0KICAgIGlm
ICggYXNzaWduX3BhZ2UocGcsIG9yZGVyLCBkLCBtZW1mbGFncykgKQ0KICAgIHsNCiAgICAgICAg
ZnJlZV9oZWFwX3BhZ2VzKHBnLCBvcmRlciwgbWVtZmxhZ3MgJiBNRU1GX25vX3NjcnViKTsNCiAg
ICAgICAgcmV0dXJuIE5VTEw7DQogICAgfQ0KSXQgZG9lc24ndCBjb250YWluIGV4Y2xhbWF0aW9u
IG1hcmsgdG9vLi4uDQoNCj4gYXNzaWdubWVudCBoYXZpbmcgZmFpbGVkIGFuZCB3aXRoIGl0IGJl
aW5nIGp1c3QgYSBzaW5nbGUgcGFnZSB3ZSdyZSB0YWxraW5nDQo+IGFib3V0LCB0aGUgcGFnZSB3
YXMgbm90IGV4cG9zZWQgdG8gdGhlIGd1ZXN0IGF0IGFueSBwb2ludCBhZmFpY3QuIFNvIEkgZG9u
J3QNCj4gc2VlIHRoZSBuZWVkIGZvciBzY3J1YmJpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiAN
Cj4gQWxzbyBJIHRoaW5rIHRoZSByZW5hbWUgb2YgdGhlIGZ1bmN0aW9uIHdvdWxkIGJldHRlciBi
ZSBkb25lIGZpcnN0LCBzaW5jZSB0aGVuDQo+IHlvdSB3b3VsZG4ndCBuZWVkIHRvIHRvdWNoIHRo
aXMgbGluZSBhZ2FpbiByaWdodCBpbiB0aGUgbmV4dCBwYXRjaCwgYW5kIHRoZQ0KPiBwcmVwYXJl
L3VucHJlcGFyZSBwYWlyaW5nIHdvdWxkIGFsc28gYmUgdmlzaWJsZSByaWdodCBoZXJlLiBUaGlz
IHdvdWxkIHRoZW4NCj4gYWxzbyBiZXR0ZXIgZml0IHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBw
cmVwYXJlXyooKSBpbiB0aGUgcHJldmlvdXMgcGF0Y2gNCj4gKHdoaWNoLCBhZmFpYywgdGhlIG5h
bWUgY2hhbmdlIGNvdWxkIGFsc28gYmUgbWVyZ2VkIGludG87IEZUQU9EIEkgZG9uJ3QNCj4gbWlu
ZCBpdCB0byBiZSBzZXBhcmF0ZSkuDQo+IA0KPiBKYW4NCg==

