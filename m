Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255C583B7A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 11:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376725.609689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH05T-0005aS-Kb; Thu, 28 Jul 2022 09:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376725.609689; Thu, 28 Jul 2022 09:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH05T-0005YG-Go; Thu, 28 Jul 2022 09:45:47 +0000
Received: by outflank-mailman (input) for mailman id 376725;
 Thu, 28 Jul 2022 09:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+ip=YB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oH05R-0005YA-QX
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 09:45:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cafe7bb-0e5a-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 11:45:44 +0200 (CEST)
Received: from AS9PR06CA0731.eurprd06.prod.outlook.com (2603:10a6:20b:487::22)
 by DB9PR08MB7193.eurprd08.prod.outlook.com (2603:10a6:10:2cc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 09:45:42 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::5) by AS9PR06CA0731.outlook.office365.com
 (2603:10a6:20b:487::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 09:45:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 09:45:41 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 28 Jul 2022 09:45:41 +0000
Received: from 7fbeba7b5338.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47FE19CF-B222-46E5-B3A0-DB6483479CB0.1; 
 Thu, 28 Jul 2022 09:45:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7fbeba7b5338.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 09:45:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4759.eurprd08.prod.outlook.com (2603:10a6:10:f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 09:45:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5482.010; Thu, 28 Jul 2022
 09:45:31 +0000
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
X-Inumbo-ID: 0cafe7bb-0e5a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i5HLOiu9HDFDlqEEtz8jx1uHvgeYA6fxgVajrQ3yx4MpG9CoSOx9G6PhI57jOgAelDsnXlncSZPNBmacDsfqNmvdrbMpKZJy/VIxo0WqfYf6q53HMNJm9GUsz9DHm9fRt8OdRAfz5KyPen3Ln2FzwBNKdsJJJ54VT37boK73eAo5MITcTKQt09Mko0T4Xy+sf2WBoCuI1gHltG0DM09hT6BddwjRh1hop2B3cwJOaYJMzDhg5y+WffVSNz3dzCWyAwXkpjwsgFrGnK6sUXbOT0/hlTKlPtzLZj30bQtMU9fkz0t7jvtb7Ljdnwevm8nWSC7cKRZ8eCMT7VhFBS1aMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZIynvujiCOEswQ21LIeQ0Ct0RPettGAUKixNuXN3nA=;
 b=GuRptSGCkYOsWIL6H7pL60h84fok5GfqVGMdgsip+uMegPyMxge9jETPhA0gG8jIUEgvvYP4MaCWSPd0N9KEuS7lYJZ/kWHKEiUX3M91aaI8G9+qJV0PKUXtKjHM3bOEYAW+x0tRuF6yn7izdgV0vBYYvaj7aBeXUiJ22RpRaYmlVbG+QwCSlRoVx7WW5r4EouoRRR0hc9GMus6xsX/rN4YmMMOR30iqIVfQ2w2hCX/rXymI6gcOkH3phTLwIXUCeapuZWJhwIdqxs+8+NpHPBLIbFxnr+EVDush2Zn0JkUw/bLSyM7wTWiaf+pz13NnqAZ7f8smAH536ZFAZIuhpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZIynvujiCOEswQ21LIeQ0Ct0RPettGAUKixNuXN3nA=;
 b=saU+e4GSmffhF2s7ULFPnxIqVQlTwJ7fZTpFmyL5frXFgEZIJDbHYyic1z0a78oMBJq7qi7A+GcGrTptwBHX+1aXPd3EibjugAj3JIWgCFvgxYDpgTOdV/K0tP13j1Q10+T1hWG5PfO/uBRJo+Q5nsJ8/wAdV0saRewbYZ5Jm+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79526fe0e1348e3c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX6wau96tdcTLFGeqQQ269osijeOUaiHkzECFqXeU54ai+/hZtbhyUwJ4E4P0xmK3fe94PzskBMhkq0GVjMdFHJYzO8R31vtcaWCA4dNrdsDujarciTa2jepuLxGUkkDFXJW2UvQ8V9/2/Ur9QJuFrC4rkAVQE4vwBnXOs5yFTkJnqM14zNO866bRUNAaG7gIhivJ+v4ZYhNQlah7E7C03gBp28mrDmoMivzhsQr7oZj9rffs8KC5y2cLXBukjJsma5zA7Oi9NZqaXP5lkhUa4tf4LT6sKiGQEUxn0vRFvb6iFSqXEcVDr4MeofZaVRv7C6fDYMRZwPDOIcOmGCCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZIynvujiCOEswQ21LIeQ0Ct0RPettGAUKixNuXN3nA=;
 b=SIllx8t0huBWWdFIqNnwt2b2BjNrce8rGyT3u/OWKFkoz1gu8s+6teAvyMOjW62GPxekEtZ/awxQVp6Uosdlw9NpDKZQMmMNDaSSCtiGh8GO7j2gAEOQAMeEGrd3/tAVyHMk+bDvgEaXdwedD8BNoBz/+hZbu+qhhrtbx2SV/92/34nkUt9azIHYTcAV07h2nzzOUwYqgSBCGO6buDBQbmRApNy9s0n06TMvKIMjhIvSM+Rdj8oe9TQVzfYAzuJuSZWaMviSntrOZXAkvxsOpjQhi9tBHpVZ9mPWUFBsepNbomJwVt81bnbjlQHkx9jeD5OJM5g3/OIQGIlJKPFx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZIynvujiCOEswQ21LIeQ0Ct0RPettGAUKixNuXN3nA=;
 b=saU+e4GSmffhF2s7ULFPnxIqVQlTwJ7fZTpFmyL5frXFgEZIJDbHYyic1z0a78oMBJq7qi7A+GcGrTptwBHX+1aXPd3EibjugAj3JIWgCFvgxYDpgTOdV/K0tP13j1Q10+T1hWG5PfO/uBRJo+Q5nsJ8/wAdV0saRewbYZ5Jm+M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Topic: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Index: AQHYoc45O9kZLijXrUyjjlrBuGCX1a2SXJWAgAEPNoCAABtvgIAAArUA
Date: Thu, 28 Jul 2022 09:45:31 +0000
Message-ID: <27786AF4-37EA-4C54-9330-1C9B674BAC87@arm.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
 <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
 <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com>
 <49ed6d31-76fd-c962-5320-c88726b45987@xen.org>
In-Reply-To: <49ed6d31-76fd-c962-5320-c88726b45987@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2c253321-e156-4cd6-e750-08da707def8f
x-ms-traffictypediagnostic:
	DBBPR08MB4759:EE_|AM5EUR03FT046:EE_|DB9PR08MB7193:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9wP4+2d1EZTVEjam4HerGotlY6R+PgYVsAOetDQRddwTq1ZWt7oRBk8xDC9PtHNuznME/59iP4twGzXNPcqLGzawFVKVSPbikk2mZkAhtf6Ph1fE4timqfhEBTxAoSgZDM2d4/u43+iD593eiACzjoz4Eo9Owcu9gRZGDjeEwhiXhk2VWRYvss2e80S3V8Qh5vXtV8v45aeUbDVEAxT3hPEvKQbXYo/51/8Yf5xIgGWQZwN4EQ8pxhvF8tam0LvD8inaurum2Ttf2/7fbwBsTljSQ/ujVs+heGIlW3EbwRnpzC+mAhjTjurJ/Mps4/Pg4+NscZoDY4sueno+WQznwWC7sDwAiMTiiAySPRS8yidpi6bgTO7Kjzm9cotUvUaaf4n0zZPVpujiiXpbfSevtgU1m0HlE43oAsXLpuqP2mwPEBldP5E4TDpCyB04RK3Vgen8QFYjYHuRAjHeze6ULFXBlv5QvtkscaKla6unoqjsFyXGaoeez4Yuo0xjMhJn5rzTaOJzVpscRJ1yvQ11N9QkMU0Y4W1x38eKvP2dev5ozMuyLDr5vaxGBQ+ksA6tkSj3tWJBPY3nrgMmKc/gYXxsgG3iUCaC6znS8szQdAnG8HFX6z0RDTZpNEJPeTKPSKNikY25BoBySbPbFpZQPV+BkxQEMOaNVYfujR/LpiWKj//N1ON+4/llLmTIYUUbl9L5QhjMp5bGQOoKKy+T9LPMeka5m5rDbY1Y5wrzV/FuQ4dnUAAgasMI6b0+wZK1N5goF0GNy430nvQD2wvvkvMUxO204xXFlXxXn0So3j9z95DAjeMFw12DhfOFqO7QESGj7De7oJ0aPR9LKgDA/Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(38070700005)(54906003)(6486002)(186003)(36756003)(6916009)(2616005)(33656002)(2906002)(5660300002)(316002)(8936002)(122000001)(38100700002)(76116006)(6506007)(64756008)(91956017)(8676002)(66556008)(66446008)(41300700001)(83380400001)(4326008)(66476007)(6512007)(53546011)(66946007)(86362001)(478600001)(71200400001)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DC22141D3662341AF61E4A0084E6A4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4759
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af6fd4d9-f38a-4efe-ca16-08da707de96f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wY4z/QMw7BWGkxBk2zM39i1R/heqwcqIxdbgFaacCl2pOtMFcluHTADzRXrzHydutVkb8GHk5zA+pXNtNAFo4eFVUaN/eONrxlx9Wt2318pN26KmaPIw1X5ni9NTiE8L0S93GNvRoibA4U8aWhLOrrT5T1HmiuI+YOU8/ECSJmsqtV0R1pF4VXuye4Kxk7U7Pj9j63jawEj7jB0uYclR0eRZ6yROFUxnVeJNnjxYOj9H8PjKPgX+gjLWbTIJVL+NUmn+fikX4/NDKTk+L+WHsMAfNpJcPCWc14iSFFFaGQV7aTAa9nZPpMESTv2cXzWGlrFivTS9iYoly8g2v9QiSRzsbO2d/62V8OJJQUUn0cy4a7THbDEwTHtSEwWG4wnhJ/N4wNe9itA0Lo6swJCjsUT1lYj8sLcwjPEj6nmAoUFCTtJtTP8gDDX7qQhNEsdgzMz1T4xTiGCBtbyvt0UMMD+RadhIadbUbJg/9akA3t9Z016wVDECnEp3IAtvKwncZIzBX5dwBjsEhRgf5+slQA9UULj+Dg8ML2D697qnYXy4El0wZLOMxDjPButBrLvQBewWfCsUBLI59HQG+NLAgx7k3X3aaktgyUe8fDA499LEaPWIFG+GTBQDpNkhwuw5wbYO6OmiPKDOSIU989G8JM/97bBb1USCzKC3QV++664oMGg/rwjifsi7OgnHbR/BIZXeDiZk+cHV9+oGapzC0+Z44vGCMJmSkZAR3TAsAkFd0xfjpg1LRcAXqbSNEx16Ks+ItY9vlnYPCIFmjsC5fjZKG/TlfPDduiuqSejp94DgRLk49hD1olfE5vsx3B7O
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(36840700001)(46966006)(8936002)(6862004)(70206006)(81166007)(316002)(40480700001)(26005)(6512007)(82740400003)(6486002)(4326008)(86362001)(70586007)(33656002)(36860700001)(36756003)(41300700001)(53546011)(478600001)(82310400005)(47076005)(8676002)(186003)(40460700003)(2616005)(5660300002)(54906003)(2906002)(6506007)(356005)(83380400001)(336012)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 09:45:41.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c253321-e156-4cd6-e750-08da707def8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7193

Hi Julien,

> On 28 Jul 2022, at 10:35, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/07/2022 08:57, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 27 Jul 2022, at 16:46, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Xenia,
>>>=20
>>> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
>>>> Remove unused macro atomic_xchg().
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> ---
>>>> xen/arch/arm/include/asm/atomic.h | 2 --
>>>> 1 file changed, 2 deletions(-)
>>>> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/=
asm/atomic.h
>>>> index f5ef744b4b..a2dc125291 100644
>>>> --- a/xen/arch/arm/include/asm/atomic.h
>>>> +++ b/xen/arch/arm/include/asm/atomic.h
>>>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, i=
nt a, int u)
>>>> return __atomic_add_unless(v, a, u);
>>>> }
>>>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
>>>> -
>>>=20
>>> While I agree this is unused today, the wrapper is quite trivial and pa=
rt of the generic API (x86 also provides one). So I am not in favor of remo=
ving it just to please MISRA.
>>>=20
>>> That said, if Bertrand and Stefano agrees with removing it then you sho=
uld also remove the x86 version to avoid inconsistency.
>> I think we can keep this and maybe add a comment on top to document a kn=
own violation:
>> /* TODO: MISRA_VIOLATION 2.5 */
>=20
> While I am fine with this goal of the comment (i.e. indicating where Xen =
is not MISRA compliant), I think this is one place where I would rather not=
 want one because it can get stale if someones decide to use the function.

I think the one doing that will have to update the comment otherwise we wil=
l never manage to have an analysis without findings.
Having those kind of comments in the code for violation also means that the=
y must be updated if the violation is solved.

Maybe we will need a run ignoring those to identify possible violations whi=
ch are not violations anymore but this might be hard to do.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


