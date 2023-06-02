Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76E71FDAB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543029.847598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50zm-0004s8-OX; Fri, 02 Jun 2023 09:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543029.847598; Fri, 02 Jun 2023 09:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50zm-0004q7-LY; Fri, 02 Jun 2023 09:22:54 +0000
Received: by outflank-mailman (input) for mailman id 543029;
 Fri, 02 Jun 2023 09:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIO5=BW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q50zk-0004Z2-Ic
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:22:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aac1b21-0127-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:22:49 +0200 (CEST)
Received: from AM5PR0701CA0017.eurprd07.prod.outlook.com
 (2603:10a6:203:51::27) by AS4PR08MB7879.eurprd08.prod.outlook.com
 (2603:10a6:20b:51e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 09:22:41 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::3a) by AM5PR0701CA0017.outlook.office365.com
 (2603:10a6:203:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.11 via Frontend
 Transport; Fri, 2 Jun 2023 09:22:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 09:22:41 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 02 Jun 2023 09:22:41 +0000
Received: from 7e9e61db58ed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1DC9BDF-CD34-4671-B7FA-45439CCF9150.1; 
 Fri, 02 Jun 2023 09:22:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e9e61db58ed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jun 2023 09:22:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9759.eurprd08.prod.outlook.com (2603:10a6:102:2ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 09:22:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 09:22:33 +0000
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
X-Inumbo-ID: 0aac1b21-0127-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av8BWfad759vTI2hT6y6JQGOvrsYKfyXcrwNDFAK68c=;
 b=wsTG+fTj0wtcgurAJOccE1T7SpF2xyQnkKRC/ZLKGm7zYcjfaLXR6vVUzaFZ7TjgG9wcoVnBSoCdlWR0YOAuNX0bf9CiS+Mbm5ELEiFzuGiBR+gJuY951WgbD7U4vN4kNvbvqTkTn4ripdn+3kDVrZeGj82HBByH8Z8ZWkutYSA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZPYtNIW2wOOOzemc0okAW5EBkd5GVOGeGI166j99wEmE8AsGt8eN0c5JgTbN6kzCDBTcEk5WvIg1gacZhK1nAykCRc1d7L28+8XUAsACnV/IZyTm1Sut4+ciPJ6dAV31OeX/7o0uHusRatiwFSbRCJM6YlMmox314E/KtFNNxyhtkyrINGfkm1GTyHaxIKfolMdi/CxTSYxGOxy0mTvOTOcbqB5KzTmhKyusPG2wD/7tHHLXxEfX0In0t+N7CoBmcPSwe3Vg+j4dn08ZNgws1MJLmAbG6zsXt95wCFDuQbZ8jLLGYepvQhYO7rehWKNtSoJYwfUbuLdPGcqCbExvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av8BWfad759vTI2hT6y6JQGOvrsYKfyXcrwNDFAK68c=;
 b=eHrTYqKKM2Vvtwi+udcMOzh2AlVt71glY4P7mstkUUlBfxDH+joKikgcKDKl00R8Ow9SeICPi2g/GRwJS1q3XuweaAoPJYHyefA1gQ01BMdXbU4+ZXNY6dTcyQds4wBk6djaYvaoKmUFE8/KAvEdwNYFkMYUiMWwOvSV8zB/Ys2ahJGTfdhiSnRkB3+BTivgF0DB+kQU/Y5RSN0xkDSaJAa/t7jRonVOuDJP6sB+0A8kIDYdnDx1xWdYKaYclJzNDfmeq4VWh/Edp9yyfT+d1OTdhWfMLvzNzwVg6m0kZWre6/Eu06/m5sW8u38VokI8rpoWeJ/9HgNC+vQmhcbpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av8BWfad759vTI2hT6y6JQGOvrsYKfyXcrwNDFAK68c=;
 b=wsTG+fTj0wtcgurAJOccE1T7SpF2xyQnkKRC/ZLKGm7zYcjfaLXR6vVUzaFZ7TjgG9wcoVnBSoCdlWR0YOAuNX0bf9CiS+Mbm5ELEiFzuGiBR+gJuY951WgbD7U4vN4kNvbvqTkTn4ripdn+3kDVrZeGj82HBByH8Z8ZWkutYSA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Vikram Garhwal <vikram.garhwal@amd.com>
CC: "michal.orzel@amd.com" <michal.orzel@amd.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Topic: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Index: AQHZlOwO5+EbGXwbJkOX7UD3KKfC8q93OR4AgAAD7dA=
Date: Fri, 2 Jun 2023 09:22:33 +0000
Message-ID:
 <AS8PR08MB7991E16F64F1FF8B3EDF648E924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-6-vikram.garhwal@amd.com>
 <ad948249-2011-316d-f194-7d7f76667530@suse.com>
In-Reply-To: <ad948249-2011-316d-f194-7d7f76667530@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F54EEA3E9370174A975161204A583A9B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9759:EE_|AM7EUR03FT005:EE_|AS4PR08MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: b1557fb2-7dfc-427f-b034-08db634aea53
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2YZObZtnyTBbnAEZCV9sjLBT71GLMW0be0+JIJGdYjERc0VIFXGLVFBtP+LF/auGzcIYtPiArJV38Fp+dTqHA++888+pLHDwAWmzvaoi+LHn82OMGi5LhELOb3EYQkO1zoxdw1ZxOfED7ZYP6oHc7bH3hrpqS+XbAhzs1wK/Cs/MGVsb4zqSDhiu3NcmgERukJ/hdacK3RxyimaOswXhBgcxw1kgBWVWv3LSAbjmseErUBN8ln4kZDbEo/8SYwZVpFkDbPNuh+20aiwr+Tbr4cOryZHILP8vWRbiHOgsXY9I5QC2WHI9o22+vmzlp6W+4JwaqJN4CPs5HYW8fI8AY58p2Z+Zgxnpe05bWlZi84s4P4cYiUlg/Aiq5nLrFYzXN1vt9rigY40n8C4Uk6IPY1Vin9X3VXxkwUSrlICHiyVRT/RxhuE9W1tLZTiXZed/trNet1Sp8SI/Tjrj3X0eE2yZNq0ytL0/83v4Jroub5O5NhdWkmEi101nzXXf6zEM6QnWg9sSLjmpegJUGsLowcj0m3U1eT+554+zlF4vVaNozqBcYfst8NfH9jGxGHW2Kr0BkdBIJ8ioZgFm4UR1k6Qh2br+1vCABw2nQgu1/ZE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(6506007)(9686003)(26005)(186003)(71200400001)(41300700001)(83380400001)(2906002)(5660300002)(4744005)(52536014)(7416002)(8676002)(8936002)(38070700005)(66556008)(66446008)(64756008)(4326008)(66476007)(66946007)(76116006)(86362001)(54906003)(110136005)(55016003)(7696005)(33656002)(316002)(478600001)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	837ea539-8d24-4248-c85a-08db634ae5a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QgUT/+Zu8qPTuzDj2j+vXAPfYDePZLILecI8f/y28B9cP/aFv2O1nUiM9a1orLE8nHEwUOl3FSRJqko/pCM+lxDFxCVIsagh284CyrSX3+/I/SIFmG5BBoCqXPztFKmjQjacpfVoKpP9ZPze57FFmXzwJLciaJzyHHbwef7mXlEVM3Pn/y5O5Zfo/n9uBrXC2mdqaVOSo8gk6D1rz2j6jPcA2E5a/yWVunBL6yuEPY3jU1io6Wh0NV5BUeCOEjJiB1gL7XXR4Cnxx0LVD5Yi3QBH7mkOWnv42w+1+BkmD+QNemOOOJ6WEQKI7mSmkPPKjxlgCMpcFgz7Y8B2W21mcNDZQ0iqFiXk9+DYpXCal9SQRNxKqb8UQ15kdBMk73VzJUVuhB5NCPCejH5rwT7lI+2jKUSeuAGkLxcGZ2esf9H7TyiJXmqJPvjo67jtOYkkzb6CvZo9LA4z3b8qS0fBaGQOlNv8S5u+XoPsh0Q/VKHmUDTlXWCc7SkbZ6PlqKWbJ0BTBMd2dghQMjFNtgj5BWyHXnFihgE1W8RbD7vu8UJHacahcbN68YoEbQde4LseVTk9oFXI2VRjiQRZYp+xBUS/flWmjl3loJlVhJZnIX366nV046IXhFYFrzZ7rLiijqaUeOZyew/dQA0BCbQZUcfVUD73MB1C2Ww9Bsra+mLhMZ7IOuRhNilSUjeyoMYMVPTZ1B8gbxtLe+hb2rRfsiCygMb5HXNuI4a+cF63VKE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(4744005)(336012)(83380400001)(47076005)(186003)(2906002)(36860700001)(4326008)(70586007)(316002)(110136005)(478600001)(8936002)(54906003)(70206006)(7696005)(5660300002)(52536014)(26005)(6506007)(9686003)(8676002)(40480700001)(55016003)(41300700001)(356005)(82740400003)(81166007)(33656002)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:22:41.2671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1557fb2-7dfc-427f-b034-08db634aea53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7879

SGkgSmFuIGFuZCBWaWtyYW0sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3Vi
amVjdDogUmU6IFtYRU5dW1BBVENIIHY3IDA1LzE5XSB4ZW4vYXJtOiBBZGQgQ09ORklHX09WRVJM
QVlfRFRCDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cubWQN
Cj4gPiBpbmRleCA1YmZkM2FhNWMwLi5hMTM3ZmNlNTc2IDEwMDY0NA0KPiA+IC0tLSBhL0NIQU5H
RUxPRy5tZA0KPiA+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPiA+IEBAIC0yMCw2ICsyMCw4IEBAIFRo
ZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYQ0KPiBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFj
aGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4gPiAgICAgLSBCdXMtbG9jayBkZXRlY3Rpb24sIHVz
ZWQgYnkgWGVuIHRvIG1pdGlnYXRlIChieSByYXRlLWxpbWl0aW5nKSB0aGUgc3lzdGVtDQo+ID4g
ICAgICAgd2lkZSBpbXBhY3Qgb2YgYSBndWVzdCBtaXN1c2luZyBhdG9taWMgaW5zdHJ1Y3Rpb25z
Lg0KPiA+ICAgLSB4bC9saWJ4bCBjYW4gY3VzdG9taXplIFNNQklPUyBzdHJpbmdzIGZvciBIVk0g
Z3Vlc3RzLg0KPiA+ICsgLSBPbiBBcm0sIHN1cHBvcnQgZm9yIGR5bmFtaWMgYWRkaXRpb24vcmVt
b3ZhbCBvZiBYZW4gZGV2aWNlIHRyZWUgbm9kZXMNCj4gdXNpbmcNCj4gPiArICAgYSBkZXZpY2Ug
dHJlZSBvdmVybGF5IGJpbmFyeSguZHRibykuDQo+IA0KPiBNYXkgSSBzdWdnZXN0ICIuLi4sIGV4
cGVyaW1lbnRhbCBzdXBwb3J0IC4uLiIgaGVyZT8NCg0KR3JlYXQgcG9pbnQhIEkgYWdyZWUgdXNp
bmcgImV4cGVyaW1lbnRhbCBzdXBwb3J0IiBpcyBiZXR0ZXIgaGVyZS4NCg0KQFZpa3JhbTogSnVz
dCB0byBiZSBjbGVhciwgaWYgeW91IGFncmVlIGFuZCBjaGFuZ2UgdGhlIHdvcmRpbmcgZm9sbG93
aW5nIEphbidzDQpzdWdnZXN0aW9uLCB5b3UgY2FuIGtlZXAgbXkgYWNrZWQtYnkgdGFnIGZvciB0
aGUgY2hhbmdlbG9nIDopKQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg0K

