Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB74E924D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 12:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295382.502613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYmHt-000706-9L; Mon, 28 Mar 2022 10:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295382.502613; Mon, 28 Mar 2022 10:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYmHt-0006xm-5M; Mon, 28 Mar 2022 10:07:49 +0000
Received: by outflank-mailman (input) for mailman id 295382;
 Mon, 28 Mar 2022 10:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pyAu=UH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nYmHr-0006xg-OG
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 10:07:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe06::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9aea2d7-ae7e-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 12:07:45 +0200 (CEST)
Received: from AS8PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::19)
 by DB7PR08MB3868.eurprd08.prod.outlook.com (2603:10a6:10:32::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 10:07:41 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::41) by AS8PR04CA0194.outlook.office365.com
 (2603:10a6:20b:2f3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 10:07:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Mon, 28 Mar 2022 10:07:40 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Mon, 28 Mar 2022 10:07:40 +0000
Received: from 3565088f93e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEC80E69-47AA-431C-9DCD-03D186DD5233.1; 
 Mon, 28 Mar 2022 10:07:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3565088f93e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Mar 2022 10:07:30 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB7PR08MB3019.eurprd08.prod.outlook.com (2603:10a6:5:24::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 10:07:25 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 10:07:25 +0000
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
X-Inumbo-ID: e9aea2d7-ae7e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFkgP4WjTQcMJvj0Qm4LyqKRctVvhdTkyX5lqOec/E0=;
 b=vrRPuywwlvfMU++JKNSMdl+LGB27ck30PANuwNSejCAouLe0VhIkqSqNDz4jBCCL8CUN9WYNzuk69A+7kfKYUuXd4Het3XOqVu0A+xTHnofdGnlspxy7FWf6R59KnB0zsB5T2zqPACU/BaPsDdH3heSezZrqeeHpY/KBRuSpqKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b0c2a3f89594e16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+3mdBH+fy9Me+Gg1hCDgbrTlqX7wn2DrgWfMbmyT7wp7jHdjDGz/q7tM2cKrogpOO/YpeL8TPhG+Ti1Wpr524N0NFdYazwI475Ivrn7qA1Hf/DYVfLY+9qit3Jy34f8FjCJJi5W+LsbwHP1fvNDRHaZFr1+Vq3lNyBzLeGWraW3F0A1jPn6ObSTEnKArTmLGknH9O0MoSxfmiSF7GVgnVVNGJ0ob7yejrBB2fG+f4OhgFkgSOd9cWA9gB6ncOHx83leST4mGrHdXUbpz09bj/ibqChd8mC9tYehEdNNoyK+f3gjUEfEquLZFvItHf/WjpJetj2U4mnwR3NBToqchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFkgP4WjTQcMJvj0Qm4LyqKRctVvhdTkyX5lqOec/E0=;
 b=AkWzcxpnz25tATpKwfIUeNMXiiAOBXry5xt1u62h2Rny9AmL+xgYrSciZ1uG9fjFnvScn64cxqbvavUTJFi9T+n2T2OtiE4Ysqzsr6ql2mKdSotxNvDy76gwcLx+gbfCsFr6/J7sIUSeNDjAOQZuhokwHiP23qB5/PCcowHIlCBYXBkthohjWjc6PmCXZnUQ0HR5DtwINlz4b9UbKcRRToQtaGg2tHNwjakhw1/dafb5cMYh7Cr7LK++qymFuauM3RKQsC9dKXiqDeF1uE1+MFQpFj+Kk0XIjKNEyrt7B7CXQgHvCWHBcJWn+7zC5H4xQ0rbUXFoNkrwiClfdB4U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFkgP4WjTQcMJvj0Qm4LyqKRctVvhdTkyX5lqOec/E0=;
 b=vrRPuywwlvfMU++JKNSMdl+LGB27ck30PANuwNSejCAouLe0VhIkqSqNDz4jBCCL8CUN9WYNzuk69A+7kfKYUuXd4Het3XOqVu0A+xTHnofdGnlspxy7FWf6R59KnB0zsB5T2zqPACU/BaPsDdH3heSezZrqeeHpY/KBRuSpqKs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v4 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v4 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYP4h9C6K3pTBngUaG+FrEQR6YqqzQyAIAgAPQKgA=
Date: Mon, 28 Mar 2022 10:07:25 +0000
Message-ID: <960D7451-2186-4950-80B7-B3F5C961336D@arm.com>
References: <20220324140633.39674-1-luca.fancellu@arm.com>
 <20220324140633.39674-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2203251539510.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203251539510.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1724fe54-b971-4beb-9b8c-08da10a2cb27
x-ms-traffictypediagnostic:
	DB7PR08MB3019:EE_|VE1EUR03FT053:EE_|DB7PR08MB3868:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB386894928A830F8FFEF75420E41D9@DB7PR08MB3868.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w60r9YINkq3vE1UXb1FjdAbBxIuRO01ER+9sk/+8C2SC+32NnSg/9yck7R/68K1w3OY2oAGrVo8J86YybRqj3N2zSWv1IEu76psemE1tpCrIyY9Dj7VZVaJ7xujTWPCThiJxFgfX86YIqDSv70SFilDAjbqeF03I6cupLytiXx3649f5Bafd1cQui8g0rhcR///WtCY3cfX9ByYpLACkVfsoAl4gxUTyK8vRIoj9hX9fAETNf7/rzVv1kNTQUkD1c2RXRV8MAWCMxmEXYbitAjC1KRMEiTUDbCs/GsWgSvUmMqEEmpcpDymoaHspNDlJe518wjV9kjkcBiuA+q6OYO0f5RlcawpG/zvMPK/keJzwP7XOIaAiDtsaF3wSrmdPYAKwXSgoUZb1LJvPnsmthzxgzcrctJlLhAHF7NFoud/lV8Mcs3byb3Lajkxq7TPH29f4exv2M6OlaOhE9Gy/fxF2sgOnE/3fXhph/QylJBS74phBb0v0N5GkF6bky+ejbNjsBibugL8IKxUtGMwok5sonnEUdZQ5RkwkYyqTmSXzgFnmJvgsaIW4jOdswvtwLUAVLzG/0qGnUHG64cYNxrc6POSg+2Yo3RZ17DY+Ti1wTEKnswwFUP6JJOeJsNzq6mZUjwg1D+bGQZKK+8GApDwTCOGbv9gu6asccfKDS8uLxmS2UYtkWNvpXewmnf7Wf+aso7Zl9BYr3bhPWQyhOYP8nQgSl3tP5hrPwUUySYI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(316002)(6486002)(2906002)(38070700005)(8676002)(33656002)(36756003)(66946007)(76116006)(66446008)(4326008)(66556008)(91956017)(86362001)(64756008)(54906003)(6916009)(7416002)(66476007)(2616005)(4744005)(508600001)(122000001)(38100700002)(83380400001)(8936002)(71200400001)(26005)(186003)(5660300002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E1AB99D41F4514DA1A93FF04AC67484@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	670bdd1b-4183-4c70-7900-08da10a2c221
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rfBRQ+ja3mB4MJJ/WNdJjAUwjAsYzOQO50sLGD3WvF/R2YQwu1DhsKi/737b/hWVbJnbiW4sNotbqUyrYtOX1T2f/wucMOIFk4Ll0sHXhjChgFUjPPHcTHZLOSOaewbsUdT05/Wttv3J+H4z10eDWDZO1fCOrb+yOp3FnYZtBMnrWk0do1v53htmBnAblkj1ZEiERdXeGFairS9gJPxfUYxQAFlkeDpmILQn2RMJj/jkN/vnihRJ/wWCXGUkMJqgkGk5w58lrjBBwWP/pqIfDyvRkLBxNQnEGMjq/o1xxUTq4MHYtbyIcvpwCyUtr+ydzviZBjWK4FJ/PLlNH87FKzf+TV+9xTRPsULOSXZPNkuf7I1Eobp09cyR6IBDkcQExkASdyjvcvRh/fWZPM49MY+NkBQNUyPM32C2Tf3zCB9e6x+ThQGhFP+juZhL6Ji5UionOhckZKU1x5lySEC+wBQSM9p5gEAZpenXgIc95s5kob/BZxv2sy48v/FXjPb7exW7+41kVqNqz4U2GexaW0gUyrbqI2FaUOiplfkVj4VfgqUjgnqHgEuW8CFr66fpJpb4ChSE7UuQtSCT5Q3AW+RmrGU1yEPsc3qdlfGOM95yxV8J1ML0E/ECaHF4wOejekzlypf3uTVdx+kX2+EjNCECrAy5aFn0wKXkiL92U6krjp1xEUMJlo+YAFika71Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(70206006)(107886003)(70586007)(86362001)(47076005)(4326008)(6862004)(186003)(2906002)(82310400004)(83380400001)(336012)(40460700003)(316002)(6506007)(54906003)(33656002)(26005)(6512007)(6486002)(508600001)(36756003)(36860700001)(8936002)(4744005)(2616005)(81166007)(5660300002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 10:07:40.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1724fe54-b971-4beb-9b8c-08da10a2cb27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3868

DQo+PiArDQo+PiArICAgICAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3N0cmluZyhwaGFuZGxl
X25vZGUsICJjcHVwb29sLXNjaGVkIiwNCj4gDQo+IFRoaXMgc2hvdWxkIGJlICJub2RlIiwgbm90
IHBoYW5kbGVfbm9kZQ0KDQpIaSBTdGVmYW5vLA0KDQpZZXMgc29ycnkgYWJvdXQgdGhhdCwgSSBk
aWRu4oCZdCBub3RpY2UgaXQgYmVjYXVzZSBpbiBteSBsYXN0IHRlc3QgSSB3YXMgY3JlYXRpbmcg
cG9vbHMNCndpdGggZGVmYXVsdCBzY2hlZHVsZXIsIEkgd2lsbCBwYXkgbW9yZSBhdHRlbnRpb24g
bmV4dCB0aW1lLCBzYW1lIGFwcGxpZXMgdG8gdGhlDQpzY2hlZHVsZXIgc3dhcC4gSeKAmWxsIGZp
eCB0aGVtIGluIG5leHQgc2VyaWUNCg0KPiANCj4gDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmc2NoZWR1bGVyX25hbWUpICkNCj4+ICsgICAgICAgICAgICBzY2hl
ZF9pZCA9IGNoZWNrX2FuZF9nZXRfc2NoZWRfaWQoc2NoZWR1bGVyX25hbWUpOw0KPiANCj4gSXQg
d291bGQgYmUgbmljZSBpZiB3ZSBoYWQgWEVOTE9HX0lORk8gcHJpbnRrcyB0byBwcmludCBhdCBi
b290IGZvciBlYWNoDQo+IENQVToNCj4gLSB0aGUgUG9vbElEDQo+IC0gdGhlIHNjaGVkdWxlciBu
YW1lDQo+IE5vdCByZXF1aXJlZCwgYnV0IEkgaGFkIHRvIGFkZCB0aGVtIHRvIGZpZ3VyZSBvdXQg
ZXhhY3RseSB3aGF0IHdhcyBnb2luZw0KPiBvbi4NCg0KSeKAmXZlIGFkZGVkIGEgcHJpbnRrIGlu
IGJ0Y3B1cG9vbHNfZ2V0X2NwdXBvb2xfaWQsIGRvIHlvdSB3YW50IG1lIHRvIHJlbW92ZSBmcm9t
DQp0aGVyZSBhbmQgcHJpbnQgaGVyZT8gDQoNCkNoZWVycywNCkx1Y2ENCg0K

