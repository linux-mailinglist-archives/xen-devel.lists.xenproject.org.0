Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC85B121B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 03:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402436.644381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW6Oz-0001fY-Lf; Thu, 08 Sep 2022 01:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402436.644381; Thu, 08 Sep 2022 01:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW6Oz-0001cw-Id; Thu, 08 Sep 2022 01:32:21 +0000
Received: by outflank-mailman (input) for mailman id 402436;
 Thu, 08 Sep 2022 01:32:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oW6Oy-0001cq-9h
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 01:32:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1365eb92-2f16-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 03:32:18 +0200 (CEST)
Received: from AS9PR06CA0276.eurprd06.prod.outlook.com (2603:10a6:20b:45a::34)
 by AS4PR08MB7529.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 01:32:16 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::73) by AS9PR06CA0276.outlook.office365.com
 (2603:10a6:20b:45a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 01:32:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 01:32:15 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 08 Sep 2022 01:32:15 +0000
Received: from a18f730bb587.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87CF164D-44D5-4728-9187-AC7461EFC26F.1; 
 Thu, 08 Sep 2022 01:32:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a18f730bb587.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 01:32:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8243.eurprd08.prod.outlook.com (2603:10a6:20b:51f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 01:32:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 01:32:08 +0000
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
X-Inumbo-ID: 1365eb92-2f16-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XFljItzxVPzk7ssOLz90rBRSB6J9aPEcsMnaKecA+s4XRYkChj55bIGL4WSLMZvPvuWVxXOJ4qRQq7ZnhTOGGNc0WRdphrhLrnTMe5ZZny3MAli3hQIKmhSJevNwehto53LzEXOE3yp/Z2DC4WKZAKlWNHroJPHchrJo8EHJ4VWxyG8y7iCume0stcP4Ra4YEmpRZw0nk3AXOToaHO5oHQDTn8DMROvQiGWApuG9AV7zV1fSrPymhO7aXScEgT9WnpSMdyKAoJmt963+ImNc5MgobQPfKd3bNmbugQ7i8CTQgWwuVBU22xke5DAq3BYC7qxWq7EjYz99Btzb391Uqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IheUAavtjkvnKbrBSesn47mZoT1v2VxfZ9V90jdMYiw=;
 b=NFP08MeljbyRiHQ/mxlcT0nCHt7vkGjE8I/KjCOSJ0xeWTbWFjIJPMgL3fF871t6hvcN8KNPhHAUKx0Xso/0uUaHfF6/CJvJi9Z86OmVYYzGjnfAFLknbr5udlz9pQ+eBICW/rsJYWKbXGQtAoABe30lBPq9pg6wNP4eJn8VmK2a5hfyNZdbWw3riyAtJKMJsjs1XZhVC5WgWvlo3ue5yW8frY7+3kN9EH7JLOvDg1lT3KsGcO+fSIw7SggZXf2u0XBUaj8oDlEA071/fQ/on2BaXM1ezsBaNkeE0gEN9/1cLjNkYV67OMtkWUkIVVMbGWY3JwofgdRMdnIWsT3h0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IheUAavtjkvnKbrBSesn47mZoT1v2VxfZ9V90jdMYiw=;
 b=EBINekjyqKPcP8FGb5nJxmxM0zx+bKYHZz0soBkP8Lb2UqhWyCCHV+kZxBzF4lQ2jmLuVv31aZk1ZNU+XUzPkFuLWz+v3YaYJ+MFWWkCG18ZccOIKbDl7nTJioav/k2aeDLh3CpB9IOiarf7Ssm+whp1fph0SuK0Ps+vPbP5bJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK8cxVeZ5a5Q8veCDJpZyj+zKv/7YnbSt8M6hBMROCQyNrcRshhVe8/D1wnECTonhhHiK+J18BW84qUXT4zAkACD6bfArKkr/miKskhTobya3Da3DZ/2wloFILmMNzWjXumzUJ+7SpXXfWrIA+WTrnifC5X2+FoSng1s+E//blw7YSxPc+uB/p5K2Uh5WVdRn70MPNupuUI32l4hICxJwyoqrh/R8nceD/962xmjVn0I3EOpluA/jG/wHkiMKzcW9zUBQs4ZKVJqZwclhySfIDwj2/ZAvrA/SvCeyva3YzOICWrP+aMxpuqg3XQZgee5ZNbHZzdgj7lGZnDznF9qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IheUAavtjkvnKbrBSesn47mZoT1v2VxfZ9V90jdMYiw=;
 b=Z5f338WzuML0PnYwSToG9fvviY24FT0xHiin3Z2lXm7KBB7TwuIgrNsSy5fk/YDLOuYOKA3ikt0pRBX8Vioy8nScZY8lzkBfv0IvJ8lcqcRag+D03vXPkNRLCD/LOJ9i8MgJM3yb35wC6B2e+SXi331Kprj8Ab8M/g/5lBa4ahJ/suwDIqbB1rlt3ddl0Fj5gIB5C/D34sUdKN8ajLlK8nxvqsW/y8vOJ11n5b0a1Eayq5Bj+qCVdUzpD2sn6iXW+qt9pMmbRJw1DJhswZVfW45ufGNCmlJ+9vKr2R/MeVoo0fTVPC6KV/pX7G/+lCzhvtYHfuGnuhQ3TME+WzsyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IheUAavtjkvnKbrBSesn47mZoT1v2VxfZ9V90jdMYiw=;
 b=EBINekjyqKPcP8FGb5nJxmxM0zx+bKYHZz0soBkP8Lb2UqhWyCCHV+kZxBzF4lQ2jmLuVv31aZk1ZNU+XUzPkFuLWz+v3YaYJ+MFWWkCG18ZccOIKbDl7nTJioav/k2aeDLh3CpB9IOiarf7Ssm+whp1fph0SuK0Ps+vPbP5bJA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v4 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v4 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index: AQHYwsc8IB/BGoiaOECLtnnc9tK+sa3UGc0AgACl6FA=
Date: Thu, 8 Sep 2022 01:32:08 +0000
Message-ID:
 <AS8PR08MB7991CA1FB4D2DC1B1F1D3DA492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907143532.15397-1-Henry.Wang@arm.com>
 <20220907143532.15397-3-Henry.Wang@arm.com>
 <a5ecba11-39e8-d4f2-a50c-c4200dae52cc@xen.org>
In-Reply-To: <a5ecba11-39e8-d4f2-a50c-c4200dae52cc@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6FCF1E38E8D46E4BBCD7189E9DFF92AE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 444d7759-8744-40d3-c68a-08da9139f639
x-ms-traffictypediagnostic:
	AS4PR08MB8243:EE_|AM7EUR03FT045:EE_|AS4PR08MB7529:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QWYwEHIb+bjJbmyIaELXr2wa0k4LFu1HM0PeebFTZK1JaxgvK9GShatuLEX1+pc3mMOWnbDSUOdc4ypBmR6k1RPelGKJtZ9dh/szCbNY/VDKCBVPibo6Sseh/2D7a/mJiKhSFRYFSI8DyY4jvOnV7CTWaWazb6xPVZiqB42n6HtORnryiajionA0s3XgwJmQXFAtlFgJhr1DttPoed+X4Ku2PsE5xQz2x1NanRgPY0heKOH5DYk1d03NA5udM4zUegz8LXhWdIl5Bp9luWxj156Ajw2gCOTRvydZRXJU64HqBgdNav/u3BDvqFJOL5PrhlJ1gCx7ov2jPKQ6/o9LTl9Qj6Oakoq3M54o+wri88JenkFEdsnbokNfQmPxx0jaUPUXivXsSLbSeFtFe5BBJM5pW4Y4RDhTIKx0Aiu3r3PcRWqLdRQnx7DNjTNa5F4YaJrxVLw0Ph4Sy5iWIzdI7swQSnIeRYeG+XUPoy3a3eaJttQyLM6+D1DjFRs0xAAxpFLgV9bsZiVT3JzFLWRAQqZ7oV6HsoN7fotbw0APXfwaExoiYt8B06e1LyaPq5CWFQNHxMeAcWoEYYz+YEaB9CXipfFjrv8gjOFHyTxDOO4KHLcOTcPcBaVj88HryDHzflcmjrOB4x0mZlz7m0JO5UeWyK9BiFTLgl/qL/IIT/1ApT+X4wKuff2/SreIdR/8epTewhQGlNynIbr9yxWyNJr/nwymecPB1SAzyKhpnHlS4bUNgMEltcP1V8kmWG6ZRj3wyD8v2KLjSDzSFefYlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(122000001)(86362001)(33656002)(7696005)(6506007)(9686003)(38100700002)(83380400001)(2906002)(5660300002)(26005)(41300700001)(52536014)(8936002)(64756008)(38070700005)(8676002)(55016003)(66556008)(66946007)(76116006)(4326008)(71200400001)(66476007)(478600001)(66446008)(186003)(316002)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8243
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74df44f3-6bc1-4694-3755-08da9139f1bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XaUKJ8FSUrZ4QrS6TXxgUX7MIW3yQiIwCq8xLPrdbMAXfFkrYtlJEGxY6n5yK9fe+jymwn0hSUZ9kaz7j9+sHao+4vm8SyKR+b8O7HBrLzDCR6AX4qt5IG5+gBR8KcJ0nYR+qrry6f6lNHRURgSGvHij/4F9hiKxK/5TC358T+OvQi+H9Du6wvHJf9UNykY63iF13ktyLHMd1Vec9foBLQcN9p4oEz0WxdUs/0RVeEmlLADHsZoVmpDpyb8rjmIPN/2GCJr38H4RenZPopkXCfYywpw/RtG5k/1SxJtNAmlE+da55G/A4xq2X3ScxJRULtJbnEBp5fkdzpRhrhTa5ybDD8e4fDHKEcSxj90s/aZcFzVY85IZSyWj2LAozViOFJmdi3/G6w2LgRMHmp6otLNzTB51Qse16Vt/9gsljviHRJSUOlf2jj0gggGsu9fY1cXVc/kA9T1piyvqzhC7VD1cgMskw1cD3XXb3FHkNdYTXrxCvAZcGSrgt5rrlrGfJiLWE24/17lJeq4zqwpD2Ku85PF89a7AtpiyP/TsAKmYIiwwcK4MP/m6RB3/rfMPLpJPJaJJ4Niaag+TXf3VpyUGNVagkRTh5Xzbg5G3X7xxNE2s7CGzcvI3ODb2Qw+3upWNI3xuPKw6l+kBsZnF5CtYka+N76noTKp0s5A5QCpsSK1s7H3jc31VoEN+2z9mKF/7dZFt2n9IQdCxtJ50k2Ni/HDDHtqAHQd7R4pWoOiVmtY+NfxkSrJWiT4pdswIhrrilsPhXhdAxS6Df3scEw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(82740400003)(40480700001)(55016003)(82310400005)(41300700001)(81166007)(316002)(356005)(54906003)(110136005)(36860700001)(6506007)(4326008)(7696005)(478600001)(83380400001)(70206006)(52536014)(33656002)(8676002)(26005)(70586007)(47076005)(8936002)(86362001)(186003)(40460700003)(2906002)(336012)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 01:32:15.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444d7759-8744-40d3-c68a-08da9139f639
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7529

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gKy0gI3hlbixzdGF0aWMtaGVhcC1hZGRyZXNz
LWNlbGxzIGFuZCAjeGVuLHN0YXRpYy1oZWFwLXNpemUtY2VsbHMNCj4gPiArDQo+ID4gKyAgICBT
cGVjaWZ5IHRoZSBudW1iZXIgb2YgY2VsbHMgdXNlZCBmb3IgdGhlIGFkZHJlc3MgYW5kIHNpemUg
b2YgdGhlDQo+ID4gKyAgICAieGVuLHN0YXRpYy1oZWFwIiBwcm9wZXJ0eSB1bmRlciAiY2hvc2Vu
Ii4NCj4gDQo+IExvZ2dpbmcgaGVyZSBqdXN0IGJlY2F1c2UgaXQgaXMgZWFzaWVyIHRvIGtlZXAg
dHJhY2sgb2Ygb3BlbiBxdWVzdGlvbnMNCj4gOikuIEZvciB0aGUgZnV0dXJlLCBJIHdvdWxkIHN1
Z2dlc3QgdG8gbGlzdCB0aGVtIGFmdGVyIC0tLSBzbyB0aGV5IGRvbid0DQo+IGdldCBsb3N0Lg0K
PiANCj4gV2UgbmVlZCB0byBhZ3JlZSBvbiB0aGUgbmFtaW5nIHNjaGVtZSBiZWZvcmUgdGhpcyBn
ZXRzIGNvbW1pdHRlZC4NCg0KSSB0aGluayB3ZSBhcmUgYWdyZWVkIG9uICNhZGRyZXNzLWNlbGxz
IGFuZCAjc2l6ZS1jZWxscy4gU28gSSB3aWxsIHNlbmQNCmEgdjUgd2l0aCB0aGVzZSBjaGFuZ2Vk
Lg0KDQo+IA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAu
aA0KPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gaW5kZXggNTgxNWNj
ZjhjNS4uMzE2MTBjY2Q2NSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vc2V0dXAuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+
ID4gQEAgLTIyLDExICsyMiwzMSBAQCB0eXBlZGVmIGVudW0gew0KPiA+ICAgICAgIEJPT1RNT0Rf
VU5LTk9XTg0KPiA+ICAgfSAgYm9vdG1vZHVsZV9raW5kOw0KPiA+DQo+ID4gK2VudW0gbWVtYmFu
a190eXBlIHsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBUaGUgTUVNQkFOS19ERUZBVUxUIHR5
cGUgcmVmZXJzIHRvIGVpdGhlciByZXNlcnZlZCBtZW1vcnkgZm9yDQo+IHRoZQ0KPiA+ICsgICAg
ICogZGV2aWNlL2Zpcm13YXJlICh3aGVuIHRoZSBiYW5rIGlzIGluICdyZXNlcnZlZF9tZW0nKSBv
ciBhbnkgUkFNDQo+ICh3aGVuDQo+ID4gKyAgICAgKiB0aGUgYmFuayBpcyBpbiAnbWVtJy4NCj4g
DQo+IFR5cG86IE1pc3NpbmcgJyknDQo+IA0KPiBUaGlzIGNhbiBiZSB1cGRhdGVkIG9uIGNvbW1p
dCBpZiB3ZSBkZWNpZGUgdG8ga2VlcCB0aGUgY3VycmVudCBuYW1pbmcNCj4gc2NoZW1lLg0KDQpE
b24ndCBib3RoZXIsIEkgd2lsbCBkbyBpdCBhcyB0aGlzIHBhdGNoIG5lZWQgYSByZXNwaW4gYW55
d2F5Li4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQo=

