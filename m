Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0A7F61E5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639766.997452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Azy-0007BX-Cg; Thu, 23 Nov 2023 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639766.997452; Thu, 23 Nov 2023 14:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Azy-000795-9y; Thu, 23 Nov 2023 14:48:10 +0000
Received: by outflank-mailman (input) for mailman id 639766;
 Thu, 23 Nov 2023 14:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ez7b=HE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r6Azw-00077b-MR
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 14:48:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ea487dc-8a0f-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 15:48:05 +0100 (CET)
Received: from AM0PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:208:14::22)
 by PAVPR08MB8920.eurprd08.prod.outlook.com (2603:10a6:102:328::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 14:47:57 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::ed) by AM0PR03CA0009.outlook.office365.com
 (2603:10a6:208:14::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 14:47:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Thu, 23 Nov 2023 14:47:57 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 23 Nov 2023 14:47:56 +0000
Received: from e6cafe2b4390.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1245429-B631-4A2F-A868-380A30A73018.1; 
 Thu, 23 Nov 2023 14:47:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6cafe2b4390.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 14:47:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7434.eurprd08.prod.outlook.com (2603:10a6:102:2a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 14:47:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 14:47:42 +0000
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
X-Inumbo-ID: 4ea487dc-8a0f-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K8f32XnnSauqGwtOheR7PUuPH1A3JtDQnW3PE9ST9YwdTAbVHXHmHgX3RefnpySQbVlWACvUZZyWJ+igklAhVa/zDt9Dj7wiZiDZAWT85mPtRFQnzKvr5f66erYuHk0+9nq9qM6Yc8c6J9ohCk81g/hWk+GNERTloWF2QtMixD+YL+YOt8J6645oZovNK20zVBtAVxW0c/AhZ7PcpG9s8pCwZ6ShoiUyFLaXkG2uyfQxgCmjrbqlL0/6Hngf38eGqGB1IQbwkcJRN3EL63ny0CG47eAxwa/zcBESjRkUK+Ve6UVPSwABPWwfh47Z49UXp5ttD3PYdxA+5c+z2jAhhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ0zgDCn8eQF4rU0QE+NkK9BmnpHegiSC+oKlV5yA5k=;
 b=U9oWVqkCCmXvwdyxPxZk5Ns2yMhA+kMWzi3h1ykM91dE9tM0gt+XMwUKDljCCthM67J4xKUHeeYSgfRX6jNcW3at5o/PzlsT8eZ8EumpIr/3GLU9ZSlALJ6Rr8mP3J0NHWANjW7nwBoqIfR5iVw82XJQ/chLleU3+7mbIWYVF+u7g/9VVnp3ZBueZjL7wphqXDf8yjK7wqePUqnYdt3dnI07CcNjG3H2jWtBXx8/5BAH8ZYw4Kvlf6hyyss/lvNt5+qIO/dnqdvr7EwU2g1fJMlM2MfQOj4OajERFIMDCNN3JdpJHpOkSdwrPcWkUe04MI9V/3uqVyYvXCghsgqoLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ0zgDCn8eQF4rU0QE+NkK9BmnpHegiSC+oKlV5yA5k=;
 b=PLvR+M1RXOTNOhevYYj45Thb9y4FKLP9mQ7JVadygl9LMfXGiOnPfFroAjHBF8HZ99kWFBvCXt29uk3EJ3zlWCBz42mNUAMllb15aTtVK3MWjPQm7xye1y4n2tmTLQ337i6c/ojOWkiKN1+DBeJ3YTITzikbOZ1EoSj4bxk4d2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50d96202c66501ad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlYHXYMLgsmakNON73FA0Dzz/NDSlkaHqv7XvuSb4LY4cGmh+4ckPEPatXanGBhNNsS+squB+tAN/TnsSdKrGPIrNggnCnwSueG50oeR5utInXBelACTuez5n4+9Ng+2BQfg8608sM/OloiXcKEUdzvPiGW0c4us6WJqibUGwURcO/rmH/uPlSfN8FvvsmXEfY1ZVRNocldqyEyk08TS+nrEJS+SoaG3Jw4ZX6rjHmxkenZ9LXgGoDR8aqC5iPle4Gy06tLXfLrwjjg1gOajuGPFYbkXeSa6I1FKIwoA69zSDqKD1/Cq7FkJkWoBBrUIIxKmsNfU6zdBWjemrMNfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ0zgDCn8eQF4rU0QE+NkK9BmnpHegiSC+oKlV5yA5k=;
 b=Sv9hBSym8zWFgGEHMcDaNo0ZnArLQbGpMp+X1B5/thhrrFrWy1n/pRcvO/cE8r1JXk7qxlFwZA3m5DnsXBcHVl3rQWz0zTrgtZKO1Mp3bMD4+9aUdUGs5YUfozPa9ouK6sqB57DdHH+Bb/V2QW4Eai39lUyOfesCi4beSc/Q45qvba4C2rlrw9M76qAyQuVvU3Y1lt0FcJjHufU3S242W6aL/9enEH+iAl6VBv0qMxwPeKuVrk9gJFME8YbsA0poKf9jnDkTXfdW5sk1VdJm8Jaw6h0+mtr69HgTQQ2LZ4RL2mX1c/3il+sKBkdwt/XTUYnG4Ms7reKgmlZY7lopXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ0zgDCn8eQF4rU0QE+NkK9BmnpHegiSC+oKlV5yA5k=;
 b=PLvR+M1RXOTNOhevYYj45Thb9y4FKLP9mQ7JVadygl9LMfXGiOnPfFroAjHBF8HZ99kWFBvCXt29uk3EJ3zlWCBz42mNUAMllb15aTtVK3MWjPQm7xye1y4n2tmTLQ337i6c/ojOWkiKN1+DBeJ3YTITzikbOZ1EoSj4bxk4d2U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index: AQHaHhwDr0vektcMC0qRjv52uM1DKA==
Date: Thu, 23 Nov 2023 14:47:42 +0000
Message-ID: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7434:EE_|AM3PEPF00009B9F:EE_|PAVPR08MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e00fd05-1c26-45c5-0c5a-08dbec332e8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M/LhotgbkkoESwAp1uP6V03DD1F7rXnYjsatFYY9rEcutJMoYfbrJfinL9XFD3nEdO3HI+1WBqJbNh0B7SKEcJKZ2GFHsn8MMJbhxro4MgPrEnsxyyy3iUIQI5Rb1u051j3kbC69k+w8gql+SmU4rIB0TkVt1BCWLxic3ak/PAKLF3EmCvyy9huejM8pJH8T+fOExHkrNYzn20FI7XI/LzMCMZIt2Xv4d2s4ka+qrAhDenZ2i2zsC8hFOSMPdDYbCP5dPX0Q80J8j9onQdr77sqx+UpO6wZ6yUL7mRxXWxwtUkpJgn/hy+5iFgkqS8ZDcY9V6r5EZ3yIvUz7XHWzVl4LTtcx0XUXaAlW+kkAH0G5V8rc6ZxaT8ozMggxswr2ZvRiaKu3fN52p/Jtk7h3c+/wcJPkJ02x/8wqXftNmbcPwxPrGxxUe24mVm8dYlIpx5FFJpTWK8+/G4w+MITD2YyCB3etrsU78DG47zlPaLZlSz7CyLgHGrAJq9Bqebw5Uf6FpNpTjhyVmwMfktMwolj5dOzhcnLl3UCbcrhIbNpem6AMTtuobdh6Kb9Iw7WX6VqinLfLgdkbaetnHtguhSmizQvpOLA384cxE68kjowDyWk6/XUcm9IjW9riB3auVPS/Tg+rlI7bEeAaBASUmmVvOMC2v89tbXd7gETT1Q7HWIAh29mmcGbVNcfooBS8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(66899024)(86362001)(8936002)(2906002)(71200400001)(5660300002)(83380400001)(38070700009)(4326008)(36756003)(26005)(66556008)(66476007)(6916009)(54906003)(316002)(64756008)(66446008)(38100700002)(76116006)(91956017)(33656002)(966005)(6486002)(2616005)(478600001)(8676002)(6512007)(66946007)(6506007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E2CEB9B1F4E65449A21FE1D3B5F8D6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7434
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11ffec39-6cc9-4857-e755-08dbec3325a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8A8GaBcIqPv4i3+Rei87kMHGzDYnlwJUKSdxyqFYTgEyeTMmZTReTcwyFX79aoo4gXqW/T+P4Ki4zW3oN3Mjd44+MguS9taSh6Uk4hMpkVFNdd+VX1itKS3uUhmYpaPI18L4fhXKc6/P0tAAO9xdM+3aIb/z667+qvVzohtRVESb13omUcymoV9YFRiMw/MrVmgiQXGrZIljt81oMF6SWPXmlEY5yL+BmtaTlYOsgN9Ra5c5z64gUG9jTWMUl5UfC3V4zuX8Fz7c7QU7aeYAB1A+QDODEJ82ow6/07iSQjHwPhHW+D+semfKsQPRX37K2MMGgJa8l5nyd8Pg1jSbzsuqXj2x0ykebRRJSf4yIpWJZmpjtZCONBQ9PrCc0Y6EA/C3Mffh8dTeA63WJMvB+M4jVVN5k2ivEpO2FhrgQGVUgxM14jy3ltsZoT798K2FYIxAyUYW+LgOSwVje1jxBo4gObMYFB1V+PQW9/rXiZANs9PUoaiBiQ/Jq/XCmhdDI2bfR26oqZjHIxYZbkllSgrxFSJdtVIUCVoBOHKK9+bKifHNo54r32EG1ov9DdicMH8mv1VDN7AGiIAHTwkDjPhT6gG4jBwGq2jTKIfcozyxhW9av63FLAdFjmioV5UcUp649UfHGtKoz/L9WfhxbaGBEvyLaZP1SM3nPjNjzmfF5bUdP+ptAcHNaRpUXreeIrfP2zAe10e9PLtXWbqqOwv63/FKQm5fNOar0vMpERkZD7ow6gTRiU1hvjrDiTu0PQh+vUpIHodMry9y/ldZWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(41300700001)(8676002)(4326008)(8936002)(54906003)(316002)(70206006)(70586007)(6916009)(478600001)(6506007)(966005)(6486002)(26005)(2616005)(40480700001)(6512007)(336012)(66899024)(83380400001)(40460700003)(47076005)(36860700001)(82740400003)(356005)(81166007)(33656002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 14:47:57.0693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e00fd05-1c26-45c5-0c5a-08dbec332e8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8920

SGkgYWxsLA0KDQpMZXTigJlzIGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIGFib3V0IGNsYW5nLWZv
cm1hdCBjb25maWd1cmF0aW9uLCB0aGlzIGlzIHBhcnQgMiwgcHJldmlvdXMgZGlzY3Vzc2lvbnMg
YXJlOg0KDQogLSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMjMtMTEvbXNnMDA0OTguaHRtbA0KDQpZb3UgY2FuIGZpbmQgdGhlIHNlcmllIGlu
dHJvZHVjaW5nIGNsYW5nLWZvcm1hdCBoZXJlOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L3hlbi1kZXZlbC9jb3Zlci8yMDIzMTAzMTEzMjMwNC4yNTczOTI0LTEtbHVjYS5m
YW5jZWxsdUBhcm0uY29tLw0KYW5kIHRoZXJlIGlzIGFsc28gYSBwYXRjaCBsaW5rZWQgdG8gbXkg
Z2l0bGFiIGFjY291bnQgd2hlcmUgeW91IGNhbiBmaW5kIHRoZSBvdXRwdXQgZm9yIHRoZSBoeXBl
cnZpc29yIGNvZGUuDQoNCkZvciBhIGZ1bGwgbGlzdCBvZiBjb25maWd1cmFibGVzIGFuZCB0byBm
aW5kIHRoZSBwb3NzaWJsZSB2YWx1ZXMgZm9yIHRoZW0sIHBsZWFzZSByZWZlciB0byB0aGlzIHBh
Z2U6DQpodHRwczovL2NsYW5nLmxsdm0ub3JnL2RvY3MvQ2xhbmdGb3JtYXRTdHlsZU9wdGlvbnMu
aHRtbA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpPdXIgY29kaW5nIHN0
eWxlIGRvZXNu4oCZdCBtZW50aW9uIGFueXRoaW5nIGFib3V0IGFsaWdubWVudCwgc2hhbGwgd2Ug
YWRkIGEgbmV3IHNlY3Rpb24/DQpJIGNhbiBzZW5kIHBhdGNoZXMgd2hlbiB3ZSByZWFjaCBhZ3Jl
ZW1lbnQgb24gZWFjaCBvZiB0aGVzZSBydWxlcy4NCg0KDQpRdWFsaWZpZXJBbGlnbm1lbnQ6IEN1
c3RvbQ0KUXVhbGlmaWVyT3JkZXI6IFsnc3RhdGljJywgJ2lubGluZScsICdjb25zdCcsICd2b2xh
dGlsZScsICd0eXBlJ10NCg0KLS0tDQpGb3Ig4oCcUXVhbGlmaWVyQWxpZ25tZW504oCdIEkgY2hv
c2UgQ3VzdG9tIGluIG9yZGVyIHRvIGFwcGx5IGluIOKAnFF1YWxpZmllck9yZGVy4oCdIGFuIG9y
ZGVyIGZvciB0aGUNCnF1YWxpZmllcnMgdGhhdCBtYXRjaCB0aGUgY3VycmVudCBjb2RlYmFzZSwg
d2UgY291bGQgc3BlY2lmeSBhbHNvIOKAnExlYXZl4oCdIGluIG9yZGVyIHRvIGtlZXANCnRoZW0g
YXMgdGhleSBhcmUuDQoNCkRlcGVuZGluZyBvbiBob3cgdGhlIGRpc2N1c3Npb24gZ29lcyBvbiB0
aGlzIG9uZSwgaXQgY291bGQgYmUgYW4gZW50cnkgaW4gb3VyIGNvZGluZyBzdHlsZQ0KDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpBbGlnbkFmdGVyT3BlbkJyYWNrZXQ6IEFs
aWduDQoNCi0tLQ0KVGhpcyBvbmUgaXMgdG8gYWxpZ24gZnVuY3Rpb24gcGFyYW1ldGVycyB0aGF0
IG92ZXJmbG93cyB0aGUgbGluZSBsZW5ndGgsIEkgY2hvc2UgdG8gYWxpZ24gdGhlbQ0KdG8gdGhl
IG9wZW4gYnJhY2tldCB0byBtYXRjaCB0aGUgY3VycmVudCBjb2RlYmFzZSAoaG9wZWZ1bGx5KQ0K
DQplLmcuOg0Kc29tZUxvbmdGdW5jdGlvbihhcmd1bWVudDEsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFyZ3VtZW50Mik7DQoNClRoaXMgb25lIGNhbiBiZSBhIGNhbmRpZGF0ZSBm
b3IgYW4gZW50cnkgaW4gb3VyIGNvZGluZyBzdHlsZQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KDQpBbGlnbkFycmF5T2ZTdHJ1Y3R1cmVzOiBMZWZ0DQoNCi0tLQ0K4oCcV2hl
biB1c2luZyBpbml0aWFsaXphdGlvbiBmb3IgYW4gYXJyYXkgb2Ygc3RydWN0cyBhbGlnbnMgdGhl
IGZpZWxkcyBpbnRvIGNvbHVtbnMuIg0KSXTigJlzIGltcG9ydGFudCB0byBzYXkgdGhhdCBldmVu
IGlmIHdlIHNwZWNpZnkg4oCcTm9uZeKAnSwgaXQgaXMgZ29pbmcgdG8gZm9ybWF0IHRoZSBkYXRh
IHN0cnVjdHVyZSBhbnl3YXksDQpJIGNob29zZSBsZWZ0LCBidXQgY2xlYXJseSBJ4oCZbSBvcGVu
IHRvIHN1Z2dlc3Rpb25zLg0KDQpJIGRvbuKAmXQga25vdyBob3cgdG8gcGhyYXNlIHRoaXMgb25l
IGluIG91ciBjb2Rpbmcgc3R5bGUNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cg0KQWxpZ25Db25zZWN1dGl2ZUFzc2lnbm1lbnRzOiBOb25lDQoNCi0tLQ0KVGhpcyBvbmUgaXMg
ZGlzYWJsZWQgYmVjYXVzZSBvZiBmZWVkYmFja3MgZnJvbSBTdGVmYW5vIGFuZCBBbGVqYW5kcm8g
YWJvdXQgc29tZSB3ZWlyZCBiZWhhdmlvdXIgb24gb3VyDQpjb2RlYmFzZS4NCg0KVGhpcyBvbmUg
Y291bGQgYmUgcGhhc2VkIGFsb25nIHRoaXMgbGluZTog4oCcQ29uc2VjdXRpdmUgYXNzaWdubWVu
dHMgZG9uJ3QgbmVlZCB0byBiZSBhbGlnbmVkLuKAnSwgdGhlIGlzc3VlIGlzDQp0aGF0IGluIHRo
aXMgd2F5IGl0IHNlZW1zIHRoYXQgaXTigJlzIG9wdGlvbmFsLCBidXQgY2xhbmctZm9ybWF0IGlz
IGdvaW5nIHRvIHJlbW92ZSB0aGUgYWxpZ25tZW50IGFueXdheSBmb3INCmFzc2lnbm1lbnQgdGhh
dCBhcmUgY29uc2VjdXRpdmUgYW5kIGFsaWduZWQuDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQoNCkFsaWduQ29uc2VjdXRpdmVCaXRGaWVsZHM6IE5vbmUNCg0KLS0tDQpTYW1l
IHRoaW5nIGFzIEFsaWduQ29uc2VjdXRpdmVBc3NpZ25tZW50cywgYnV0IGZvciBiaXRmaWVsZHMu
DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkFsaWduQ29uc2VjdXRpdmVE
ZWNsYXJhdGlvbnM6IE5vbmUNCg0KLS0tDQpUaGlzIGFsaWducyBkZWNsYXJhdGlvbnMgbmFtZXMs
IHNhbWUgY29uc2lkZXJhdGlvbnMgYXMgQWxpZ25Db25zZWN1dGl2ZUFzc2lnbm1lbnRzLg0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpPayB0aGlzIGlzIGl0IGZvciBub3cs
IGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgYWJvdXQgdGhlbSwgaWRlYWxseSBpZiBJIGRvbuKA
mXQgZ2V0IGFueSByZXBseSBpbiB0d28gd2Vla3MgKDd0aCBvZiBEZWNlbWJlciksDQpJIHdpbGwg
Y29uc2lkZXIgdGhhdCB3ZSBoYXZlIGFuIGFncmVlbWVudCBvbiB0aGVzZSBjb25maWd1cmF0aW9u
Lg0KDQpDaGVlcnMsDQpMdWNh

