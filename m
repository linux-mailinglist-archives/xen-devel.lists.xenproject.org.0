Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B85351B8
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 17:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337662.562324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFqb-0001P5-C8; Thu, 26 May 2022 15:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337662.562324; Thu, 26 May 2022 15:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFqb-0001M3-96; Thu, 26 May 2022 15:56:25 +0000
Received: by outflank-mailman (input) for mailman id 337662;
 Thu, 26 May 2022 15:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0Dc=WC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nuFqZ-0001Lx-F6
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 15:56:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ce3e67-dd0c-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 17:56:21 +0200 (CEST)
Received: from AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) by PAXPR08MB6640.eurprd08.prod.outlook.com
 (2603:10a6:102:dd::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 15:56:18 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::7e) by AS9PR0301CA0050.outlook.office365.com
 (2603:10a6:20b:469::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 15:56:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 15:56:18 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Thu, 26 May 2022 15:56:09 +0000
Received: from 48e420b08127.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DACA84EB-00F0-4BD8-95FE-FF9490316E18.1; 
 Thu, 26 May 2022 15:55:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 48e420b08127.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 15:55:58 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PR2PR08MB4825.eurprd08.prod.outlook.com (2603:10a6:101:27::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Thu, 26 May
 2022 15:55:55 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 15:55:55 +0000
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
X-Inumbo-ID: 62ce3e67-dd0c-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mbk7Axgw41GF60bdsgue8zvv/4O4pHRDFZENMjNAuHxeTsvf6z5xlTVy9wqPqQJ051Zg+QgFUTLizYN/4XffGk3kkVh3CC97h4TS+qmzKWJ6WdKvHXVwgjow0SArEapQwuoA7UC2QtyxMpTkRUwTII1SK47KQFszHH5FB5JyNK3Zwt3lJGq4lpOrk4447Xg3ehMKgd5QE2XSZL/Ekdiq3APjrd7qD6No96dpvGwFfU6FT4ZakMGvG3BZvVtQYsgFAo7dPnX3HDBPM6WPKMDUVLWS66mpeF5P868nbQ+7koMk4FbKj1kWX9vtl6hEHOh+LuE757HkAPxdMFt3rcvJrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka290vH7/1CdVyNLnTdw0mQvae0dOqEEjhyaFbnoAUQ=;
 b=VC1azwtbhkX3GKvEhtoPNlDqVzpywOwlSQnZxLntxjvj2WLpqrg1rtLeeD65GQjOpmbJkDYtLf41mTqXMi6mNnPMtIKM6x4pJaCl2X478Wq4iniOXQBfldpZM8cmShInBL4gCVCbXhGvAcLJGtOhee/HDi0EJCsz4hmH+e1o1r6k6570+Mj3x+KAj4vf7NNyMnxFwQBLnx2Nw/yTrBnpHGsvwY9pfgAW0mLHPXb933SflYr4ekoyQDc8H/ECYiQl/ZiTJu3uPK/yHJwnfQ6/P8f/dAg4qXX9zaliQWbxTczepIYJ4XzSIkd+xXnwK1UOlCBwo4Wp63nt72HimTW+hA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka290vH7/1CdVyNLnTdw0mQvae0dOqEEjhyaFbnoAUQ=;
 b=ujzdyj3iymKqTLYhUkD76BhGKyfYXDQjDXtVR1v7d9JZcubOCttz7w/bjJIcSYjv169aQkRv4pQCD3alJd83PwTgfJyeSq7J+CPBly3sLXY2rBM6HnPAhVFRMPW8c8KsQUFgm3F+Vuj6P7yqpxWv2V7SRWcu0oAhiWmi6/Cx+NE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24b8fd44a1107ba6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjspp9EXZeEMNiMD8wjkhsnMGdTaIJMmRMHIwEaNoq5uj77Eu9x6oIIufeiE/1vgWehqFVyeFkgOKbkuFq0NEdmMDm9K/+iNkdaFG3jWy2dJO7SM6Cnq6DPgiKSDi1hDdKNB738miM5eOFaibXWyNxVfuahd6uuDbr2C/NlDAiZ+gzjQZsB8nT07tAG0Ouu7ntY59+ialZvgLyi8DzUVxu/79mNU6QHbhWybu8oxq4O8ojiDWGPP5iXhVYBlsvK5m0kHWDnDlKuYRlxCL9XTPEytN9f/wiqt6QxVGCtPnUKVpbmOa++EXM7ZMUgSO+KSFhgtzL2dd3P9E/BcThG/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka290vH7/1CdVyNLnTdw0mQvae0dOqEEjhyaFbnoAUQ=;
 b=ZvrTWKLvr0WOLWty3M0UVgzrLWwheyXb2CO3uLusNK0XQDqX5NmNyE/9XFL12Gr0dvru9uKCUNvdO9z82niyt2H89klSBI7RiWBA+orpp22RMx6llZ/kZ1BssgybH69tpA8OBAKgJpoYHkbpTTzvxX1r9U7ArrrQmXCgHzrJSrcUnUqmITLfpyNEUUFqGY7/0zT8pRL8pO0tw9Znp2Zw/h7DGGx2sYrt+V8ciL06jmiuOMowS4jBtUp1FldVuWSEIC1ZFJr1I20wBuIANqTc69KwGcP4Q9MClKJSd5SkzixwAJNi7VkLsXIROCrVcgWLSEjECV6kRNvywnnaPwkafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka290vH7/1CdVyNLnTdw0mQvae0dOqEEjhyaFbnoAUQ=;
 b=ujzdyj3iymKqTLYhUkD76BhGKyfYXDQjDXtVR1v7d9JZcubOCttz7w/bjJIcSYjv169aQkRv4pQCD3alJd83PwTgfJyeSq7J+CPBly3sLXY2rBM6HnPAhVFRMPW8c8KsQUFgm3F+Vuj6P7yqpxWv2V7SRWcu0oAhiWmi6/Cx+NE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
Thread-Topic: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
Thread-Index: AQHYbENHzKAKTdKMX0qFkL1GWjFhOq0xWaOA
Date: Thu, 26 May 2022 15:55:55 +0000
Message-ID: <E7A35551-101E-4C89-84C2-7601F107F052@arm.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-11-julien@xen.org>
In-Reply-To: <20220520120937.28925-11-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 598b13ee-ddc8-433b-ebbf-08da3f304587
x-ms-traffictypediagnostic:
	PR2PR08MB4825:EE_|VE1EUR03FT018:EE_|PAXPR08MB6640:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB66405F25054798C4408C0817E4D99@PAXPR08MB6640.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VNhIwxmW5UI1zp7CxZzWWj7+iZA72YuC1lo1bb2uLviaFLLp+ijTmP3f8wFCgHGjxghGBnwXimW8k+zxrkXVN16Rnul7dcoH2HmjY70m+UJMgLMRvjmHssQXNhfneeBIonrP1KRoY15teSSzhxjKaYh3W7Ct6POGVE62NM/krY+uBlb1VMeTl3F/2xB0xgzWMgSU+Yq/N4vqSSTZAEe8RqSzFnPBtryaleIciuc9980+ciGNVa5MErMW++j8wcbujOOXDL1Db6QZPeEoMrLNzwwYHIk99XRgJ89l+okvxVpynuiG7VeLokvhXKcK1Nb3Ep1W0EunMka1rY2JkKIeC0i7V1WHZLr2qwVtIgsl5EmPKfAstfQIYaoiG6qtWrlNsKoG3ieHCK4Z/gzn2B6ackVXG1DTrOlwp3ubi03nb4+Ap0xyjpVQc02S9IcmJWuRXdcXbmCtx+WVFZt9fVk59GdMUfickLaZtYxGAP2/usOY1BH8r27cehCB0wUIc0CbTxXnV+w0Accgi5gvusGurw9KkcVGsuRAYJqV68OM1Hqzh9kzsbwu2BAyxVOELTjS5MgS9G04dAVIk8XEz8OCBjRkudMX0nZFiSbkxA1eFahpVFV1ivI/RVz6BIsPfb+z2AhCZIIPhDCf5jp8SUm+CTgeqR42RFwiW4ApyPRqA27aYKuTqwihWxvNfR2+oML1l/pwP9RTa06GjCj/NXKkW2MQ0ZtRZ5Ofb40NTxLLeHBi+2zzl68/0vBq6pNSdfZN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6506007)(6486002)(53546011)(8936002)(7416002)(36756003)(5660300002)(33656002)(2906002)(64756008)(54906003)(66946007)(66446008)(76116006)(8676002)(4326008)(91956017)(86362001)(66556008)(38070700005)(508600001)(66476007)(122000001)(71200400001)(83380400001)(38100700002)(6512007)(186003)(26005)(6916009)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <872E6A0A4228014FA5AA7F70A2283B9A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6992807f-0e8d-4bec-8662-08da3f3037f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jo62tqBbiZ6NzXBgZSJdy9luJ5Zr7xLxLBF6Hqte2SfHJaJU1PP9S1sf2+ptfoBICmpm2sdUiP1PzfRZ7IUgTImxOtUKTeatdQvHqVH2bXy2uIJXP/cCtKVgIvPYHK/5aIPK3Mc+RnO8yfVVPYUESsofAiR6bAuZMCN+vWMnBIgvGXKR4iq5pz3EmyfZWo9rIt3BvqZEIcpf7gewyE4a66/4NyZBhYnkAt86kgb+OjnnSnAHq03VlSu4ltWwcUC/8TSAknh9BbS33RCGpax2fT13vPljW4EDnJkN47Ivtw2x+z1J1M4AnLZOgqfUyy8qYfyvFaAqSZ6JvpaKpj90nSy3uo2zsEXDRWV8/cNZWUoXTLjJfK2ELEAAVDqRmgUQFRVziEGQtwTEQB8frkfxuikDsmAcR8f9wq3wIYuuhttF3/BLgE1hcAkJQ1RlxQdnskLABFnRMOiC3g7gkLR2kf+KHl0RE5IlXLa2WGnX5yV2M3kKXHUUGHtP87O10gAfF5d+8KeMAPEnTc9qPSlLupHLk7YZj8InL44RqtUN5KSQUoc3DVT12UwFW+r+sRmo2/QDl1nedrGBWU8D7e300bDNrP4VcgWNkV9WMvPI19/wAjrLYjjQYSvn576CVDDrZnZ0TkSS5BprBKTELxCuRD6n+ca/ZaYRkLJGrg8j2hZw/XMLqEukOP1yewh6FEOv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(6486002)(40460700003)(81166007)(2906002)(86362001)(316002)(6506007)(8936002)(70586007)(70206006)(4326008)(8676002)(6862004)(53546011)(26005)(6512007)(508600001)(47076005)(107886003)(5660300002)(336012)(356005)(33656002)(54906003)(36860700001)(2616005)(83380400001)(186003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 15:56:18.2456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598b13ee-ddc8-433b-ebbf-08da3f304587
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6640

DQoNCj4gT24gMjAgTWF5IDIwMjIsIGF0IDEzOjA5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+
IA0KPiBUaGUgYmFzaWMgaWRlYSBpcyBsaWtlIFBlcnNpc3RlbnQgS2VybmVsIE1hcCAoUEtNQVAp
IGluIExpbnV4LiBXZQ0KPiBwcmUtcG9wdWxhdGUgYWxsIHRoZSByZWxldmFudCBwYWdlIHRhYmxl
cyBiZWZvcmUgdGhlIHN5c3RlbSBpcyBmdWxseQ0KPiBzZXQgdXAuDQo+IA0KPiBXZSB3aWxsIG5l
ZWQgaXQgb24gQXJtIGluIG9yZGVyIHRvIHJld29yayB0aGUgYXJtNjQgdmVyc2lvbiBvZg0KPiB4
ZW5oZWFwX3NldHVwX21hcHBpbmdzKCkgYXMgd2UgbWF5IG5lZWQgdG8gdXNlIHBhZ2VzIGFsbG9j
YXRlZCBmcm9tDQo+IHRoZSBib290IGFsbG9jYXRvciBiZWZvcmUgdGhleSBhcmUgZWZmZWN0aXZl
bHkgbWFwcGVkLg0KPiANCj4gVGhpcyBpbmZyYXN0cnVjdHVyZSBpcyBub3QgbG9jay1wcm90ZWN0
ZWQgdGhlcmVmb3JlIGNhbiBvbmx5IGJlIHVzZWQNCj4gYmVmb3JlIHNtcGJvb3QuIEFmdGVyIHNt
cGJvb3QsIG1hcF9kb21haW5fcGFnZSgpIGhhcyB0byBiZSB1c2VkLg0KPiANCj4gVGhpcyBpcyBi
YXNlZCBvbiB0aGUgeDg2IHZlcnNpb24gWzFdIHRoYXQgd2FzIG9yaWdpbmFsbHkgaW1wbGVtZW50
ZWQNCj4gYnkgV2VpIExpdS4NCj4gDQo+IFRoZSBQTUFQIGluZnJhc3RydWN0dXJlIGlzIGltcGxl
bWVudGVkIGluIGNvbW1vbiBjb2RlIHdpdGggc29tZQ0KPiBhcmNoIGhlbHBlcnMgdG8gc2V0L2Ns
ZWFyIHRoZSBwYWdlLXRhYmxlIGVudHJpZXMgYW5kIGNvbnZlcnRpb24NCj4gYmV0d2VlbiBhIGZp
eG1hcCBzbG90IHRvIGEgdmlydHVhbCBhZGRyZXNzLi4uDQo+IA0KPiBBcyBtZm5fdG9feGVuX2Vu
dHJ5KCkgbm93IG5lZWRzIHRvIGJlIGV4cG9ydGVkLCB0YWtlIHRoZSBvcHBvcnR1bml0eQ0KPiB0
byBzd2ljaCB0aGUgcGFyYW1ldGVyIGF0dHIgZnJvbSB1bnNpZ25lZCB0byB1bnNpZ25lZCBpbnQu
DQo+IA0KPiBbMV0gPGU5MmRhNGFkNjAxNWI2MDg5NzM3ZmNjY2JhM2VjMWQ2NDI0NjQ5YTUuMTU4
ODI3ODMxNy5naXQuaG9uZ3l4aWFAYW1hem9uLmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlh
IDxob25neXhpYUBhbWF6b24uY29tPg0KPiBbanVsaWVuOiBBZGFwdGVkIGZvciBBcm1dDQo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoNCkhpIEp1bGll
biwNCg0Kd2l0aCBBU1NFUlQoIWluX2lycSgpKSBpbiBwbWFwX3VubWFwKGNvbnN0IHZvaWQgKnAp
IGFzIHlvdSBwcmV2aW91c2x5IHNheS4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIGFsc28gdGVzdGVkIHBhdGNoZXMgdXAgdG8g
dGhpcyBvbmUsIHN0YXJ0L2Rlc3Ryb3lpbmcvY29ubmVjdGluZy10byBmZXcgZ3Vlc3RzDQphbmQg
bm8gcHJvYmxlbS4NCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFy
bS5jb20+DQoNCg0KDQo=

