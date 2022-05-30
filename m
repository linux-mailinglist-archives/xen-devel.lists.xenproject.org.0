Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D36537364
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 03:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338324.563086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvUUg-0007Cg-KL; Mon, 30 May 2022 01:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338324.563086; Mon, 30 May 2022 01:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvUUg-0007AY-H3; Mon, 30 May 2022 01:46:54 +0000
Received: by outflank-mailman (input) for mailman id 338324;
 Mon, 30 May 2022 01:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NCsk=WG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nvUUf-0007AS-GJ
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 01:46:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0fb39b-dfba-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 03:46:50 +0200 (CEST)
Received: from AS9PR06CA0268.eurprd06.prod.outlook.com (2603:10a6:20b:45f::19)
 by VI1PR08MB2638.eurprd08.prod.outlook.com (2603:10a6:802:1f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Mon, 30 May
 2022 01:46:44 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::48) by AS9PR06CA0268.outlook.office365.com
 (2603:10a6:20b:45f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 01:46:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 01:46:43 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 30 May 2022 01:46:43 +0000
Received: from cb9874afc670.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9EB1739-4219-49AD-B879-1E001EE9DC3E.1; 
 Mon, 30 May 2022 01:46:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb9874afc670.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 May 2022 01:46:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB7PR08MB3564.eurprd08.prod.outlook.com (2603:10a6:10:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Mon, 30 May
 2022 01:46:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 01:46:34 +0000
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
X-Inumbo-ID: 5e0fb39b-dfba-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QaCiUhp9l/wTlHr5+/CVEZQod3NwqzOsA+O+WvIBjhRvYCxLgfoC3ywsHPj/0tfobYlaM1rM1csMzbAHgntqy+q1Uh7hXBYHKid7z6Xcdjov1+vHuoV4dEN5Vd245cT90ihuF13Vvt+n/WcFujQtbcL0Lt2ArJhSG98YU1Pa7bK14MO3rgVqjtdiynzVuUrTAauVi7WLecVJtkWtQ88RQwKnK3obhjlS+cXBMHir2SZd0V5oceekrGIq3u4Lc94ApfApNK3Ma8Cjck59k12Hbl8na419rhQGjlbQGra/zFm1ZDjOVaSy4gTE3+ULgnhNgO42/GeJopcFTkVl3lTmZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IygYdjhWRBIlBtx6R14du6juZZZeYS99CvQ/hCkgHLo=;
 b=BMKN/v7blcikn7vE3TlMFr0sBl86S1dG8O8ZsG6u01Bmea5AI820aG9qHoKfd7FBiv2XeU886RlzUIMgs8+13avJvMgSCJ7/duv9+ArFm89NsQ4swVvdtEbHbT8huaXztnX0zcktnrcp5MSNOGbVy5Kk596CWts1jCh4uM7WMAnQ5nlH62aSq4yKuzNYVeSgSumpPL91olYvOMml7HkfQyRVINe6M7zQUFugvx0JzJjTepdu2yGdMNiVvJknbxtW2S1D34fjLKNv00rMKtw1WbgwJZFCKKpj5KfbW+HS34DoQTCNK/TPuLRKoJ9GuBAdVXp1B8XAYwG+ljafXPDyUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IygYdjhWRBIlBtx6R14du6juZZZeYS99CvQ/hCkgHLo=;
 b=jq/NnpwoHVQCFIeO7pu1V+9/gQvkyYcycYOCKAZgL0Zsbuqr+qKuEQgVzmoWLtSNK8SS6V5Vn/sPpt3cOT3HBETioXAktzyWrCiwxMjikk2JpRNWnbSN8lH+k7fqzO6x9fDqMs02Ux0Hp1Y49qy6qgMlLk+TdwC9n3x5KT5Kxfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frjy8YMUM5ZM9foWZAdi1FYK1F3Aw2JgMOq/d6Mbz8jRzo+SJusYfhiLbgqHv75XvZ8EZC580o3avAfwm4pcoVIIhXg7xTF2Shpj1BSDfyVWqqZwUZOyVpdxGAXYH8Ukc+LdETuQjCzo4xZkVvwEpryLJkUsgaYIpxKtykLfL5P/d8VSq8X30VTdueKRhkM+a2o+hn7bcLXTWjhRzFjWxidn4EexKGZyY57YOSxSMZoQQdgAGFjLYmdiVrZ+UWR5wSeOKKW+bzhnOTrI+PPjTbCpfxQ0XGVtJfBGTx9BhRIFZduEPnyr3e8poLGenbjpyVEG5oGqMZS3Gs63nqr+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IygYdjhWRBIlBtx6R14du6juZZZeYS99CvQ/hCkgHLo=;
 b=FqJi9V7cpkscWVSIDYrZbTSqTg8JZFxT/unw95cjAAth0Cd6hJaJ+P9spGLT3cxMlPupUKWT15VK++UDD1bwG6xzATa9CiwxTi4ns3p/7me0fVWsWq21e892h4dK6Q7M1xeHzZp+ckW2N8cIQhyMuzeITyMqPzPvesEinh2YXtMVpb700rEoWsa6pXshbW1XPeYOy2avlYO8X4/y/gefMyKC+M4HEVC8hW9cRFeujJoL29qb7IMk/4eXBEHrBvu2XfxxoXhkguyweLLrHz1W0/bHwqLrzR2dNspW33iKi6QXG1cSKz5qc4mVQYZCTZS7+BQ/NS2HIII8Q3ymI3BdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IygYdjhWRBIlBtx6R14du6juZZZeYS99CvQ/hCkgHLo=;
 b=jq/NnpwoHVQCFIeO7pu1V+9/gQvkyYcycYOCKAZgL0Zsbuqr+qKuEQgVzmoWLtSNK8SS6V5Vn/sPpt3cOT3HBETioXAktzyWrCiwxMjikk2JpRNWnbSN8lH+k7fqzO6x9fDqMs02Ux0Hp1Y49qy6qgMlLk+TdwC9n3x5KT5Kxfs=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Wei Chen <Wei.Chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Topic: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Index: AQHYbm4b7teAW0SaSEyIBxFEWwznXq02r7pg
Date: Mon, 30 May 2022 01:46:34 +0000
Message-ID:
 <AS8PR08MB7991036FEC9BEBCBD1B1F08892DD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
In-Reply-To: <20220523062525.2504290-8-wei.chen@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 66A0B2BC6AAEFD4EBC3AC3B68FBA85A0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dd48f5fe-2d16-4b2c-e7f7-08da41de401a
x-ms-traffictypediagnostic:
	DB7PR08MB3564:EE_|VE1EUR03FT046:EE_|VI1PR08MB2638:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB263892C5BF5CE75705F9C2AE92DD9@VI1PR08MB2638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eijAvzgfscQ0FVsgO6KqrgCxNgK8ZM17uB0d48lAwSgEK4EANQUC3k5jSEnyEpbqFm92DyPYO0mzvLBB13TYpyCP37FaaoDDnOjsk5A1sbbU/EOrQKreZa12YLhkygON2Cmi8x2UYuj5v/7pZPHKL62RD+hf4aJLwSj2Um49RV1Qi/5ZEYdEE/aT8jZHjwBhARtHVXjNL4mJ7MogoGYE+rI0kreqvR0CoyYTws7sp3uBNSgA7dG8Ph1T7TWa1f5TOSNvrGIG5i0Amr/PWOdA6NOorc3PE1dpWXBfXEx6sPybfWaam1r+9lMiFw6Q+4V+dBTwWII9arOJH3ljyzmqr4wL9RU9KDv41PF8iV4EVduB2viacgqiN2K9Bs7bCL++VdUFXNo4g9L5HBCL0YKwK6k7rQpTai01hI+AAZqTXbjVTS6B0voSNkC+CyJTpd529tIAqM/DmERgkFJQJyhUBFOso2kwYblZjegqPcx1WuIEWoL6h+igTEw1DO6QIlBMmXBDMYtA4wmLWYigY2mtxjcxyR8YPrr0qQ0hieZXa6voLWs/1AMo4+EudvQSwKbv1x7zz9j366xEp9XfgbQGS0ixsIKSXE1lk6xH6HZYxu6unkb1gjTxumavQin6TQvWiokIrgQjUO04Kpurh98NoOe7OiMfp+tT/Sa3Y+aW2fMporIjL5V8jp8WYxdGUW5YMQT6wanm+NC3jBPoAfMGzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(76116006)(66946007)(8676002)(64756008)(316002)(66556008)(66446008)(66476007)(5660300002)(508600001)(122000001)(71200400001)(54906003)(6916009)(38070700005)(55016003)(6506007)(26005)(52536014)(8936002)(86362001)(2906002)(33656002)(7696005)(38100700002)(186003)(83380400001)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	249d1424-2b4a-45ec-1ccb-08da41de3a6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v/kHJ6rlHhOVaopdj/Dx0eANjb98DTgLPisjW4ZocHQaJG5LC7w3eIDzxqtaaP3qyeLhJ0GMGboeTWqLWey6Xgz45geEDloqk3uMI9WULARhV+5hKo0e9nFOJ+H+UkavzRrKzFxBn0pHkAZhb2HupGyLuH6IR0GoRZeO+pUxe2tiIDxDN83gyqxuAqLc4m+zXSl3F8OJYiUIPOLBqqPNdgAgeo09kawPzGxd5tCTreMne3bBwZnjVpHJWUTkxIYzoMdObxc/uvnjJpqC/At9VmQj2aq+EY3gHGaPikr35H8wVM1fo3amBfdvR+0rjYz57arDTZKJ9VUzGyWUrsvPhJLjZDpmVi1YCs9oI+WiZ39NrVbgqVsuQdF5BlmNNe0ca4f2RuwrTHWV2UK6wxfJ387+53MoGoq5HanvizlGg819BSdvWFY/Dg2RDzIRzol1EHNpTkrEDzuBbrFAAiMpCQaCAXyC8rnEbkS0rG+jwN3qPJeA8+Flqnx1bzteR2Qs1CpcVJnSwhT/dOzXOJs8s693KoFCPcUE3l64ieILSp/uCcP8Xf3E0xzWCFFXXyEiT1E/vthP3cSjiopOVe+QAcbmbKDo6ufTo6s173J2rS9fpkEW7wnPIIs3LTRD3vJBRvyL0dJyCw8fY9FzKIPasw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(26005)(83380400001)(9686003)(6506007)(5660300002)(4326008)(8936002)(47076005)(82310400005)(8676002)(70586007)(2906002)(55016003)(70206006)(7696005)(52536014)(36860700001)(508600001)(6916009)(316002)(356005)(86362001)(336012)(54906003)(81166007)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 01:46:43.8989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd48f5fe-2d16-4b2c-e7f7-08da41de401a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2638

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBpcyB0aGUgb25seSBvbmUgdGhhdCBpcyBu
b3QgcHJvcGVybHkgYWNrZWQgYW5kDQpyZXZpZXdlZCBpbiB0aGlzIHNlcmllcy4gU28gdGhpcyBp
cyBhIGdlbnRsZSBwaW5nIGFza2luZyBpZiBldmVyeW9uZSBpcyBoYXBweQ0Kd2l0aCB0aGlzIHBh
dGNoIG9yIGFyZSB0aGVyZSBhbnkgbW9yZSBhY3Rpb25zIHRoYXQgc2hvdWxkIGJlIHRha2VuIGZy
b20gdGhlDQphdXRob3IuIFRoYW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjQgNy84XSB4ZW4veDg2
OiBhZGQgZGV0ZWN0aW9uIG9mIG1lbW9yeSBpbnRlcmxlYXZlcyBmb3INCj4gZGlmZmVyZW50IG5v
ZGVzDQo+IA0KPiBPbmUgTlVNQSBub2RlIG1heSBjb250YWluIHNldmVyYWwgbWVtb3J5IGJsb2Nr
cy4gSW4gY3VycmVudCBYZW4NCj4gY29kZSwgWGVuIHdpbGwgbWFpbnRhaW4gYSBub2RlIG1lbW9y
eSByYW5nZSBmb3IgZWFjaCBub2RlIHRvIGNvdmVyDQo+IGFsbCBpdHMgbWVtb3J5IGJsb2Nrcy4g
QnV0IGhlcmUgY29tZXMgdGhlIHByb2JsZW0sIGluIHRoZSBnYXAgb2YNCj4gb25lIG5vZGUncyB0
d28gbWVtb3J5IGJsb2NrcywgaWYgdGhlcmUgYXJlIHNvbWUgbWVtb3J5IGJsb2NrcyBkb24ndA0K
PiBiZWxvbmcgdG8gdGhpcyBub2RlIChyZW1vdGUgbWVtb3J5IGJsb2NrcykuIFRoaXMgbm9kZSdz
IG1lbW9yeSByYW5nZQ0KPiB3aWxsIGJlIGV4cGFuZGVkIHRvIGNvdmVyIHRoZXNlIHJlbW90ZSBt
ZW1vcnkgYmxvY2tzLg0KPiANCj4gT25lIG5vZGUncyBtZW1vcnkgcmFuZ2UgY29udGFpbnMgb3Ro
ZXIgbm9kZXMnIG1lbW9yeSwgdGhpcyBpcw0KPiBvYnZpb3VzbHkgbm90IHZlcnkgcmVhc29uYWJs
ZS4gVGhpcyBtZWFucyBjdXJyZW50IE5VTUEgY29kZSBvbmx5DQo+IGNhbiBzdXBwb3J0IG5vZGUg
aGFzIG5vIGludGVybGVhdmVkIG1lbW9yeSBibG9ja3MuIEhvd2V2ZXIsIG9uIGENCj4gcGh5c2lj
YWwgbWFjaGluZSwgdGhlIGFkZHJlc3NlcyBvZiBtdWx0aXBsZSBub2RlcyBjYW4gYmUgaW50ZXJs
ZWF2ZWQuDQo+IA0KPiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBhZGQgY29kZSB0byBkZXRlY3QgbWVt
b3J5IGludGVybGVhdmVzIG9mDQo+IGRpZmZlcmVudCBub2Rlcy4gTlVNQSBpbml0aWFsaXphdGlv
biB3aWxsIGJlIGZhaWxlZCBhbmQgZXJyb3INCj4gbWVzc2FnZXMgd2lsbCBiZSBwcmludGVkIHdo
ZW4gWGVuIGRldGVjdCBzdWNoIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBDaGFuZ2Ut
SWQ6IElhN2ZmOWE5MTI4ZWNiZTNlYjRkZGRkMTMwN2FlOGZiZTY1NTc1Y2NmDQo+IElzc3VlLUlk
OiBTQ00tMjI0MA0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4N
Cj4gVGVzdGVkLWJ5OiBKaWFtZWkgWGllIDxqaWFtZWkueGllQGFybS5jb20+DQo+IC0tLQ0KPiB2
MyAtPiB2NDoNCj4gMS4gRHJvcCAiRVJSIiBwcmVmaXggZm9yIGVudW1lcmF0aW9uLCBhbmQgcmVt
b3ZlIGluaXQgdmFsdWUuDQo+IDIuIFVzZSAic3dpdGNoIGNhc2UiIGZvciBlbnVtZXJhdGlvbiwg
YW5kIGFkZCAiZGVmYXVsdDoiDQo+IDMuIFVzZSAiUFhNIiBpbiBsb2cgbWVzc2FnZXMuDQo+IDQu
IFVzZSB1bnNpZ25lZCBpbnQgZm9yIG5vZGUgbWVtb3J5IGJsb2NrIGlkLg0KPiA1LiBGaXggc29t
ZSBjb2RlLXN0eWxlIGNvbW1lbnRzLg0KPiA2LiBVc2UgIm5kLT5lbmQiIGluIG5vZGUgcmFuZ2Ug
ZXhwYW5zaW9uIGNoZWNrLg0KPiB2MiAtPiB2MzoNCj4gMS4gTWVyZ2UgdGhlIGNoZWNrIGNvZGUg
ZnJvbSBhIHNlcGFyYXRlIGZ1bmN0aW9uIHRvDQo+ICAgIGNvbmZsaWN0aW5nX21lbWJsa3MuIFRo
aXMgd2lsbCByZWR1Y2UgdGhlIGxvb3ANCj4gICAgdGltZXMgb2Ygbm9kZSBtZW1vcnkgYmxvY2tz
Lg0KPiAyLiBVc2UgYW4gZW51bWVyYXRpb24gdG8gaW5kaWNhdGUgY29uZmxpY3QgY2hlY2sgc3Rh
dHVzLg0KPiAzLiBVc2UgYSBwb2ludGVyIHRvIGdldCBjb25mbGljdCBtZW1vcnkgYmxvY2sgaWQu
DQo+IHYxIC0+IHYyOg0KPiAxLiBVcGRhdGUgdGhlIGRlc2NyaXB0aW9uIHRvIHNheSB3ZSdyZSBh
ZnRlciBpcyBubyBtZW1vcnkNCj4gICAgaW50ZXJsZWF2ZXMgb2YgZGlmZmVyZW50IG5vZGVzLg0K
PiAyLiBPbmx5IHVwZGF0ZSBub2RlIHJhbmdlIHdoZW4gaXQgcGFzc2VzIHRoZSBpbnRlcmxlYXZl
IGNoZWNrLg0KPiAzLiBEb24ndCB1c2UgZnVsbCB1cHBlci1jYXNlIGZvciAibm9kZSIuDQo+IC0t
LQ0KPiAgeGVuL2FyY2gveDg2L3NyYXQuYyB8IDEzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCsp
LCAzMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3JhdC5j
IGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiBpbmRleCA4ZmZlNDNiZGZlLi5hODMxZGY3NjQ4IDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9z
cmF0LmMNCj4gQEAgLTQyLDYgKzQyLDEyIEBAIHN0YXRpYyBzdHJ1Y3Qgbm9kZQ0KPiBub2RlX21l
bWJsa19yYW5nZVtOUl9OT0RFX01FTUJMS1NdOw0KPiAgc3RhdGljIG5vZGVpZF90IG1lbWJsa19u
b2RlaWRbTlJfTk9ERV9NRU1CTEtTXTsNCj4gIHN0YXRpYyBfX2luaXRkYXRhIERFQ0xBUkVfQklU
TUFQKG1lbWJsa19ob3RwbHVnLA0KPiBOUl9OT0RFX01FTUJMS1MpOw0KPiANCj4gK2VudW0gY29u
ZmxpY3RzIHsNCj4gKwlOT19DT05GTElDVCwNCj4gKwlPVkVSTEFQLA0KPiArCUlOVEVSTEVBVkUs
DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgbm9kZV9mb3VuZCh1bnNpZ25lZCBp
ZHgsIHVuc2lnbmVkIHB4bSkNCj4gIHsNCj4gIAlyZXR1cm4gKChweG0ybm9kZVtpZHhdLnB4bSA9
PSBweG0pICYmDQo+IEBAIC0xMTksMjAgKzEyNSw0NSBAQCBpbnQgdmFsaWRfbnVtYV9yYW5nZShw
YWRkcl90IHN0YXJ0LCBwYWRkcl90IGVuZCwNCj4gbm9kZWlkX3Qgbm9kZSkNCj4gIAlyZXR1cm4g
MDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgX19pbml0IGludCBjb25mbGljdGluZ19tZW1ibGtzKHBh
ZGRyX3Qgc3RhcnQsIHBhZGRyX3QgZW5kKQ0KPiArc3RhdGljDQo+ICtlbnVtIGNvbmZsaWN0cyBf
X2luaXQgY29uZmxpY3RpbmdfbWVtYmxrcyhub2RlaWRfdCBuaWQsIHBhZGRyX3Qgc3RhcnQsDQo+
ICsJCQkJCSAgcGFkZHJfdCBlbmQsIHBhZGRyX3QgbmRfc3RhcnQsDQo+ICsJCQkJCSAgcGFkZHJf
dCBuZF9lbmQsIHVuc2lnbmVkIGludA0KPiAqbWJsa2lkKQ0KPiAgew0KPiAtCWludCBpOw0KPiAr
CXVuc2lnbmVkIGludCBpOw0KPiANCj4gKwkvKg0KPiArCSAqIFNjYW4gYWxsIHJlY29yZGVkIG5v
ZGVzJyBtZW1vcnkgYmxvY2tzIHRvIGNoZWNrIGNvbmZsaWN0czoNCj4gKwkgKiBPdmVybGFwIG9y
IGludGVybGVhdmUuDQo+ICsJICovDQo+ICAJZm9yIChpID0gMDsgaSA8IG51bV9ub2RlX21lbWJs
a3M7IGkrKykgew0KPiAgCQlzdHJ1Y3Qgbm9kZSAqbmQgPSAmbm9kZV9tZW1ibGtfcmFuZ2VbaV07
DQo+ICsNCj4gKwkJKm1ibGtpZCA9IGk7DQo+ICsNCj4gKwkJLyogU2tpcCAwIGJ5dGVzIG5vZGUg
bWVtb3J5IGJsb2NrLiAqLw0KPiAgCQlpZiAobmQtPnN0YXJ0ID09IG5kLT5lbmQpDQo+ICAJCQlj
b250aW51ZTsNCj4gKwkJLyoNCj4gKwkJICogVXNlIG1lbWJsayByYW5nZSB0byBjaGVjayBtZW1i
bGsgb3ZlcmxhcHMsIGluY2x1ZGUgdGhlDQo+ICsJCSAqIHNlbGYtb3ZlcmxhcCBjYXNlLg0KPiAr
CQkgKi8NCj4gIAkJaWYgKG5kLT5lbmQgPiBzdGFydCAmJiBuZC0+c3RhcnQgPCBlbmQpDQo+IC0J
CQlyZXR1cm4gaTsNCj4gKwkJCXJldHVybiBPVkVSTEFQOw0KPiAgCQlpZiAobmQtPmVuZCA9PSBl
bmQgJiYgbmQtPnN0YXJ0ID09IHN0YXJ0KQ0KPiAtCQkJcmV0dXJuIGk7DQo+ICsJCQlyZXR1cm4g
T1ZFUkxBUDsNCj4gKwkJLyoNCj4gKwkJICogVXNlIG5vZGUgbWVtb3J5IHJhbmdlIHRvIGNoZWNr
IHdoZXRoZXIgbmV3IHJhbmdlDQo+IGNvbnRhaW5zDQo+ICsJCSAqIG1lbW9yeSBmcm9tIG90aGVy
IG5vZGVzIC0gaW50ZXJsZWF2ZSBjaGVjay4gV2UganVzdA0KPiBuZWVkDQo+ICsJCSAqIHRvIGNo
ZWNrIGZ1bGwgY29udGFpbnMgc2l0dWF0aW9uLiBCZWNhdXNlIG92ZXJsYXBzIGhhdmUNCj4gKwkJ
ICogYmVlbiBjaGVja2VkIGFib3ZlLg0KPiArCQkgKi8NCj4gKwkgICAgICAgIGlmIChuaWQgIT0g
bWVtYmxrX25vZGVpZFtpXSAmJg0KPiArCQkgICAgKG5kX3N0YXJ0IDwgbmQtPnN0YXJ0ICYmIG5k
LT5lbmQgPCBuZF9lbmQpKQ0KPiArCQkJcmV0dXJuIElOVEVSTEVBVkU7DQo+ICAJfQ0KPiAtCXJl
dHVybiAtMTsNCj4gKw0KPiArCXJldHVybiBOT19DT05GTElDVDsNCj4gIH0NCj4gDQo+ICBzdGF0
aWMgX19pbml0IHZvaWQgY3V0b2ZmX25vZGUoaW50IGksIHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3Qg
ZW5kKQ0KPiBAQCAtMjc1LDEwICszMDYsMTMgQEAgYWNwaV9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0
eV9pbml0KGNvbnN0IHN0cnVjdA0KPiBhY3BpX3NyYXRfY3B1X2FmZmluaXR5ICpwYSkNCj4gIHZv
aWQgX19pbml0DQo+ICBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0
IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiAgew0KPiArCWVudW0gY29uZmxpY3RzIHN0
YXR1czsNCj4gKwlzdHJ1Y3Qgbm9kZSAqbmQ7DQo+ICsJcGFkZHJfdCBuZF9zdGFydCwgbmRfZW5k
Ow0KPiAgCXBhZGRyX3Qgc3RhcnQsIGVuZDsNCj4gIAl1bnNpZ25lZCBweG07DQo+ICAJbm9kZWlk
X3Qgbm9kZTsNCj4gLQlpbnQgaTsNCj4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gDQo+ICAJaWYgKHNy
YXRfZGlzYWJsZWQoKSkNCj4gIAkJcmV0dXJuOw0KPiBAQCAtMzEwLDQyICszNDQsNzggQEAgYWNw
aV9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0KGNvbnN0IHN0cnVjdA0KPiBhY3BpX3NyYXRfbWVt
X2FmZmluaXR5ICptYSkNCj4gIAkJYmFkX3NyYXQoKTsNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4g
Kw0KPiArCS8qDQo+ICsJICogRm9yIHRoZSBub2RlIHRoYXQgYWxyZWFkeSBoYXMgc29tZSBtZW1v
cnkgYmxvY2tzLCB3ZSB3aWxsDQo+ICsJICogZXhwYW5kIHRoZSBub2RlIG1lbW9yeSByYW5nZSB0
ZW1wb3JhcmlseSB0byBjaGVjayBtZW1vcnkNCj4gKwkgKiBpbnRlcmxlYXZlcyB3aXRoIG90aGVy
IG5vZGVzLiBXZSB3aWxsIG5vdCB1c2UgdGhpcyBub2RlDQo+ICsJICogdGVtcCBtZW1vcnkgcmFu
Z2UgdG8gY2hlY2sgb3ZlcmxhcHMsIGJlY2F1c2UgaXQgd2lsbCBtYXNrDQo+ICsJICogdGhlIG92
ZXJsYXBzIGluIHNhbWUgbm9kZS4NCj4gKwkgKg0KPiArCSAqIE5vZGUgd2l0aCAwIGJ5dGVzIG1l
bW9yeSBkb2Vzbid0IG5lZWQgdGhpcyBleHBhbmRzaW9uLg0KPiArCSAqLw0KPiArCW5kX3N0YXJ0
ID0gc3RhcnQ7DQo+ICsJbmRfZW5kID0gZW5kOw0KPiArCW5kID0gJm5vZGVzW25vZGVdOw0KPiAr
CWlmIChuZC0+c3RhcnQgIT0gbmQtPmVuZCkgew0KPiArCQlpZiAobmRfc3RhcnQgPiBuZC0+c3Rh
cnQpDQo+ICsJCQluZF9zdGFydCA9IG5kLT5zdGFydDsNCj4gKw0KPiArCQlpZiAobmRfZW5kIDwg
bmQtPmVuZCkNCj4gKwkJCW5kX2VuZCA9IG5kLT5lbmQ7DQo+ICsJfQ0KPiArDQo+ICAJLyogSXQg
aXMgZmluZSB0byBhZGQgdGhpcyBhcmVhIHRvIHRoZSBub2RlcyBkYXRhIGl0IHdpbGwgYmUgdXNl
ZCBsYXRlciovDQo+IC0JaSA9IGNvbmZsaWN0aW5nX21lbWJsa3Moc3RhcnQsIGVuZCk7DQo+IC0J
aWYgKGkgPCAwKQ0KPiAtCQkvKiBldmVyeXRoaW5nIGZpbmUgKi87DQo+IC0JZWxzZSBpZiAobWVt
YmxrX25vZGVpZFtpXSA9PSBub2RlKSB7DQo+IC0JCWJvb2wgbWlzbWF0Y2ggPSAhKG1hLT5mbGFn
cyAmDQo+IEFDUElfU1JBVF9NRU1fSE9UX1BMVUdHQUJMRSkgIT0NCj4gLQkJICAgICAgICAgICAg
ICAgICF0ZXN0X2JpdChpLCBtZW1ibGtfaG90cGx1Zyk7DQo+IC0NCj4gLQkJcHJpbnRrKCIlc1NS
QVQ6IFBYTSAldSAoJSJQUklwYWRkciItJSJQUklwYWRkciIpDQo+IG92ZXJsYXBzIHdpdGggaXRz
ZWxmICglIlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+IC0JCSAgICAgICBtaXNtYXRjaCA/
IEtFUk5fRVJSIDogS0VSTl9XQVJOSU5HLCBweG0sIHN0YXJ0LA0KPiBlbmQsDQo+IC0JCSAgICAg
ICBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCwNCj4gbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5k
KTsNCj4gLQkJaWYgKG1pc21hdGNoKSB7DQo+ICsJc3RhdHVzID0gY29uZmxpY3RpbmdfbWVtYmxr
cyhub2RlLCBzdGFydCwgZW5kLCBuZF9zdGFydCwgbmRfZW5kLA0KPiAmaSk7DQo+ICsJc3dpdGNo
KHN0YXR1cykNCj4gKwl7DQo+ICsJY2FzZSBPVkVSTEFQOg0KPiArCXsNCj4gKwkJaWYgKG1lbWJs
a19ub2RlaWRbaV0gPT0gbm9kZSkgew0KPiArCQkJYm9vbCBtaXNtYXRjaCA9ICEobWEtPmZsYWdz
ICYNCj4gKw0KPiBBQ1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUpICE9DQo+ICsJCQkgICAgICAg
ICAgICAgICAgIXRlc3RfYml0KGksIG1lbWJsa19ob3RwbHVnKTsNCj4gKw0KPiArCQkJcHJpbnRr
KCIlc1NSQVQ6IFBYTSAldSAoJSJQUklwYWRkciItDQo+ICUiUFJJcGFkZHIiKSBvdmVybGFwcyB3
aXRoIGl0c2VsZiAoJSJQUklwYWRkciItJSJQUklwYWRkciIpXG4iLA0KPiArCQkJICAgICAgIG1p
c21hdGNoID8gS0VSTl9FUlIgOiBLRVJOX1dBUk5JTkcsIHB4bSwNCj4gc3RhcnQsDQo+ICsJCQkg
ICAgICAgZW5kLCBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCwNCj4gKwkJCSAgICAgICBub2Rl
X21lbWJsa19yYW5nZVtpXS5lbmQpOw0KPiArCQkJaWYgKG1pc21hdGNoKSB7DQo+ICsJCQkJYmFk
X3NyYXQoKTsNCj4gKwkJCQlyZXR1cm47DQo+ICsJCQl9DQo+ICsJCQlicmVhazsNCj4gKwkJfSBl
bHNlIHsNCj4gKwkJCXByaW50ayhLRVJOX0VSUg0KPiArCQkJICAgICAgICJTUkFUOiBQWE0gJXUg
KCUiUFJJcGFkZHIiLSUiUFJJcGFkZHIiKQ0KPiBvdmVybGFwcyB3aXRoIFBYTSAldSAoJSJQUklw
YWRkciItJSJQUklwYWRkciIpXG4iLA0KPiArCQkJICAgICAgIHB4bSwgc3RhcnQsIGVuZCwNCj4g
bm9kZV90b19weG0obWVtYmxrX25vZGVpZFtpXSksDQo+ICsJCQkgICAgICAgbm9kZV9tZW1ibGtf
cmFuZ2VbaV0uc3RhcnQsDQo+ICsJCQkgICAgICAgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsN
Cj4gIAkJCWJhZF9zcmF0KCk7DQo+ICAJCQlyZXR1cm47DQo+ICAJCX0NCj4gLQl9IGVsc2Ugew0K
PiArCX0NCj4gKw0KPiArCWNhc2UgSU5URVJMRUFWRToNCj4gKwl7DQo+ICAJCXByaW50ayhLRVJO
X0VSUg0KPiAtCQkgICAgICAgIlNSQVQ6IFBYTSAldSAoJSJQUklwYWRkciItJSJQUklwYWRkciIp
IG92ZXJsYXBzDQo+IHdpdGggUFhNICV1ICglIlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+
IC0JCSAgICAgICBweG0sIHN0YXJ0LCBlbmQsIG5vZGVfdG9fcHhtKG1lbWJsa19ub2RlaWRbaV0p
LA0KPiArCQkgICAgICAgIlNSQVTvvJogUFhNICV1OiAoJSJQUklwYWRkciItJSJQUklwYWRkciIp
DQo+IGludGVybGVhdmVzIHdpdGggUFhNICV1IG1lbWJsayAoJSJQUklwYWRkciItJSJQUklwYWRk
ciIpXG4iLA0KPiArCQkgICAgICAgbm9kZSwgbmRfc3RhcnQsIG5kX2VuZCwNCj4gbm9kZV90b19w
eG0obWVtYmxrX25vZGVpZFtpXSksDQo+ICAJCSAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5z
dGFydCwNCj4gbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gIAkJYmFkX3NyYXQoKTsNCj4g
IAkJcmV0dXJuOw0KPiAgCX0NCj4gLQlpZiAoIShtYS0+ZmxhZ3MgJiBBQ1BJX1NSQVRfTUVNX0hP
VF9QTFVHR0FCTEUpKSB7DQo+IC0JCXN0cnVjdCBub2RlICpuZCA9ICZub2Rlc1tub2RlXTsNCj4g
DQo+IC0JCWlmICghbm9kZV90ZXN0X2FuZF9zZXQobm9kZSwgbWVtb3J5X25vZGVzX3BhcnNlZCkp
IHsNCj4gLQkJCW5kLT5zdGFydCA9IHN0YXJ0Ow0KPiAtCQkJbmQtPmVuZCA9IGVuZDsNCj4gLQkJ
fSBlbHNlIHsNCj4gLQkJCWlmIChzdGFydCA8IG5kLT5zdGFydCkNCj4gLQkJCQluZC0+c3RhcnQg
PSBzdGFydDsNCj4gLQkJCWlmIChuZC0+ZW5kIDwgZW5kKQ0KPiAtCQkJCW5kLT5lbmQgPSBlbmQ7
DQo+IC0JCX0NCj4gKwlkZWZhdWx0Og0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gKwlpZiAo
IShtYS0+ZmxhZ3MgJiBBQ1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUpKSB7DQo+ICsJCW5vZGVf
c2V0KG5vZGUsIG1lbW9yeV9ub2Rlc19wYXJzZWQpOw0KPiArCQluZC0+c3RhcnQgPSBuZF9zdGFy
dDsNCj4gKwkJbmQtPmVuZCA9IG5kX2VuZDsNCj4gIAl9DQo+ICsNCj4gIAlwcmludGsoS0VSTl9J
TkZPICJTUkFUOiBOb2RlICV1IFBYTSAldSAlIlBSSXBhZGRyIi0NCj4gJSJQUklwYWRkciIlc1xu
IiwNCj4gIAkgICAgICAgbm9kZSwgcHhtLCBzdGFydCwgZW5kLA0KPiAgCSAgICAgICBtYS0+Zmxh
Z3MgJiBBQ1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUgPyAiIChob3RwbHVnKSIgOg0KPiAiIik7
DQo+IC0tDQo+IDIuMjUuMQ0KPiANCg0K

