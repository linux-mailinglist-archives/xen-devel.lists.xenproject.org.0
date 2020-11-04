Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144502A662B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19183.44398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJZ2-0002d6-3k; Wed, 04 Nov 2020 14:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19183.44398; Wed, 04 Nov 2020 14:15:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJZ1-0002ch-VZ; Wed, 04 Nov 2020 14:15:03 +0000
Received: by outflank-mailman (input) for mailman id 19183;
 Wed, 04 Nov 2020 14:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJZ0-0002cc-Rb
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:15:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0c38656-0b08-496a-b1da-6342c2796308;
 Wed, 04 Nov 2020 14:15:01 +0000 (UTC)
Received: from AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) by VI1PR08MB4126.eurprd08.prod.outlook.com
 (2603:10a6:803:e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:14:55 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::5e) by AM5PR1001CA0069.outlook.office365.com
 (2603:10a6:206:15::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 4 Nov 2020 14:14:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:14:54 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Wed, 04 Nov 2020 14:14:54 +0000
Received: from 939a678c45f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C884C586-DD1E-4CBE-B99B-E35FFC8DA436.1; 
 Wed, 04 Nov 2020 14:14:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 939a678c45f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:14:17 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM4PR08MB2834.eurprd08.prod.outlook.com (2603:10a6:205:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 14:14:16 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:14:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJZ0-0002cc-Rb
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:15:02 +0000
X-Inumbo-ID: c0c38656-0b08-496a-b1da-6342c2796308
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.54])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c0c38656-0b08-496a-b1da-6342c2796308;
	Wed, 04 Nov 2020 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tm842fv+F/ERXencghPdS1VUajJx9qC4xm0l8+txgM=;
 b=0xWTJ74kRio2qb12QL2xzttz+FxuX1sYsijEAuJTeQKXvbkfPZYL6C2Nd8P+8gl/y1Czc3Dp1NYvfF4UtkcGRe2bskweZ7h/4RyQX2iy6WCoSc9KAcQ/ARLJ8+g3PYFhVDD3e5w2hnglK/vHJSEs2OMH7C158BBmiRZm0JnOzag=
Received: from AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) by VI1PR08MB4126.eurprd08.prod.outlook.com
 (2603:10a6:803:e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:14:55 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::5e) by AM5PR1001CA0069.outlook.office365.com
 (2603:10a6:206:15::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 4 Nov 2020 14:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:14:54 +0000
Received: ("Tessian outbound c189680f801b:v64"); Wed, 04 Nov 2020 14:14:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d1678f427a3a7cc
X-CR-MTA-TID: 64aa7808
Received: from 939a678c45f5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C884C586-DD1E-4CBE-B99B-E35FFC8DA436.1;
	Wed, 04 Nov 2020 14:14:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 939a678c45f5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7SjtB9SSVkBLElusdN0AfzdR04C1P8doHKY68Y+qeSPFkTW6FRKKwEbekNbOLHYWOXxbFgcn3U2zTnyvBAYvigqdQCpkEBB/rjcvsW3v4AWrU69JJoAtUxUcpi2kUppKqEbdw6l0ZYm0fJFi22X+OuQTuAwuig81dY6RIq0iq1NVKYO/EW4uY8IX4PHjF+xkX7CzfhErTa1eVZUxF8ovhARUQ6gk3exnYKs9+pxFfoMVt3fK1zOoqToQjPMK67FUgqeAFJwngKrCWRqujiXWxgL5GDRfH49CqcJ5VUjaT9kYU5GQWd50mlwBsXvjXkvzjiTxYWqMy4Oky1T5nsNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tm842fv+F/ERXencghPdS1VUajJx9qC4xm0l8+txgM=;
 b=oakzshia1Y32jcUklQMhaKAaBP6pKhqvA3QdJ0ogd2OGT6ohBwIn0VAaAwY9u/DCrz5Ra1NrPJ0vsgvbYL4GDeept74VytmqzViyLB5nU9UbaAW1iAf1tkCKeIpxuxSHnf9A09g8Cqzx/JyzJYaQDSSTCJGH9WgC8ugAiwLV/VkqWLotnx7dkbqI4YTt+hhBYH2tIySspOdSWI8lyzRI63fM2AoYsa0tUpdOptFSv2x15m0VFQ5BB2qfqvJeUaQVKaNK7oTdryhN5gfSnE+szIU1/eEOu9MZ1D9LRkIAX86Kg6OY2kx/zW2/Pz5VQeBQ68ezpOnf7S0g7biNepUWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tm842fv+F/ERXencghPdS1VUajJx9qC4xm0l8+txgM=;
 b=0xWTJ74kRio2qb12QL2xzttz+FxuX1sYsijEAuJTeQKXvbkfPZYL6C2Nd8P+8gl/y1Czc3Dp1NYvfF4UtkcGRe2bskweZ7h/4RyQX2iy6WCoSc9KAcQ/ARLJ8+g3PYFhVDD3e5w2hnglK/vHJSEs2OMH7C158BBmiRZm0JnOzag=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM4PR08MB2834.eurprd08.prod.outlook.com (2603:10a6:205:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 14:14:16 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:14:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
Thread-Topic: [RFC PATCH] xen: EXPERT clean-up
Thread-Index:
 AQHWrxxOadLsV5e3vEiMzomhqHWckam0fmYAgADlPwCAALC9AIAAvt0AgADIX4CAAG+2gA==
Date: Wed, 4 Nov 2020 14:14:15 +0000
Message-ID: <FD3CD0C4-6055-443B-B7D9-EAAC4935D2A9@arm.com>
References: <20201031002405.4545-1-sstabellini@kernel.org>
 <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
 <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s>
 <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com>
 <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
 <e0842284-a894-1e0b-ffbe-484013acefa5@suse.com>
In-Reply-To: <e0842284-a894-1e0b-ffbe-484013acefa5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa4a5620-643a-4eec-437c-08d880cc00ca
x-ms-traffictypediagnostic: AM4PR08MB2834:|VI1PR08MB4126:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4126091137E862F86257CF4F9DEF0@VI1PR08MB4126.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 laDdxYNjtgCVd09a2NFEjC8z73fE3frF60tu9E38Jhw+WKMMqT77DOHiyrq1jFtrgfmVG3tUavia9wsE7o0u68jtOUQjwH8P0M3zV4OUncT6fOWwiMt/HOtvVNqJIZNFtaom0vvbha0bN0SfKhyW8nhZO6bbJE6dY2TXjv70E1iGxuq+I21FRS6JDJGs83kXl/GQX1QxRevWJlut9AD1JhPDaz4eRvmvF0YCr6xYhPDELrdDehzpYxaaFtjkGJFmjajOISG84Ohm7bgHthHIb3vmb4ED/4R93Zvq+3OfvneivT7ZZiwhp4CP0u5BFon/WWlRWGO2AF7QgdhUZxg61w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(4326008)(71200400001)(54906003)(6916009)(66446008)(53546011)(91956017)(33656002)(8676002)(76116006)(8936002)(83380400001)(66946007)(6512007)(66476007)(64756008)(66556008)(186003)(26005)(478600001)(86362001)(2906002)(316002)(36756003)(6506007)(2616005)(6486002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 +60AkLkIiQDELH28fpn5XHMsbYE19WN6gpu7ssqfQyNsO1lO5zxSGIcnP1yXjC+QCrek7ZKqyzsk9b5pbEnC2sG2tqpuGu4oRTdUlIY2sIG5bJaFsA+29re9jXp+cz2nq0OXNjeQxR4CgPot2uDlBDqHdE3LXD1xfVOAcCnE1wN1D+U5Gi0NoJICGtcoWJKQMRQSsuPw8ZGYvN//qIOCnH7QdwWymJTY2ALJPSYS3f4IU+tTISuOz54iqTjoyLIENlWLdnpfp9FdSh2Y7AzULy0XJkeebq3Yv5BN0U/WNrNontse0wCQMsUNXg6BJdo2Fc9RJ3vrM7YO0vvWnIL6rZNrdfjs6QG1qy9dkr2mheuCuCKEGaYbXOyuahEnK9yTSmgAQLTlpmwuOVqjydyzFCxQvo3CACit+AW9cR+FSLav7w4Cg1nqSAktUUMoe9F0LqyasXMdvjsLA0O+KS+I5NwBsr+p9w1zlwmBcVbvTze1+1YppANY4p/HCmbJma/BeYQHfc3UAj3/iw5jXwV29U4XSITciYAwIFxcW2gKrGbtsoi8t6I9o7GOuOcm/1OTA8ZOxMgNYnmyvIOFmSEKUPTJZtld6DA6q992CklkMY8WhbTLoepqrugCa2/psGh9NdsQNtf/VqO9oo1HfdF+Zw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <915E064EF1964B4D85DECD1B09782DE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2834
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c38e9ac9-72ba-4cc9-d836-08d880cbe9ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	02IwD7bYyTuBvAl9JUjlLkfpLSlQk91EvhhipGtMZdCf8KseT68yVN4wjgDlVI7Ukv0d3qOj3JUlDVXie/OlaDBPNDgf+MwrwfhdZ9/VdP1Tcn/fIM+0rIAsyHCX1BorXKP8DBVcF15wBaPkq7Mxv36sf9ki74HRrmD6E5iqnBXt41u1cWJZ3tH3KD5LKibuOgQuUXglo5hnHC0Y37yveRXke/X6CSg3uSABz73nyC+6hfrRV8kGsvvrPQH+UAEt/F1XHkaV2fZKoILy+JayZ5roVzaTP9ix4dVf9TEe5AclEQTdhypzWx03hGsCLeKRyhcLKBZuNFLN5nzTqMBpfB0qfB2AlfYihzw7YCmAktRx172u8n8BZW96xV7zqCf1yc/c94eNeII5EdmMz2Cppg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(86362001)(70586007)(6512007)(83380400001)(8676002)(53546011)(36756003)(6506007)(2906002)(70206006)(2616005)(82740400003)(336012)(356005)(33656002)(8936002)(4326008)(6486002)(54906003)(5660300002)(47076004)(26005)(316002)(36906005)(186003)(81166007)(6862004)(82310400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:14:54.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4a5620-643a-4eec-437c-08d880cc00ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4126

Hi Jan,

> On 4 Nov 2020, at 07:34, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2020 20:37, Stefano Stabellini wrote:
>> On Tue, 3 Nov 2020, Jan Beulich wrote:
>>> On 02.11.2020 22:41, Stefano Stabellini wrote:
>>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
>>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>>>> 	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>>=20
>>>>>> config ARM_SSBD
>>>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>>>>> -	depends on HAS_ALTERNATIVE
>>>>>> +	bool "Speculative Store Bypass Disable"
>>>>>> +	depends on HAS_ALTERNATIVE && EXPERT
>>>>>> 	default y
>>>>>=20
>>>>> At the example of this, I'm afraid when the default isn't "n"
>>>>> (or there's no default directive at all, as ought to be
>>>>> equivalent to and preferred over "default n"), such a
>>>>> transformation is not functionally identical: Before your
>>>>> change, with !EXPERT this option defaults to y. After your
>>>>> change this option is unavailable (which resolves to it being
>>>>> off for all consuming purposes).
>>>>>=20
>>>>> IOW there are reasons to have "if ..." attached to the prompts
>>>>> (for this construct indeed only making the prompt conditional,
>>>>> not the entire option), but there are also cases where the
>>>>> cleanup you do is indeed desirable / helpful.
>>>>=20
>>>> Yeah, thanks for catching it, it is obviously a problem.
>>>>=20
>>>> My intention was just to "tag" somehow the options to EXPERT so that i=
t
>>>> would show on the menu. Maybe a better, simpler, way to do it is
>>>> to add the word "EXPERT" to the one line prompt:
>>>>=20
>>>> config ARM_SSBD
>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>>> +	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>>>> 	depends on HAS_ALTERNATIVE
>>>> 	default y
>>>> 	help
>>>>=20
>>>>=20
>>>> What do you think?
>>>=20
>>> While on the surface this may look like an improvement, I don't
>>> see how it would actually help: If you read the Kconfig file
>>> itself, the dependency is seen anyway. And on the menu I don't
>>> see the point of telling someone who has enabled EXPERT that a
>>> certain option is (or is not) an expert one. If they think
>>> they're experts, so should they be treated. (It was, after all,
>>> a deliberate decision to make enabling expert mode easier, and
>>> hence easier to use for what one might consider not-really-
>>> experts. I realize saying so may be considered tendentious; I
>>> mean it in a purely technical sense, and I'd like to apologize
>>> in advance to anyone not sharing this as a possible perspective
>>> to take.)
>>>=20
>>> Plus, of course, the addition of such (EXPERT) markers to
>>> future options' prompts is liable to get forgotten now and then,
>>> so sooner or later we'd likely end up with an inconsistent
>>> mixture anyway.
>>=20
>> I tend to agree with you on everything you wrote. The fundamental issue
>> is that we are (mis)using EXPERT to tag features that are experimental,
>> as defined by SUPPORT.md.
>>=20
>> It is important to be able to distinguish clearly at the kconfig level
>> options that are (security) supported from options that are
>> unsupported/experimental. Today the only way to do it is with EXPERT
>> which is not great because:
>>=20
>> - it doesn't convey the idea that it is for unsupported/experimental
>>  features
>> - if you want to enable one unsupported feature, it is not clear what
>>  you have to do
>>=20
>> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
>> the Kconfig menu?
>=20
> If you mean this to be added to prompt texts, then yes, I'd view
> this as helpful. However, ...

+1

>=20
>> It would make it clearer that by enabling UNSUPPORTED you are going to
>> get a configuration that is not security supported. And ideally we would
>> also tag features like ACPI as UNSUPPORTED as I suggested above.
>=20
> ... things will get uglier when (just a simple example) something
> is supported on x86, but not on Arm.

This is true that this could happen but we could easily workaround this
by having arch specific entries selecting the generic one:

CONFIG_PCI
	bool
	default n

CONFIG_X86_PCI
	bool if x86
	select CONFIG_PCI

CONFIG_ARM_PCI
	bool if arm
	depends on UNSUPPORTED
	select CONFIG_PCI

This is not the full syntax or right variables but you get the idea :-)

This is making Kconfig more complex but improves the user configuration exp=
erience
so i think this is a win.

Cheers
Bertrand


