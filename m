Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7E570053
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 13:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365053.595093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oArW7-0002dQ-U7; Mon, 11 Jul 2022 11:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365053.595093; Mon, 11 Jul 2022 11:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oArW7-0002aT-RN; Mon, 11 Jul 2022 11:23:55 +0000
Received: by outflank-mailman (input) for mailman id 365053;
 Mon, 11 Jul 2022 11:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oArW6-0002aN-G2
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 11:23:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f17613bc-010b-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 13:23:52 +0200 (CEST)
Received: from AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::14)
 by HE1PR0801MB1721.eurprd08.prod.outlook.com (2603:10a6:3:7f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Mon, 11 Jul
 2022 11:23:48 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::e4) by AM6PR10CA0001.outlook.office365.com
 (2603:10a6:209:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Mon, 11 Jul 2022 11:23:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 11:23:47 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Mon, 11 Jul 2022 11:23:46 +0000
Received: from da329d17446c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D645E9D0-1D26-4EF3-82D5-C8B72EA2F4C8.1; 
 Mon, 11 Jul 2022 11:23:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da329d17446c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 11:23:40 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB5995.eurprd08.prod.outlook.com (2603:10a6:10:20b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 11:23:39 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 11:23:39 +0000
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
X-Inumbo-ID: f17613bc-010b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SG/M3MzvSJad01372ym8tIkffaRwkIzuwkln/rURJ76+BTqSRyacbY1em2/EPqqYQSOdRixUKWPFWYt13f+lRBd34Edah6fmYa009DZD1MS4dTbm0xqeT48tVjEM7HZo709VI6I1+GNXi4dYkoIi4dd8ORWCZ8+CbOAkc2cWMZJbHt57/ueuOPcJA7kRGBzkwdlePE2ibhpmPfdJ2SPTE+62XnDQ9M9f9MzXYgXjPV49h0EdEtxc9pPbBoDi91dvUPQvhXb1k6K/TJEmjFR5IsxNZH7T5tfzxJ6u1JdyPXgWN78WJI03jwVjw/twWVh/z7gN89u9jkcQ4/Ng+LrynQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN/GkaxPwYjGzD08RCc4EsgGEq81YgTeTdA1sugD3YA=;
 b=OyRH0Rqo3eBdJPJ8cUCsL2Z7p/+p/oUMDdJ4D4NDHqKNQG8pfbXrgsCN8rtQwUc3NYXPPYZLPUJRKM2UkUKDKdV9Brzu02cJWZgjkD+D4PUhcVb5MBe58kmR/89Ps14p+0NFMjoAwPNtAOzTwoGP37rmCQDION85131INV7Tp+TbplJgCk4IhQO3V+uW5OZ3aUcpudtZFkw7bRu+ByYvuR8uCItg5R0hcVBqere8V7vfv5M+9yb3fS2ktBeXtefrQJ4820KM0HUOnZS7gAuLajKct/pbbSmHfqP9PU/85l3LBf8ezFAXSSH6pU0Ir3Nj3oGr5fKbjHLMzGUXyxspdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN/GkaxPwYjGzD08RCc4EsgGEq81YgTeTdA1sugD3YA=;
 b=Ze6lglozyWWNgM9E41FhToHJgj1/tAy851MHFenWAMnckKTfg2Vpk3EM2gzUQXsGj2osKbWrO8py0LSHnzCbKGThD0hhsKC0Qfi3mU4gJsVocL78zcZvaEzbVgWG9KGFN2nX6X3zvnI8xlI6nD+cOoay0hEYH17t66EONxiZuAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2816708d7d24dbd5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ7qo11Vv3ekMvdAsGPL1aggKgPQZV8bJYbRtEFESCiMwhQWN6A6JNgDCXMkPhOsvgULoBGBj4Ssr5k7kt8XgKbV98mUglyMDLccPknaIjGt/DBoHbxHJq/QpYLne/BnhSgxJEh6ue7YD7mf6CfTj10sYrY0pwAMcaILKYId7Xu+FU9MVekGwQjgnaxZ+sD7UWFb5wCfDxlQpRItfKAVXXPWLtaPBtfC4LCsT/Vrj7aOUzvTSHRQkXuQ7kuUrfU6h/yw3QCKvhobdK2xnHIyNJp+i614k90iH8IutXX1qCM+vuDUppIRC8WDGU7cFqa39c7hV1uPT4t7H8qsWASAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN/GkaxPwYjGzD08RCc4EsgGEq81YgTeTdA1sugD3YA=;
 b=W9XKsgBDVqeVnYKlvyEmiQ0L4Dg7cuAM3n/EljXZ9/Ur3xQU2wuf3d0Dd7nLz/Xx5BVFX93SkAZNjR+yBZQ54u+fnAMPUpej/vTRFXWTD/e6RPpN8M03bKyYJLq+PzBrxVV78pc05TYu61htoxj+tRedVuxfOhW6JJ7HsvVtun9a+JkjaEaWHYG7jmYfkyM+DpxRVGlihMup1IeQRqaqSsKXwzfvcMSO/bkQUJwFwSfSfAIkTeFq7ECetpGBkIASAVEloUUyWS28SlO3P5LX7Irpq0Ro4hYEixbhenSQUsAcWkPYnuRTcYy+LhJQnlOw1hvIfAQJ5tYbN9UKdP69Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN/GkaxPwYjGzD08RCc4EsgGEq81YgTeTdA1sugD3YA=;
 b=Ze6lglozyWWNgM9E41FhToHJgj1/tAy851MHFenWAMnckKTfg2Vpk3EM2gzUQXsGj2osKbWrO8py0LSHnzCbKGThD0hhsKC0Qfi3mU4gJsVocL78zcZvaEzbVgWG9KGFN2nX6X3zvnI8xlI6nD+cOoay0hEYH17t66EONxiZuAo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 05/25] tools/fuzz/libelf: rework makefile
Thread-Topic: [XEN PATCH v3 05/25] tools/fuzz/libelf: rework makefile
Thread-Index: AQHYh+Q0lHdw/SdCmkaxRBiHWRqzfK15IYuA
Date: Mon, 11 Jul 2022 11:23:39 +0000
Message-ID: <CB46C349-B894-48B5-87F0-0EE4FA20052A@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-6-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-6-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3c82c5f5-9db5-47c4-57cc-08da632fd2c6
x-ms-traffictypediagnostic:
	DBBPR08MB5995:EE_|VE1EUR03FT019:EE_|HE1PR0801MB1721:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 COgehf02xwHYMMIgxH9H7OkPAsT+Ahv998u+zhLKS7dvYy/CNWLD1MfS2yeolBvTz5BeX2gHZcYzYzEM0QUWxQHnvfM3JILw0BqV8ODCre3cBJ3NCVShwjQK/633XMfJrOZ1I0M5/US+JDyfB214jEnN+71VYxEiUCP2T31+cFr9jNFkoikLjDt70RnbToyBT717rpQPC3YnujwZ01havs1F5qUug9gWmZW7LMa8IykvJ+oR0ZezzkwjHM7v1joExQ/hn+AqT3yrQORzhR40F6v9SQvt8jwr7X+svqFO6EH2WFyXKPNTwaipZ/3h8BmP3B+PFfreiqcWYI/XSeJPw4Gl15apoE1aqV27ttIajj2lfknD3hjHl2OOz3rNUrThgPDqa4BdMwOMFQ9OOX8kM06y4vGO+c4togm+FP44MYJfUM2APTEsfRqxxfg2KprCcDrfhqQHDCAP4gHndLcg00DfqqLccJlYEIPm2DvDTouBqBhIA2ovWQaYiElY5lxfUJMIXHoad9b49kikETccLv0ZWPSjXBU2TKUTq2LKwn9KKkk7EltQ1GdONp14ahaXZLiqgK4rb1NPgKgw2Izv4TFzbjYEBXgyly+ld6m7TYH85WRv00e9uIJl7no9Gxh/rBTz4eFoyMksQrlWOe3MPweXceOGjtVl0zt7/ervNpVDV6Irz444cErQrbkwfiCj3GjewXSTyhDMIzjfaHQGuW2rUJXSqYiEZ10xAV1BJM9jezk5GGab6tWWJ7/MbbX8gsyv96TkWxeyzEBt0nswKM5AlsZ0lIi8oDjN1YszarvnMc3AKRrm0VLfuSUJw/PFGNP52kXxt19N4NMMtSpn4OHh1L5qbamkc1q2F9igzec=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(38100700002)(122000001)(186003)(5660300002)(6916009)(4326008)(71200400001)(54906003)(66946007)(66556008)(36756003)(76116006)(64756008)(91956017)(8676002)(316002)(66446008)(66476007)(41300700001)(6486002)(6506007)(86362001)(2906002)(478600001)(8936002)(26005)(6512007)(33656002)(2616005)(38070700005)(4744005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <65436ACC19D9BA40A6BFEAFBBB523A0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91a25d4f-236f-4375-eb42-08da632fcdab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1cOkul7gerVdVN05jG+/d+WaV8zGzDMRicwpByAYoyUyyss1z+UIK2TQs+6PVZXR5YpdfLcHCx7C+dtSQ6aFylXJ+s0CxTraMELRDDPdypKuUYKo8lu8ijJ5/2DCUFESvEXga8Fh4OdCf2uB+lP0XjiKN7qGt28xnxkKzp2ZVSJiY3NigUoMKFiWoN2WnaEcGqOLTqD2YTB0rZzOE5FsXttOk2fUuYQ0lU/WjkHPqeKQXp3h5cyzu3F93+JQkkI7CKvALMKidWwluZrRazFPaj6Tyiqh4D5oUJL/fVGV32IXmxnTWZ0iOHK8onjctOI6hgJUyiHYGmcus3xsayrPVmvSfFiGWvPFw4Ie6DNEyk74kYC2BOObEZHd3bLu9/aYie1pqe1deORsPgocko3mfU2a1iwaLtgLSSeC8j8tGKuTbm7yP9buxJDVA0rAhI9xG3ujnX5XoGt8pOWVRYJy/CJqvLzPS9rEFLG/Ziayi7jnz64/Oo2IRP7MBTJTuFX3Qdfg4EARjIZrubrMRaTn9HZA+nI5Md/wBx/eF5Y04zAeY5CBO6RPZWMpZkZ4VaevKocsNyDlQ8wfXc63+cLzLOGIi33n9gmz2Zb/uQAtFgNJqu4W/+RRngf0qX2X00uZYQYE0/VVnWyD9ZeM4rij/JNihBV+ByyCjWCZrv3LrtBY6KNsniNIi98vtdcOnwj3t8Day99/7ND2LOqUB8ftINRy2+xeuPBt1X9+IblDUupV+AJpxRGSQ6mKFJVtm96VD3v06SmpCIzm9xN7OXeYcZtyfocdRId/lBS2cF0iaSKWz0b6hNm657OMCtJVMC/V
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(36756003)(6486002)(41300700001)(316002)(40460700003)(8936002)(33656002)(40480700001)(6862004)(4744005)(4326008)(70206006)(81166007)(5660300002)(82740400003)(6512007)(186003)(8676002)(53546011)(336012)(356005)(70586007)(6506007)(86362001)(54906003)(47076005)(2616005)(26005)(478600001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 11:23:47.6125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c82c5f5-9db5-47c4-57cc-08da632fd2c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1721

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBSZW5hbWUgRUxGX0xJQl9PQkpTIHRvIExJ
QkVMRl9PQkpTIGFzIHRvIGhhdmUgdGhlIHNhbWUgbmFtZSBhcyBpbg0KPiBsaWJzL2d1ZXN0Ly4N
Cj4gDQo+IFJlcGxhY2UgIi1JIiBieSAiLWlxdW90ZSIuDQo+IA0KPiBSZW1vdmUgdGhlIHVzZSBv
ZiAidnBhdGgiLiBJdCB3aWxsIG5vdCB3b3JrcyB3aGVuIHdlIHdpbGwgY29udmVydCB0aGlzDQo+
IG1ha2VmaWxlIHRvIHN1YmRpcm1rLiBJbnN0ZWFkLCB3ZSBjcmVhdGUgc3ltbGlua3MgdG8gdGhl
IHNvdXJjZSBmaWxlcy4NCj4gDQo+IFNpbmNlIHdlIGFyZSBjcmVhdGluZyBhIG5ldyAuZ2l0aWdu
b3JlIGZvciB0aGUgbGlua3MsIGFsc28gbW92ZSB0aGUNCj4gZXhpc3RpbmcgZW50cnkgdG8gaXQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4NCj4g4oCUDQpIaSBBbnRvbnksDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQo=

