Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07B622968
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 12:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440858.695090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osioh-00059d-QH; Wed, 09 Nov 2022 11:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440858.695090; Wed, 09 Nov 2022 11:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osioh-00057G-Lp; Wed, 09 Nov 2022 11:00:23 +0000
Received: by outflank-mailman (input) for mailman id 440858;
 Wed, 09 Nov 2022 11:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mL0W=3J=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1osiog-00057A-PV
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 11:00:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b45c803e-601d-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 12:00:21 +0100 (CET)
Received: from DB3PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:8:1::32) by
 AS8PR08MB9929.eurprd08.prod.outlook.com (2603:10a6:20b:564::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 11:00:12 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::ca) by DB3PR06CA0019.outlook.office365.com
 (2603:10a6:8:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21 via Frontend
 Transport; Wed, 9 Nov 2022 11:00:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 11:00:12 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 09 Nov 2022 11:00:11 +0000
Received: from 84db76e3015c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0ABBFAD5-997F-4278-A175-E5E75AB11145.1; 
 Wed, 09 Nov 2022 11:00:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84db76e3015c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 11:00:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5461.eurprd08.prod.outlook.com (2603:10a6:20b:10e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 11:00:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Wed, 9 Nov 2022
 11:00:01 +0000
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
X-Inumbo-ID: b45c803e-601d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kbDgt+2ZRsoEr55EkT3i4t7FvvH2GPtOOSFSvLKDRclwvmumzXz5jKFSZXpjA74G/s8XYv79PYeL3NdjDodrz5aevHNDasD4F/wZTD7ytyFCIelmljgb+rCi5sQmfNYGE1pHs6NBjn/gAZ7gLjEJjBDsmSqi5BcWlzEon76uFzzd2CmlGiB0B45aJcVfkOznszOvpl+KitlRFHF+sEDCbHUogdjmfT96FDlFhMa+ykZ+n15yHGnO2XmIw3/oCyeBSJc0G+qOz7U1zBdaqZQI0hRTbUiurWzpVahXMwxMvFt+M9YnrPDte9By40/HS2lZdc3Lr0iQO4Ho5F2U+uF9XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tnucfl3+Furx4fxgjuyQjuQOVOPuXWdtJAyO5kEwB8=;
 b=Vqd54iR2Ikc2+d0Jd3B1w36hMEQ2nbfIEr3G1pGG530CklGrwMGWl7xyAzowqVgO+OzeIACzmVPwYo/Dq+pU0XxbgYK75uuQtNcQgcRb4alVOcAoM9LaN39rQE73MNgPlGICePaK1XUNsBrkf9XfHd91d8rR6D3WmAN0fZXp2RuQEN4nMwFVSMjSG9fj5Wos/48yBuPz8Fk+L38KPpEAjd063c9VYznkSMKb4BVhkausUSNl5dhJCtLWpNJb/e+JjviVbrxU3/9OtLrTsCEjgKjKxRzKsN/wEedgISKgWiFKBNsaoUV3uB9WHy2SvBxGaSE4bYKfZdXLdrmRr4bycw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tnucfl3+Furx4fxgjuyQjuQOVOPuXWdtJAyO5kEwB8=;
 b=3BLvdZZaRgWoAD6QFWEwAPi2CkeRpSnYQ8V5CEAwmQujmK4IOh/TbVB8o+S/rKPOBZSgjijRpJiJx7IVMBQ1ea6nT/z1SwwR3LtSQ4qsVEEbCp8h7TG1Om6v3AHtaajW+yVQrR76rzC7tnQU9qAKHydHMmssfDwjlbXaiW7p0jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by52rsXF+yKj7SbyCWrNZjtcYGpA/5FlwzRAzs/odQ+F/7d89Xusdudyw+Dt7Etd0IiwBmEvqFpXjiWOrpdLKXkIAeiK7NcEqlqoFfJkTbDyenacY0qfWa6oi+qcS7jL4rM37yE5dK39bjI3GhrLwJ3l3u0DstOAYie2LfE88ZPpE6kG9f5e3qnFMz8bCEnLDgyIy4nG7W9mCupB4f9AMbpOmC8O46ioWz9CAhNvFJfIy5hf31Y9jAavne2dvbtqODNfsf8yleA2TNuihoWadZ5HWflm7nPABA0xmkk+9ysCXeiRZJ96jBZJKLGPjw3jp7tJZTRHjc6qkOXka7bPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tnucfl3+Furx4fxgjuyQjuQOVOPuXWdtJAyO5kEwB8=;
 b=GQ+BVDl6K13IHM2VbPDqrBBJr72ZUI6y1bUEfJDfW5ukGJ/g2HZxkkIyqZLJuDabBGAreSjmsBr7PdhYFSLW+CzqpQR+UpYdjFoUGOGtszhARR7Xjoo1oRFZDAfWJiHwth+GSAFID18XjseU+ZKO2FWntAMlZkuXT1dXlD4h9IZcjP05N6c0QBG4Z/NTfsfILiNIC8vnj4VQPMoBn+I9B9zrY9qJIn0D99DbGdQWfj1qvxnGv10sEBy1gUoVZMsrJ88hQlJqDkqPuwRleHG4yFJPg4xEGNThiv3snat2K1kikMTuiEGrWu5dD3T47qTwL69GTMehy6Z7jULyrp6cxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tnucfl3+Furx4fxgjuyQjuQOVOPuXWdtJAyO5kEwB8=;
 b=3BLvdZZaRgWoAD6QFWEwAPi2CkeRpSnYQ8V5CEAwmQujmK4IOh/TbVB8o+S/rKPOBZSgjijRpJiJx7IVMBQ1ea6nT/z1SwwR3LtSQ4qsVEEbCp8h7TG1Om6v3AHtaajW+yVQrR76rzC7tnQU9qAKHydHMmssfDwjlbXaiW7p0jg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Topic: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Index: AQHY76ZET1O4McAMZk+SDG8R2oR8564uaneAgAgKxzA=
Date: Wed, 9 Nov 2022 11:00:01 +0000
Message-ID:
 <AS8PR08MB7991977A4B04F33D9DDDBEE1923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
 <952950b5-33c9-6872-0cc4-6ebdf1e015ca@suse.com>
In-Reply-To: <952950b5-33c9-6872-0cc4-6ebdf1e015ca@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E5291037BE84824C9DDB3EC18800E6C3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM7PR08MB5461:EE_|DBAEUR03FT037:EE_|AS8PR08MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: fe204b68-c7ad-4ff5-0e1e-08dac24192f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aWY6KEsndTC8VuX5RF2+41S14Fx7RBQ+6Kvc8VekTv7n4ohpdRoQo+uTUIQG+g6wuShUu2bgJ5u63BYayy71cjTkoMgr0wQRq5VTlgoF7K1+BifjTOdn/CIxbLIWFniP5YLFqS+Dj3CSQqvIvfTh1s2Wg2HGBpIQQtmlxzxXP7bsyh/vFRZt75Nv9RPtsu0IfoNGxh2/32LShslejp3MA9G4gvIN5h2OCIEYX9+hRIYpTKx3epyLSyqF+eRk13ylRQ7juZHuhQYpvokuub5ncqF1ao99OakxRIy+CJkJaa3XEJh4j+4LCLWlPOvZaqJa+LV84z8HvthhmXuHF0aUJq5qgF44synsFieuS0mx9riIFVEpFVn51BH6QFAZTI0D4KHMAusxkF9snLSQXDOHEHuxQN0uGYVKUeHZLFbUiVQ+3FgSQcLJjnRvM09sBNNf+KK/lproKdotE2sOLj9+faARhXExsuCUXKwwNS2uL9Fpy6cf85TcMWOqlMHCd0iHIh9DwS+mKHDVYmuSkupaMU7xBDnJZfi2XS4isTUBeZPJIATbh2BJ/JN1W6eLLfJ5LeJhkhVjuubyyjmZelr49CG6KeWY/W1rX5yPff7pEQ1b1OzX6HYGjYZkHM1QiSkyUQTi5ndmu6jX03R5HqIPuV/oukoYgoUuSBauKfQf39FKOf1FYqQoD+Zs7D9IJ3ja/3pHP6wBfJjBu/4KAkGwkOex4DNz8cGTmNH8AZz0yXsNb911VrqdGU8VYfF8+QBwJCsliD/zW3AU0CHjcpkF7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(52536014)(41300700001)(4744005)(8936002)(5660300002)(54906003)(316002)(110136005)(71200400001)(478600001)(86362001)(186003)(2906002)(7696005)(6506007)(9686003)(26005)(64756008)(66446008)(4326008)(55016003)(66476007)(66946007)(38100700002)(76116006)(8676002)(66556008)(33656002)(38070700005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5461
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff85e717-677e-480c-6e59-08dac2418c6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YTLvDftdB3rR6TPCUDI3EIXq5JDbhk3evIrferRsZdV8mtelpYvhTGX+LbByPgmFep4mZCPUWA4y8aseye4BvhWbNLd3a4+oiFdgkYZnmPO9Kd+z1D3F1HT0Evhohx0gdPZECa+SPAZ2phjsJcCeRWBOYfyXGR4oJJZSXEeQ17FzEp29w/c4IorbsUMJYf502jqZy1jrWAo5CK7pbvoCTJ2e7WU21cWyMX+n3dDBTfEFBPzHT4+gS2otJ6xnrbfX/8lyGGmAb3FaKwBetYRDeLd805H/iMcDmt2FdbjOdhbqauBDKsHqw+VuEiUaoH9AHj60sP8ySKW3G0kB3TVwiObrB5Y5/R3uT/5p2bDHB49rvxxVtZ/o9SsxUcBJh/PvWhQo+gcWK2r/UV1d+ymiGFXbvXTrdZKNm8ACDd/8j5z4JzRIp6/z1uY00HakuPd8ljpfMXSxoOknbjKTJnlJ8MqEUDthpmoGNxoEcYy37CTQA+j+7Z+d3n7ZDc2jGnWNJR6Obwlk79LB/bWPKpMtUfeBpD83S4XllPXgF/HW//oqjjFz1ymWvvVXdbh0PdKO661EuTslXl7CskI9dy8VZvMRxfm26DjCmVdvXfu9fZwyAOXAtoKzmaHhzqvo8wANWfPPUM68Ey3Z5gl02CYrKSeyK+Oi3Ei/jz+qROF0BnXjg08IhEMcC0hE0MsbfRiruqiSAzgU+c3C4zzjfoALuMvyQ5Z4dtEGzmKy96N5rVa4SfBY81645sL8xU3mT1VQ9IHjjISFmWWtG6iy3xO4Pw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(8676002)(82740400003)(4326008)(33656002)(70586007)(70206006)(316002)(7696005)(55016003)(40480700001)(4744005)(40460700003)(336012)(2906002)(47076005)(41300700001)(9686003)(86362001)(26005)(36860700001)(186003)(5660300002)(8936002)(52536014)(6506007)(82310400005)(478600001)(110136005)(356005)(54906003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 11:00:12.0189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe204b68-c7ad-4ff5-0e1e-08dac24192f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9929

SGkgQW5kcmV3LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcgdjMgMS8yXSBhbWQv
dmlydF9zc2JkOiBzZXQgU1NCRCBhdCB2Q1BVIGNvbnRleHQNCj4gc3dpdGNoDQo+ID4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiB3aXRoIG9uZSBm
dXJ0aGVyIHJlbWFyazoNCj4gDQo+IElzICJjbGVhcmVkIiBpbiB0aGUgY29tbWVudCBjb3JyZWN0
IHdoZW4gInNwZWMtY3RybD1zc2JkIj8gSSB0aGluayAic3VpdGFibHkNCj4gc2V0IiBvciAiY2xl
YXJlZC9zZXQiIG9yIHNvbWUgc3VjaCB3b3VsZCBiZSB3YW50ZWQuIFRoaXMgY291bGQgY2VydGFp
bmx5IGJlDQo+IGFkanVzdGVkIHdoaWxlIGNvbW1pdHRpbmcgKGlmIHlvdSBhZ3JlZSksIGJ1dCBJ
IHdpbGwgd2FudCB0byBnaXZlIEFuZHJldyBzb21lDQo+IHRpbWUgYW55d2F5IGJlZm9yZSBwdXR0
aW5nIGl0IGluLCB0byBhdm9pZCB0aGVyZSBhZ2FpbiBiZWluZyBvYmplY3Rpb25zIGFmdGVyDQo+
IGEgY2hhbmdlIGluIHRoaXMgYXJlYSBoYXMgZ29uZSBpbi4NCg0KQWxzbyB0aGlzIG9uZSBwbGVh
c2UgOikgQW55IGZlZWRiYWNrIHdvdWxkIGJlIGFwcHJlY2lhdGVkLg0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

