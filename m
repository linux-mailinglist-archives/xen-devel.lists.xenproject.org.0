Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592A60DDD5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 11:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430393.682030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncTs-0003IX-JY; Wed, 26 Oct 2022 09:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430393.682030; Wed, 26 Oct 2022 09:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncTs-0003Gl-GB; Wed, 26 Oct 2022 09:13:48 +0000
Received: by outflank-mailman (input) for mailman id 430393;
 Wed, 26 Oct 2022 09:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ktaj=23=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oncTq-0003Gf-De
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 09:13:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d4c3923-550e-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 11:13:44 +0200 (CEST)
Received: from AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19)
 by AS8PR08MB8567.eurprd08.prod.outlook.com (2603:10a6:20b:566::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Wed, 26 Oct
 2022 09:13:41 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::b4) by AM6PR08CA0031.outlook.office365.com
 (2603:10a6:20b:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 09:13:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 26 Oct 2022 09:13:40 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 26 Oct 2022 09:13:40 +0000
Received: from 966f1dd02493.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F76CA69-CCB7-4479-B5AF-5C3A59FA3406.1; 
 Wed, 26 Oct 2022 09:13:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 966f1dd02493.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 09:13:29 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB6137.eurprd08.prod.outlook.com (2603:10a6:10:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Wed, 26 Oct
 2022 09:13:22 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 09:13:21 +0000
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
X-Inumbo-ID: 7d4c3923-550e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Hc/etjXu/80WU0ujZivZjnL1WmFomIyIqp/DwSwdS+IdMSFVV7+H2EutGka8n9eAt7MHsdTdPJMRZiG51yUAcLdWp5SwGGuqKXeX1dvhUgwFsw6yrIwPMyPgW5uFb/Fa5dyQGF/M3uk+kmlVqdN/LlSCAiOnZZaeSbgSN2BVq2Q4M6pDKQXkljqOQ7eqXETZ+YcVAPUenAa7U+3lUNwFSwE6Lv6DT85bxrwSXVe1fDIaGeqKpFuX0IseUFeJ4sMD7SbaCjQUJGdId9rVVzlvTQFawgRAHLI9FXJ1jGoJF0DmzpmuXHblylaxSf/pTUx47pPYivG3W8YknnjcDpekmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQk+csCPFOjwgAUQb3WtmTkUtqIGjY1egY0hzhsYz/w=;
 b=NSg3HBhA0RVweJe0FuMxYSLz66bds7p8udZwCXhlu+IhwaU8MnbY3mrWvEel9yHBJ/qLrIFIuS6BuS5jkk0C1tVida0WZX7ySHaxgo07xafmKXuB1/t1ur8igv5xd6jmg9aevzxD1WtqPhQZUprNN/6pXmjh6L0aKzrEKKY2ywt8PEF6HlHwrbjGtX+cwjzdt9Htvc4fn0tLnaEhPacNpJ4EZylqhvq7ZUwQutqS1TmS02cLAh87GP/nw+ONCL1h3aB/Olj4taTBmkhMTrdXhXfEhjHLpMOUT2zaK5kbCGF3HxjAN9CzD9vUFP0UmclJkR0VNmKrOGahp/kH3Hu6lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQk+csCPFOjwgAUQb3WtmTkUtqIGjY1egY0hzhsYz/w=;
 b=dOZ8vy7GitYquCVAgpv4syPjDPVDu9LXgBtmtP69/cr9KOzsBNmYPaDD0kcGnbu/NMtWpr1JfhJgYONTOV4+/6rztZ9FSttAdmhIeEfVYdocoFvt11Q0PuZWoFT6wQyWGro5La0pduib32JS/omdlt16lw6aFkCEihbNlk0Z8wY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62c63edd3fb210f7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmkfQgmcV1NA2K2z7EgmJN66O6Vd5DYb7PnD6Tduna4F6c7tgWB39mdkoX0NYezNCWbOxA2tBy8GZ3kysdmKFvy30RSryfW9aFa42GJAaINidftn28AEOYFPFU+eP7leN3mjzzjdDzQUmuVOFnCItuyvMmziiQpUiv9DUmyjGOvjKjb+6XcWycPaStFYwwggpTHkgD3fS/mEU1UY5AcslAmTvPFanRS2dVAvGTP63Qd2nD7E8kwFuyAuyc843zsI7kAzCWXd1srYcJs8zJ8tf5NR1FFnTQ3iBSkkQGYkWq8g8IrSpyfwGHVUT/CmHfQMIoZZQWhaKv4B1AX/af6Pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQk+csCPFOjwgAUQb3WtmTkUtqIGjY1egY0hzhsYz/w=;
 b=keCUFbkSGyKfrE1E4FImHCHLjV9Rt6Ctegop+umcHwW9fWAExEzsWe5rFDuB0tZXgoyBk6DjtwGN8FIPeYnlDs8O4fhD9svIyBtAhW0SafRLrGaV8okL+QJJJVSYbeDyoof50/pOnwOWJtDqeaHXQvDlAJDvqLzno/QBGSJ7rzhPtS2/dD6Gj2mHpo7ouI+ljfqYQlQo6LFVph82htVkHLcwcZEwY4lY6UWl0eFk2IZNAYqbP+2gtfZWyotU+XZaWV4WL0KeKOEtN1Ck1n+FAlRfdizStpqFEB8zYrUQS1iG2fyaibIAcdd52/oy1w/63iglp208FaAJhD7qqFgMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQk+csCPFOjwgAUQb3WtmTkUtqIGjY1egY0hzhsYz/w=;
 b=dOZ8vy7GitYquCVAgpv4syPjDPVDu9LXgBtmtP69/cr9KOzsBNmYPaDD0kcGnbu/NMtWpr1JfhJgYONTOV4+/6rztZ9FSttAdmhIeEfVYdocoFvt11Q0PuZWoFT6wQyWGro5La0pduib32JS/omdlt16lw6aFkCEihbNlk0Z8wY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [v2] Proposal for deviations in static analyser findings
Thread-Topic: [v2] Proposal for deviations in static analyser findings
Thread-Index: AQHY6FpvvKvqm6eEhUKW2GdsP99AnK4fwTyAgACkb4A=
Date: Wed, 26 Oct 2022 09:13:20 +0000
Message-ID: <88950CCA-67E1-408A-82D7-38C3EBBFD6CC@arm.com>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
 <alpine.DEB.2.22.394.2210251619090.1397955@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210251619090.1397955@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DBBPR08MB6137:EE_|AM7EUR03FT012:EE_|AS8PR08MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: e79cd9b6-585d-46ba-ab48-08dab7325fa9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NeB1Xl4pQSnO1OsyuH7LFy6Dy97ph8+FtM+drXCaHhyAnSJzaxIRLXeo8oqhl7Ac7YajVXsDDNXJwvI5Zs7FnTe5OvQb2vCpADYcECGgH22J1RH2k2NoBBfORe7AnXoT3Ha1va2s0RmCLUTQGToD2uyaPSdujDKfKKEoVNh7X5XOeEyT8jypGR10qKNc3o5T53A1cHMATRd5Gikx0aFgvMDpvFYPXjgY9Rm4qiiiHfowsqLh2Tig9vOAosyqKlDeTC/FQ/nD+9J1a7MQ24BRK2uMqQb3XPhYAVRTvjdD3jjMPN9AuSE60HhtvL0By6A11RyzjMOy+WrH3Op43kncUiVkTpmXuVhfK23YUZXD0ZmDDgrcDl/U3T8PCmbs1lZOiDLKgqMtMJAD9/g5aqVNnwgFNXyO1imLbB3QwJ5wsnpfK1DlWY+femfXO//VRj4wujfqRXTH699B82ubzS3N6zP7KrXsQAbErv/bmYWxP4k4RHagAqHz7JQEBj5RdI4myD0jXEBL5LV1XcJHeJfZVxV7/GTTy3G4bTW67LqnWiiIhqsY3AtRdDJ33ZRdH9t6VHzU1Z4mhe3ypvjck2C6cv6tUz1O/4glwyni/sNfI3P1AtUeWDpPpIv/4itcsHzeuO18Buylsz6Msf/5iHcW1Lip2Ly8pLpoitn8DlhoiowZXZqeoarHRX8CgUIYyEEPwuzNCZdGqbVGe1KAbbMfTSunAosmc+ccGYlOgz7uOb3DBKe6BgV1aClXt9SzO2J3b4YVk2CzGi0OYpD5/yOVBqKedSb3noyS6/BG3dfpa6agGW0+MQ/WjYoUA/wiDMHA07p13oNOwFXTMZJsOBIHRIZEmkIhdpx8suJYwrEqiWBxbftnUh1eO0kbdlahupby
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(71200400001)(186003)(2906002)(478600001)(84970400001)(966005)(38100700002)(6486002)(91956017)(316002)(41300700001)(38070700005)(66946007)(76116006)(4326008)(8676002)(64756008)(66446008)(66476007)(54906003)(66556008)(53546011)(36756003)(6506007)(83380400001)(122000001)(6512007)(5660300002)(26005)(8936002)(86362001)(2616005)(33656002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1DA57FCC293FC439EB0084D73C26EB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6137
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ace1534f-7412-4b48-b7bb-08dab732538e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cyo6+Zir9/tVcG3t5S/JQIZv9N7OA4JTr3FPqgiQ/kbCXqb6cRsdbNRWpwQiKDR5P+e+DCoSbAdhf15PutKsRaTFTA9YY7TX8hQQLOcVYutpdRF8HJRA9EvBTNtZGut2r0HaQdbKG7Oe3KpkjY3rQ5f8juu6OKT3XBC4LTjz2mS5YfP31R5J6ADPGvDzjiP2WcO0wY5nQj4qJ3j9md5g/Hc6njWi9ODZx6gx+kzAvd+xN++7M4DiT0htse+0qRVZ30ftvs1N4kihw0qrmW45pIi6xWA7D4kkHoYuu1t7fXnQ3uxHp7qmtHdcjn858CQ82oveHhlfExo4Mop8FGyeAbgjVHrBwRYl8usDIRctljrQCsu/hw5gxx/83kq08dg4cHrXFEoeBJLYRY7dmMnzAU6FdBAIMrP8HSBlezvmIQUj9eQmKZX7VLVw4kY4vHYfAQubVpyv8x3nZuCGD6YAmo31mfnqBoaelp6cfkiG5fGfEUFaywzJAbQgAXnsaik4hqQwqIoJANIdvekyfgjrklAp4ZjCW5j7SCjRBHQ/8khDJ6SYkTTDJ5mT9ODWw6Y7EkX5nkY9N0lZDpxmMx9xE6qycSjL2Ev6ofxSxTk1Zl6N0ZxrjsO0W/m8Dk5l9leRh13hz1cXb3thUEU1gUKNm9cyysFYcI/5nuSu+VGF2WYuAyP0YAmUycuLWqs6sYrL+4IVQET1+0EhLIx7H2KtVHHQ5QZH9s2RThVGTDKYRd8wrLI7W1ScuhXkkEzpE1SHGwM2qZz34Lb/brgqfBXp6GWNFpO6bhNIgCcLPsLGm8oL2+4P3nYWzRU5qLJ29XCgZip5nPgFc6QSuAKyx5WHtg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(84970400001)(81166007)(356005)(82740400003)(47076005)(36860700001)(2906002)(6862004)(8936002)(5660300002)(83380400001)(336012)(186003)(86362001)(33656002)(26005)(40460700003)(53546011)(316002)(966005)(2616005)(40480700001)(54906003)(70586007)(6512007)(6486002)(478600001)(4326008)(70206006)(8676002)(41300700001)(6506007)(107886003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 09:13:40.6768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79cd9b6-585d-46ba-ab48-08dab7325fa9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8567

DQoNCj4gT24gMjYgT2N0IDIwMjIsIGF0IDAwOjI0LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAyNSBPY3QgMjAyMiwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IEhpIGFsbCwNCj4+IA0KPj4gVGhpcyBpcyB0aGUgVjIgb2Yg
dGhlIHByb3Bvc2FsIGZvciBkZXZpYXRpb25zIHRhZ2dpbmcgaW4gdGhlIFhlbiBjb2RlYmFzZSwg
dGhpcyBpbmNsdWRlcw0KPj4gYWxsIHRoZSBmZWVkYmFja3MgZnJvbSB0aGUgRnVTYSBzZXNzaW9u
IGhlbGQgYXQgdGhlIFhlbiBTdW1taXQgMjAyMiBhbmQgYWxsIHRoZQ0KPj4gZmVlZGJhY2tzIHJl
Y2VpdmVkIGluIHRoZSBwcmV2aW91cyBwcm9wb3NhbCBzZW50IG9uIHRoZSBtYWlsaW5nIGxpc3Qu
DQo+IA0KPiBJdCB3b3VsZCBiZSBnb29kIHRvIGNvbW1pdCB0aGlzIHByb3Bvc2FsICh3aGVuIGFj
a2VkKSBhcyBhIHBhbmRvYyB1bmRlcg0KPiB4ZW4uZ2l0L2RvY3MvbWlzcmENCg0KWWVzIGl0IHdp
bGwgYmUgcGFydCBvZiBteSBzZXJpZSB0aGF0IEkgd2lsbCBwdXNoIHNvb24NCg0KPiANCj4gDQo+
PiBIZXJlIGEgbGluayB0byB0aGUgcHJldmlvdXMgdGhyZWFkOiANCj4+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0xMC9tc2cwMDU0MS5o
dG1sDQo+PiANCj4+IERvY3VtZW50aW5nIHZpb2xhdGlvbnMNCj4+ID09PT09PT09PT09PT09PT09
PT09PT0NCj4+IA0KPj4gU3RhdGljIGFuYWx5c2VycyBhcmUgdXNlZCBvbiB0aGUgWGVuIGNvZGVi
YXNlIGZvciBib3RoIHN0YXRpYyBhbmFseXNpcyBhbmQgTUlTUkENCj4+IGNvbXBsaWFuY2UuDQo+
PiBUaGVyZSBtaWdodCBiZSB0aGUgbmVlZCB0byBzdXBwcmVzcyBzb21lIGZpbmRpbmdzIGluc3Rl
YWQgb2YgZml4aW5nIHRoZW0gYW5kDQo+PiBtYW55IHRvb2xzIHBlcm1pdCB0aGUgdXNhZ2Ugb2Yg
aW4tY29kZSBjb21tZW50cyB0aGF0IHN1cHByZXNzIGZpbmRpbmdzIHNvIHRoYXQNCj4+IHRoZXkg
YXJlIG5vdCBzaG93biBpbiB0aGUgZmluYWwgcmVwb3J0Lg0KPj4gDQo+PiBYZW4gd2lsbCBpbmNs
dWRlIGEgdG9vbCBjYXBhYmxlIG9mIHRyYW5zbGF0aW5nIGEgc3BlY2lmaWMgY29tbWVudCB1c2Vk
IGluIGl0cw0KPj4gY29kZWJhc2UgdG8gdGhlIHJpZ2h0IHByb3ByaWV0YXJ5IGluLWNvZGUgY29t
bWVudCB1bmRlcnN0YW5kYWJsZSBieSB0aGUgc2VsZWN0ZWQNCj4+IGFuYWx5c2VyIHRoYXQgc3Vw
cHJlc3MgaXRzIGZpbmRpbmcuDQo+PiANCj4+IEluIHRoZSBYZW4gY29kZWJhc2UsIHRoZXNlIHRh
Z3Mgd2lsbCBiZSB1c2VkIHRvIGRvY3VtZW50IGFuZCBzdXBwcmVzcyBmaW5kaW5nczoNCj4+IA0K
Pj4gLSBTQUYtWC1zYWZlOiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxpbmUgb2YgY29k
ZSBjb250YWlucyBhIGZpbmRpbmcsIGJ1dA0KPj4gdGhlIG5vbiBjb21wbGlhbmNlIHRvIHRoZSBj
aGVja2VyIGlzIGFuYWx5c2VkIGFuZCBkZW1vbnN0cmF0ZWQgdG8gYmUgc2FmZS4NCj4+IC0gU0FG
LVgtZmFsc2UtcG9zaXRpdmUtPHRvb2w+OiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxp
bmUgb2YgY29kZSBjb250YWlucyBhDQo+PiBmaW5kaW5nLCBidXQgdGhlIGZpbmRpbmcgaXMgYSBi
dWcgb2YgdGhlIHRvb2wuDQo+PiANCj4+IFNBRiBzdGFuZHMgZm9yIFN0YXRpYyBBbmFseXNlciBG
aW5kaW5nLCB0aGUgWCBpcyBhIHBsYWNlaG9sZGVyIGZvciBhIHBvc2l0aXZlDQo+PiBudW1iZXIs
IHRoZSBudW1iZXIgYWZ0ZXIgU0FGLSBzaGFsbCBiZSBpbmNyZW1lbnRhbCBhbmQgdW5pcXVlLCBi
YXNlIHRlbg0KPj4gbm90YXRpb24gYW5kIHdpdGhvdXQgbGVhZGluZyB6ZXJvcy4NCj4+IA0KPj4g
RW50cmllcyBpbiB0aGUgZGF0YWJhc2Ugc2hvdWxkIG5ldmVyIGJlIHJlbW92ZWQsIGV2ZW4gaWYg
dGhleSBhcmUgbm90IHVzZWQNCj4+IGFueW1vcmUgaW4gdGhlIGNvZGUgKGlmIGEgcGF0Y2ggaXMg
cmVtb3Zpbmcgb3IgbW9kaWZ5aW5nIHRoZSBmYXVsdHkgbGluZSkuDQo+PiBUaGlzIGlzIHRvIG1h
a2Ugc3VyZSB0aGF0IG51bWJlcnMgYXJlIG5vdCByZXVzZWQgd2hpY2ggY291bGQgbGVhZCB0byBj
b25mbGljdHMNCj4+IHdpdGggb2xkIGJyYW5jaGVzIG9yIG1pc2xlYWRpbmcganVzdGlmaWNhdGlv
bnMuDQo+PiANCj4+IEFuIGVudHJ5IGNhbiBiZSByZXVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzIGlu
IHRoZSBjb2RlIHRvIHN1cHByZXNzIGEgZmluZGluZyBpZg0KPj4gYW5kIG9ubHkgaWYgdGhlIGp1
c3RpZmljYXRpb24gaG9sZHMgZm9yIHRoZSBzYW1lIG5vbi1jb21wbGlhbmNlIHRvIHRoZSBjb2Rp
bmcNCj4+IHN0YW5kYXJkLg0KPj4gDQo+PiBBbiBvcnBoYW4gZW50cnksIHRoYXQgaXMgYW4gZW50
cnkgd2hvIHdhcyBqdXN0aWZ5aW5nIGEgZmluZGluZyBpbiB0aGUgY29kZSwgYnV0IGxhdGVyDQo+
PiB0aGF0IGNvZGUgd2FzIHJlbW92ZWQgYW5kIHRoZXJlIGlzIG5vIG90aGVyIHVzZSBvZiB0aGF0
IGVudHJ5IGluIHRoZSBjb2RlLCBjYW4gYmUNCj4+IHJldXNlZCBhcyBsb25nIGFzIHRoZSBqdXN0
aWZpY2F0aW9uIGZvciB0aGUgZmluZGluZyBob2xkcy4gVGhpcyBpcyBkb25lIHRvIGF2b2lkIHRo
ZQ0KPj4gYWxsb2NhdGlvbiBvZiBhIG5ldyBlbnRyeSB3aXRoIGV4YWN0bHkgdGhlIHNhbWUganVz
dGlmaWNhdGlvbiwgdGhhdCB3b3VsZCBsZWFkIHRvIHdhc3RlDQo+PiBvZiBzcGFjZSBhbmQgbWFp
bnRlbmFuY2UgaXNzdWVzIG9mIHRoZSBkYXRhYmFzZS4NCj4+IA0KPj4gVGhlIGZpbGVzIHdoZXJl
IHRvIHN0b3JlIGFsbCB0aGUganVzdGlmaWNhdGlvbnMgYXJlIGluIHhlbi9kb2NzL21pc3JhLyBh
bmQgYXJlDQo+PiBuYW1lZCBhcyBzYWZlLmpzb24gYW5kIGZhbHNlLXBvc2l0aXZlLTx0b29sPi5q
c29uLCB0aGV5IGhhdmUgSlNPTiBmb3JtYXQsIGVudHJpZXMNCj4+IG9mIHRoZXNlIGZpbGVzIGhh
dmUgaW5kZXBlbmRlbnQgSUQgbnVtYmVyaW5nLg0KPj4gDQo+PiBIZXJlIGlzIGFuIGV4YW1wbGUg
dG8gYWRkIGEgbmV3IGp1c3RpZmljYXRpb24gaW4gc2FmZS5qc29uOjoNCj4+IA0KPj4gfHsNCj4+
IHwgICAgInZlcnNpb24iOiAiMS4wIiwNCj4+IHwgICAgImNvbnRlbnQiOiBbDQo+PiB8ICAgICAg
ICB7DQo+PiB8ICAgICAgICAgICAgImlkIjoiU0FGLTAtc2FmZSIsDQo+PiB8ICAgICAgICAgICAg
ImFuYWx5c2VyIjogew0KPj4gfCAgICAgICAgICAgICAgICAiY3BwY2hlY2siOiAibWlzcmEtYzIw
MTItMjAuNyIsDQo+PiB8ICAgICAgICAgICAgICAgICJjb3Zlcml0eSI6ICJtaXNyYV9jXzIwMTJf
cnVsZV8yMF83X3Zpb2xhdGlvbiIsDQo+PiB8ICAgICAgICAgICAgICAgICJlY2xhaXIiOiAiTUMz
UjEuUjIwLjciDQo+PiB8ICAgICAgICAgICAgfSwNCj4+IHwgICAgICAgICAgICAibmFtZSI6IOKA
nFIyMC43IEMgbWFjcm8gcGFyYW1ldGVycyBub3QgdXNlZCBhcyBleHByZXNzaW9uIiwNCj4+IHwg
ICAgICAgICAgICAidGV4dCI6ICJUaGUgbWFjcm8gcGFyYW1ldGVycyB1c2VkIGluIHRoaXMgW+KA
pl0iDQo+PiB8ICAgICAgICB9LA0KPj4gfCAgICAgICAgew0KPj4gfCAgICAgICAgICAgICJpZCI6
4oCdU0FGLTEtc2FmZSIsDQo+PiB8ICAgICAgICAgICAgImFuYWx5c2VyIjogew0KPj4gfCAgICAg
ICAgICAgICAgICAiY3BwY2hlY2siOiAidW5yZWFkVmFyaWFibGUiLA0KPj4gfCAgICAgICAgICAg
ICAgICAiY292ZXJpdHkiOiAiVU5VU0VEX1ZBTFVFIg0KPj4gfCAgICAgICAgICAgIH0sDQo+PiB8
ICAgICAgICAgICAgIm5hbWUiOiDigJxWYXJpYWJsZSBzZXQgYnV0IG5vdCB1c2VkIiwNCj4+IHwg
ICAgICAgICAgICAidGV4dCI6IOKAnEl0IGlzIHNhZmUgYmVjYXVzZSBb4oCmXSINCj4+IHwgICAg
ICAgIH0sDQo+PiB8ICAgICAgICB7DQo+PiB8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMi1zYWZl
IiwNCj4+IHwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCj4+IHwgICAgICAgICAgICAibmFt
ZSI6ICJTZW50aW5lbCIsDQo+PiB8ICAgICAgICAgICAgInRleHQiOiAiIg0KPj4gfCAgICAgICAg
fQ0KPj4gfCAgICBdDQo+PiB8fQ0KPj4gDQo+PiBIZXJlIGlzIGFuIGV4YW1wbGUgdG8gYWRkIGEg
bmV3IGp1c3RpZmljYXRpb24gaW4gZmFsc2UtcG9zaXRpdmUtY3BwY2hlY2suanNvbjo6DQo+PiAN
Cj4+IHx7DQo+PiB8ICAgICJ2ZXJzaW9uIjogIjEuMCIsDQo+PiB8ICAgICJjb250ZW50IjogWw0K
Pj4gfCAgICAgICAgew0KPj4gfCAgICAgICAgICAgICJpZCI6IlNBRi0wLWZhbHNlLXBvc2l0aXZl
LWNwcGNoZWNrIiwNCj4+IHwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQo+PiB8ICAgICAgICAg
ICAgICAgICJjcHBjaGVjayI6ICJtaXNyYS1jMjAxMi0yMC43Ig0KPj4gfCAgICAgICAgICAgIH0s
DQo+PiB8ICAgICAgICAgICAg4oCcdG9vbC12ZXJzaW9u4oCdOiDigJwyLjciLA0KPj4gfCAgICAg
ICAgICAgICJuYW1lIjog4oCcUjIwLjcgc2Vjb25kIG9wZXJhbmQgb2YgbWVtYmVyLWFjY2VzcyBv
cGVyYXRvciIsDQo+PiB8ICAgICAgICAgICAgInRleHQiOiAiVGhlIHNlY29uZCBvcGVyYW5kIG9m
IGEgbWVtYmVyIGFjY2VzcyBvcGVyYXRvciBzaGFsbCBiZSBhIG5hbWUgb2YgYSBtZW1iZXIgb2Yg
dGhlIHR5cGUgcG9pbnRlZCB0bywgc28gaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgaXQgaXMgd3Jv
bmcgdG8gdXNlIHBhcmVudGhlc2VzIG9uIHRoZSBtYWNybyBwYXJhbWV0ZXIuIg0KPiANCj4gQW55
IHdheSB3ZSBjYW4gbWFrZSB0aGUgdGV4dCBtYXggODAgY2hhcnMgaW4gbGVuZ3RocyAod2l0aG91
dCBicmVha2luZw0KPiB0aGUganNvbiBwYXJzZXIpPw0KDQpVbmZvcnR1bmF0ZWx5IGl0IGlzIGEg
bGltaXRhdGlvbiBvZiBqc29uLCBidXQgaXTigJlzIHNvIGVhc3kgdG8gaW50ZWdyYXRlIGluIHB5
dGhvbiBzY3JpcHRzIHRoYXQgSSBjb3VsZG7igJl0IGZpbmQgYSBiZXR0ZXIgYWx0ZXJuYXRpdmVz
IGluIHRlcm1zIG9mIGZsZXhpYmlsaXR5IGFuZCBhdmFpbGFiaWxpdHkgb2YgcGFyc2VyLg0KSSBn
dWVzcyBpbiBjYXNlIG9mIGp1c3RpZmljYXRpb25zIHRoYXQgbmVlZHMgbG90IG9mIHRleHQsIGdy
YXBocywgaW1hZ2VzLCB3ZSBjYW4gY29tbWl0IGEgZG9jdW1lbnQgYW5kIHB1dCB0aGUgcGF0aCB0
byBpdCBhcyB0ZXh0IGNvbnRlbnQuDQoNCj4gDQo+IEFsc28sIGlmIHdlIGFyZSBnb2luZyB0byBj
b21taXQgdGhpcyBkb2N1bWVudCBpbiB4ZW4uZ2l0LCBwbGVhc2UgdXNlDQo+IGNvbnNpc3RlbnRs
eSAiIGluc3RlYWQgb2Yg4oCcDQoNClllcyB0aGlzIGlzIGEgY29weS1wYXN0ZSBlcnJvciBJIHdp
bGwgZml4DQoNCj4gDQo+IA0KPj4gfCAgICAgICAgfSwNCj4+IHwgICAgICAgIHsNCj4+IHwgICAg
ICAgICAgICAiaWQiOuKAnVNBRi0xLWZhbHNlLXBvc2l0aXZlLWNwcGNoZWNrIiwNCj4+IHwgICAg
ICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCj4+IHwgICAgICAgICAgICDigJx0b29sLXZlcnNpb27i
gJ06IOKAnCIsDQo+PiB8ICAgICAgICAgICAgIm5hbWUiOiAiU2VudGluZWwiLA0KPj4gfCAgICAg
ICAgICAgICJ0ZXh0IjogIiINCj4+IHwgICAgICAgIH0NCj4+IHwgICAgXQ0KPj4gfH0NCj4+IA0K
Pj4gVG8gZG9jdW1lbnQgYSBmaW5kaW5nLCBqdXN0IGFkZCBhbm90aGVyIGJsb2NrIHtbLi4uXX0g
YmVmb3JlIHRoZSBzZW50aW5lbCBibG9jaywNCj4+IHVzaW5nIHRoZSBpZCBjb250YWluZWQgaW4g
dGhlIHNlbnRpbmVsIGJsb2NrIGFuZCBpbmNyZW1lbnQgYnkgb25lIHRoZSBudW1iZXINCj4+IGNv
bnRhaW5lZCBpbiB0aGUgaWQgb2YgdGhlIHNlbnRpbmVsIGJsb2NrLg0KPj4gDQo+PiBIZXJlIGEg
YnJpZWYgZXhwbGFuYXRpb24gb2YgdGhlIGZpZWxkIGluc2lkZSBhbiBvYmplY3Qgb2YgdGhlICJj
b250ZW50IiBhcnJheToNCj4+IC0gaWQ6IGl0IGlzIGEgdW5pcXVlIHN0cmluZyB0aGF0IGlzIHVz
ZWQgdG8gcmVmZXIgdG8gdGhlIGZpbmRpbmcsIG1hbnkgZmluZGluZw0KPj4gY2FuIGJlIHRhZ2dl
ZCB3aXRoIHRoZSBzYW1lIGlkLCBpZiB0aGUganVzdGlmaWNhdGlvbiBob2xkcyBmb3IgYW55IGFw
cGxpZWQNCj4+IGNhc2UuDQo+PiBJdCB0ZWxscyB0aGUgdG9vbCB0byBzdWJzdGl0dXRlIGEgWGVu
IGluLWNvZGUgY29tbWVudCBoYXZpbmcgdGhpcyBzdHJ1Y3R1cmU6DQo+PiAvKiBTQUYtMC1zYWZl
IFsuLi5dIFwqLw0KPiANCj4gTm8gbmVlZCBmb3IgdGhlIGZpbmFsIFwNCg0KTXkgdnNjb2RlIGV4
dGVuc2lvbiB0aGF0IHJlbmRlcnMgdGhlIC5yc3QgZmlsZSBpcyBjb21wbGFpbmluZyBpZiBJIGRv
buKAmXQgdXNlIHRoZSBmaW5hbCBcIC4NCg0KPiANCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdv
b2QgdG8gbWUuDQo+IA0KPiANCj4+IC0gYW5hbHlzZXI6IGl0IGlzIGFuIG9iamVjdCBjb250YWlu
aW5nIHBhaXIgb2Yga2V5LXZhbHVlIHN0cmluZ3MsIHRoZSBrZXkgaXMNCj4+IHRoZSBhbmFseXNl
ciwgc28gaXQgY2FuIGJlIGNwcGNoZWNrLCBjb3Zlcml0eSBvciBlY2xhaXIuIFRoZSB2YWx1ZSBp
cyB0aGUNCj4+IHByb3ByaWV0YXJ5IGlkIGNvcnJlc3BvbmRpbmcgb24gdGhlIGZpbmRpbmcsIGZv
ciBleGFtcGxlIHdoZW4gY292ZXJpdHkgaXMNCj4+IHVzZWQgYXMgYW5hbHlzZXIsIHRoZSB0b29s
IHdpbGwgdHJhbnNsYXRlIHRoZSBYZW4gaW4tY29kZSBjb21lbnQgaW4gdGhpcyB3YXk6DQo+PiAv
KiBTQUYtMC1zYWZlIFsuLi5dIFwqLyAtPiAvKiBjb3Zlcml0eVtjb3Zlcml0eS1pZF0gXCovDQo+
PiBpZiB0aGUgb2JqZWN0IGRvZXNuJ3QgaGF2ZSBhIGtleS12YWx1ZSwgdGhlbiB0aGUgY29ycmVz
cG9uZGluZyBpbi1jb2RlDQo+PiBjb21tZW50IHdvbid0IGJlIHRyYW5zbGF0ZWQuDQo+PiAtIG5h
bWU6IGEgc2ltcGxlIG5hbWUgZm9yIHRoZSBmaW5kaW5nDQo+PiAtIHRleHQ6IGEgcHJvcGVyIGp1
c3RpZmljYXRpb24gdG8gdHVybiBvZmYgdGhlIGZpbmRpbmcuDQo+PiANCj4+IA0KPj4gDQo+PiBI
ZXJlIGFuIGV4YW1wbGUgb2YgdGhlIHVzYWdlIG9mIHRoZSBpbi1jb2RlIGNvbW1lbnQgdGFncyB0
byBzdXBwcmVzcyBhIGZpbmRpbmcgZm9yIHRoZSBSdWxlIDguNjoNCj4+IA0KPj4gRWNsYWlyIHJl
cG9ydHMgaXQgaGVyZToNCj4+IGh0dHBzOi8vZWNsYWlyaXQuY29tOjM3ODcvZnMvdmFyL2xpYi9q
ZW5raW5zL2pvYnMvWEVOL2NvbmZpZ3VyYXRpb25zL2F4aXMtVGFyZ2V0L0FSTTY0L2F4aXMtYWdl
bnQvcHVibGljL2J1aWxkcy81NDkvYXJjaGl2ZS9FQ0xBSVIvb3V0L1BST0pFQ1QuZWNkOy9zb3Vy
Y2VzL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaC5odG1sI1I1MDc0M18xDQo+PiANCj4+IEFsc28g
Y292ZXJpdHkgcmVwb3J0cyBpdCwgaGVyZSBhbiBleHRyYWN0IG9mIHRoZSBmaW5kaW5nOg0KPj4g
DQo+PiB4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmg6Njg6DQo+PiAxLiBtaXNyYV9jXzIwMTJfcnVs
ZV84XzZfdmlvbGF0aW9uOiBGdW5jdGlvbiAiX3N0YXJ0IiBpcyBkZWNsYXJlZCBidXQgbmV2ZXIg
ZGVmaW5lZC4NCj4+IA0KPj4gVGhlIGFuYWx5c2VycyBhcmUgY29tcGxhaW5pbmcgYmVjYXVzZSB3
ZSBoYXZlIHRoaXMgaW4geGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oIGF0IGxpbmUgNjg6DQo+PiAN
Cj4+IGV4dGVybiBjaGFyIF9zdGFydFtdLCBfZW5kW10sIHN0YXJ0W107DQo+PiANCj4+IFRob3Nl
IGFyZSBzeW1ib2xzIGV4cG9ydGVkIGJ5IHRoZSBsaW5rZXIsIGhlbmNlIHdlIHdpbGwgbmVlZCB0
byBoYXZlIGEgcHJvcGVyIGRldmlhdGlvbiBmb3IgdGhpcyBmaW5kaW5nLg0KPj4gDQo+PiBXZSB3
aWxsIHByZXBhcmUgb3VyIGVudHJ5IGluIHRoZSBkYXRhYmFzZToNCj4+IA0KPj4gfHsNCj4+IHwg
ICAgInZlcnNpb24iOiAiMS4wIiwNCj4+IHwgICAgImNvbnRlbnQiOiBbDQo+PiB8ICAgICAgICB7
DQo+PiB8ICAgICAgICBb4oCmXQ0KPj4gfCAgICAgICAgfSwNCj4+IHwgICAgICAgIHsNCj4+IHwg
ICAgICAgICAgICAiaWQiOuKAnVNBRi0xLXNhZmUiLA0KPj4gfCAgICAgICAgICAgICJhbmFseXNl
ciI6IHsNCj4+IHwgICAgICAgICAgICAgICAg4oCcZWNsYWlyIjogIk1DM1IxLlI4LjYiLA0KPj4g
fCAgICAgICAgICAgICAgICAiY292ZXJpdHkiOiAibWlzcmFfY18yMDEyX3J1bGVfOF82X3Zpb2xh
dGlvbiINCj4+IHwgICAgICAgICAgICB9LA0KPj4gfCAgICAgICAgICAgICJuYW1lIjog4oCcUnVs
ZSA4LjY6IGxpbmtlciBkZWZpbmVkIHN5bWJvbHMiLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0Ijog
4oCcSXQgaXMgc2FmZSB0byBkZWNsYXJlIHRoaXMgc3ltYm9sIGJlY2F1c2UgaXQgaXMgZGVmaW5l
ZCBpbiB0aGUgbGlua2VyIHNjcmlwdC4iDQo+PiB8ICAgICAgICB9LA0KPj4gfCAgICAgICAgew0K
Pj4gfCAgICAgICAgICAgICJpZCI64oCdU0FGLTItc2FmZSIsDQo+PiB8ICAgICAgICAgICAgImFu
YWx5c2VyIjoge30sDQo+PiB8ICAgICAgICAgICAgIm5hbWUiOiAiU2VudGluZWwiLA0KPj4gfCAg
ICAgICAgICAgICJ0ZXh0IjogIiINCj4+IHwgICAgICAgIH0NCj4+IHwgICAgXQ0KPj4gfH0NCj4+
IA0KPj4gQW5kIHdlIHdpbGwgdXNlIHRoZSBwcm9wZXIgdGFnIGFib3ZlIHRoZSB2aW9sYXRpb24g
bGluZToNCj4+IA0KPj4gLyogU0FGLTEtc2FmZSBbb3B0aW9uYWwgdGV4dF0gKi8NCj4+IGV4dGVy
biBjaGFyIF9zdGFydFtdLCBfZW5kW10sIHN0YXJ0W107DQo+PiANCj4+IFRoaXMgZW50cnkgd2ls
bCBmaXggYWxzbyB0aGUgdmlvbGF0aW9uIG9uIF9lbmQgYW5kIHN0YXJ0LCBiZWNhdXNlIHRoZXkg
YXJlIG9uIHRoZSBzYW1lIGxpbmUgYW5kIHRoZQ0KPj4gc2FtZSDigJx2aW9sYXRpb24gSUTigJ0u
DQo+PiANCj4+IEFsc28sIHRoZSBzYW1lIHRhZyBjYW4gYmUgdXNlZCBvbiBvdGhlciBzeW1ib2xz
IGZyb20gdGhlIGxpbmtlciB0aGF0IGFyZSBkZWNsYXJlZCBpbiB0aGUgY29kZWJhc2UsDQo+PiBi
ZWNhdXNlIHRoZSBqdXN0aWZpY2F0aW9uIGhvbGRzIGZvciB0aGVtIHRvby4NCg0K

