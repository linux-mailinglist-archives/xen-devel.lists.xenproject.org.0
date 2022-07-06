Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A65567FDA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361842.591589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUf-0005QZ-7J; Wed, 06 Jul 2022 07:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361842.591589; Wed, 06 Jul 2022 07:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUf-0005MS-35; Wed, 06 Jul 2022 07:30:41 +0000
Received: by outflank-mailman (input) for mailman id 361842;
 Wed, 06 Jul 2022 07:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUd-0003d3-01
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e97f7c-fcfd-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:30:38 +0200 (CEST)
Received: from DU2PR04CA0250.eurprd04.prod.outlook.com (2603:10a6:10:28e::15)
 by PR2PR08MB4842.eurprd08.prod.outlook.com (2603:10a6:101:22::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:30:34 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::4d) by DU2PR04CA0250.outlook.office365.com
 (2603:10a6:10:28e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:34 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Wed, 06 Jul 2022 07:30:33 +0000
Received: from 79309e511a9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7F04F9B-AC97-44B1-8FCE-6716EEDB236D.1; 
 Wed, 06 Jul 2022 07:30:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79309e511a9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:23 +0000
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
X-Inumbo-ID: 87e97f7c-fcfd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hXTzX7rsmJ3+Y4iEPyUuls2+JnU56VgAUs/87es+p3/LlQzzKwnoWRyCP5yB+IeqAdD2ghS4022atftZzQp47UUYAkeGyCHkj2FcXuCrleDM5Kza6ph0I4wpaD4Y3pXrQXYwWSXeVsGAs7LAX9Ca3QEjN0Rd92fDXprsmVqO/6yR0PI31fYW1dJpsgw6Ep9qv39Y1nDg1/N9azxlGwZV68ttaFMMgml03BWm6kP4241gq4hk6cIEVa16OU1GGPzW/72uZLdIi9DkZeTO0Lsz8UqHLNP3kDuVmOQUXR6dbNuOweIu37SsFHCVvL5kX6YH5cquAt/EWpC3BrNyM/6olg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy6vtQvPHe/s3EBQ+9ORO4entkW9CaJE3vnSWfjN6n8=;
 b=cf2x8EuhhqKLeWBupzBHHU+C9KUUY3tFSgDdREJFfqLM6HodB4gDh2DtWD6HqYErMzxm/7hP0Kbz9HHD701+GMNI/X7jNsr4Fpqh6goaB/tpsrWczkAfuj+IuL4dGMlHjYVZY/Zb8fUWKYyQrx6902mfgq+KLgfKox5FF72zByoyPeAxhO82saRfml/WGBFhXPP4Ahh0zWCUh4+LSdV9PJ4Bxfpo3i+uu/dQuBqxQdxLkmRgCWkyO0zdq0q8Y9r/Bl1H31Co5icq5Xfd7YUBGhreq8fc+xQVgrlmRH1d85RMULNsRMMcPxpT2VCMU1VN6ruGJXGz2m8ysw50OzS1uQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy6vtQvPHe/s3EBQ+9ORO4entkW9CaJE3vnSWfjN6n8=;
 b=2NwNIVgF+sD53YLFcfxMJLpkpzmNf4SVv3y6d4CbXMKXSoghRZe7fX4UXPeI7MK9NkT2YGmx2hRdY5KQ17aSnewyoSue54FLTTg2IPsFRovDfjFuQmUhMFC+HORjo0H6LWRDurQl73cn33jvhsJsSWg9tiNIWIeOjBZ53nRpdG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVRls5qWNCLgLaX3HhorMXb4gnrEyzhwNICdnz7DRIwSNy5E8mGIE3DJ1rqjNi80VpCKq3s5JHib5sUtlRUgGbPJUUhXRVM8mN053h2dmtMKT6vTmygcl2A1HKHlKtzuGJrvmBOiJDybyu8mdJhESgfLpbj//jlCPpCkgzRr2Hjg/VkBg5ebPD/2v1+tuY8r1auE/cGQeRCLZk+v1l9fRUw5LXWmTf/1/pBc3onGk82SSCH8sx5EoG98QGusoqt2OcNoeucLI/2eZ3Fs9eQMPFkDCZ9q/IORxAhi/Wd5j8Q/qQsnwthZKYtwwBQofd5G741o+oVmGe2/9jAwkjOI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy6vtQvPHe/s3EBQ+9ORO4entkW9CaJE3vnSWfjN6n8=;
 b=oeGh6p/QDBxsNZZTBP4b+413FvJN8mldPcXfPVyCKW94Ak1Jp+qNeRaaRXOlPigfmrvXXkLZ5mbLVVE5bvooOjhp+NreyEcykqAP+Xh6WBzDxFd3z17xAl8hZNWgP78SNtGKiNwBUuvFHByDqBaWu7AJEQHWiT4+39wO4ByLYWGmWj6EKqxBxpLr9wT+phbxErj3ZBosxhIp64nAA6hipqlHBTBvjYotpcmzRlvAzsQoUCaPbUl0cAkG3kI6HHhHhS3S5bCkdOS1OM1sVE+aDa13NwSWZ7CwDwmzxN02leAIiCVUZrKnHO111XqUMKa9uiMKRf9CSyR0TCkSag7plA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy6vtQvPHe/s3EBQ+9ORO4entkW9CaJE3vnSWfjN6n8=;
 b=2NwNIVgF+sD53YLFcfxMJLpkpzmNf4SVv3y6d4CbXMKXSoghRZe7fX4UXPeI7MK9NkT2YGmx2hRdY5KQ17aSnewyoSue54FLTTg2IPsFRovDfjFuQmUhMFC+HORjo0H6LWRDurQl73cn33jvhsJsSWg9tiNIWIeOjBZ53nRpdG8=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: RE: [PATCH v6 0/9] xen: drop hypercall function tables
Thread-Topic: [PATCH v6 0/9] xen: drop hypercall function tables
Thread-Index: AQHYP4flEN1TZgxxxkSZpjQ9KWhqIa1xioog
Date: Wed, 6 Jul 2022 07:30:23 +0000
Message-ID:
 <AS8PR08MB79919E80E3D321527A4BE91F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220324140139.5899-1-jgross@suse.com>
In-Reply-To: <20220324140139.5899-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3A4438CCA3DA4E4C85F88D87571BDF64.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7087e93a-8a3f-4e3b-49c9-08da5f2169ce
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|DBAEUR03FT013:EE_|PR2PR08MB4842:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zgmaJQacaoYPPSPWvKi1DVtU0I/RHFOsJxr7fkuv3tbG2rwLWE5VuLQ9AcTZE7t8ybIzmD3ao5Ods/qBXKHXUp2NVWnY//BPhlg3kcVwgQKbuRsKTUK5L3uxWsVCQPnDGeYaNW7H+TMwij2XHtAdU0+mSmTZLYcA7iyz9iXn7kSzP0CnNqJDInwwUN/2dAxhgdOsdsVINVjpywHJ2Irqb3huhR/ntnH2ZRP0pkVaTvE8fJ28PPn19ZfhNpxOvDFnt/EC17Sbe3liaMBQTPP868J0Lj++U5/hCtWDWWa5FBaar5rTXjOsYiO8r1poFXWK02ZWGDlDK7Rq+apiP+r1VI33W71CCeH789KqwqOM8bU+/peaT6Clg0Bd+44hyh+M/iHU5BpN1CJhgTkuqKBjR7J4pVZCM+G1YtcLON9TKdzSbt5hTDNvuBzs7LQ+QmAD/nWGS04hL4IKUmEzhNIfXzqFw0jUHRq1KQGgz5MAKhlBj8t1oAhnpr8UySyh58jnqjmjn4cyErpLgDggbOGUnjdXjnsVv4Ct1tRbn9t3hAvldDzOV/LbyuZTZvLRPIn7aDiBE39WfRf35UfuI985abpvhxX5qsapEnLQdoy57wkktj/iVU15qcrttR6DDIVd6CatkOEKs7nVp64BZa53D/w1BzHbpk75twOd/+pq/1wsBfz4PmaC5KhXGRg5kk9EZqCHxCT0ZKXE6AaLDFToBLWCSsjw5ZB+MsfmnRRN0KAwBuU5dHhaIeSCMteuzP/pRG/+54V/DUg6ZSNqgTADAoV/T1cEb3ccg2wuhwOJXEv54EFwhlhUfDAHWYk/AxfB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(6506007)(7696005)(86362001)(7416002)(5660300002)(2906002)(38070700005)(66556008)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(71200400001)(54906003)(110136005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb9ec012-dc4b-4e6b-a651-08da5f216378
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ocv5wfcZNGu0TP0ga5AiGAthwG5FRVd6D8hX9bFqEMpCN+rhLmjsuybc5GKsS8knioKSDJrCYurvJ2eqiDfrcVztpLbRbCGVWllLS/vklQyQwHiM/pC3kc87GlpXHFXQ7rAK1eFA9uKfduRcioI6LDbAhz39KygFASP+fWuKtUkbHpivgmJQJQUuKufZFA5ZKgShKVjX30m9s4FTKIAMYBQ9nSA50BCg04SRPwNiZ9gVb0oIMqRxZJp4nSKOH7uZV5D72/8JlnRXnuUNsQ7iCR60YTQ32n1YNn61KjWV85PD66rApE/OQCN4fKNRX2TyU9ctb0IIMV4sJpvOCFw8zJdOGswKXDy2YZqRQf7alFfn94igb+9Xd4OAQUbChlMw7gfaZU/nL6o/DCizkIlkNgcXNAEepL1fUJvpHwS9tOPwup8yTd1nYNp5lVlTuSLz5WjKlpAwzwUnaKgghNZwxwWV8hYQIIGHXE4P1dhJhv5qzK90U2hQF3dbaf4WzaZBR2tI0dFeFxe1akOWPblNrwnnYU4pE5LZSUwRjSorgmjJAhiFV7RLmIW9zBo+1quhHXFmh7oURpHavjrfAe13UKj8wzHITwvFo6kqVeQfctrhNtDIWwGz6SJwp/AaELSRoXkOsefWrkeR7fznJ2va9zC4sINOqVue0qvYDgYROK0oUk20Vyv7oj2nbBj2tJ+9Fi9oov7MaFz7koDij/MrmrlS4sHlHr5sm9CS0wi0Z+FlITgfc2XtN/PDpjA117MkGxGKA8u8EgKICi/gQOX3Wgl3wv4+DBh5KPPBoMj5Mf82Kn7cvyGgQj8l3tl6fcx6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(40470700004)(46966006)(82310400005)(70586007)(8676002)(4326008)(70206006)(81166007)(478600001)(7696005)(6506007)(186003)(107886003)(41300700001)(110136005)(9686003)(83380400001)(82740400003)(54906003)(316002)(26005)(47076005)(86362001)(336012)(356005)(2906002)(36860700001)(5660300002)(33656002)(40480700001)(8936002)(40460700003)(52536014)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:34.0032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7087e93a-8a3f-4e3b-49c9-08da5f2169ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4842

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGJlZW4gc3RhbGUgZm9yIG1vcmUg
dGhhbiAzIG1vbnRocywgd2l0aDoNCg0KUGF0Y2ggIzEgbWVyZ2VkLg0KUGF0Y2ggIzIgbmVlZCBm
ZWVkYmFjayByZWdhcmRpbmcgdGhlIGtleGVjIGFuZCBhcmdvIGNoYW5nZXMuDQpQYXRjaCAjMyAj
NCAjNSAjNiAjNyAjOCAjOSByZXZpZXdlZC9hY2tlZC4NCg0KU28gc2VuZGluZyB0aGlzIGFzIGEg
Z2VudGxlIHJlbWluZGVyIGZvciBrZXhlYyBhbmQgYXJnbyBtYWludGFpbmVycy4NClRoYW5rcyEN
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMC85XSB4ZW46IGRyb3AgaHlwZXJjYWxsIGZ1bmN0aW9uIHRh
Ymxlcw0KPiANCj4gSW4gb3JkZXIgdG8gYXZvaWQgaW5kaXJlY3QgZnVuY3Rpb24gY2FsbHMgb24g
dGhlIGh5cGVyY2FsbCBwYXRoIGFzDQo+IG11Y2ggYXMgcG9zc2libGUgdGhpcyBzZXJpZXMgaXMg
cmVtb3ZpbmcgdGhlIGh5cGVyY2FsbCBmdW5jdGlvbiB0YWJsZXMNCj4gYW5kIGlzIHJlcGxhY2lu
ZyB0aGUgaHlwZXJjYWxsIGhhbmRsZXIgY2FsbHMgdmlhIHRoZSBmdW5jdGlvbiBhcnJheQ0KPiBi
eSBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBjYWxsIG1hY3Jvcy4NCj4gDQo+IEFub3RoZXIgYnkt
cHJvZHVjdCBvZiBnZW5lcmF0aW5nIHRoZSBjYWxsIG1hY3JvcyBpcyB0aGUgYXV0b21hdGljDQo+
IGdlbmVyYXRpbmcgb2YgdGhlIGh5cGVyY2FsbCBoYW5kbGVyIHByb3RvdHlwZXMgZnJvbSB0aGUg
c2FtZSBkYXRhIGJhc2UNCj4gd2hpY2ggaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgbWFjcm9zLg0K
PiANCj4gVGhpcyBoYXMgdGhlIGFkZGl0aW9uYWwgYWR2YW50YWdlIG9mIHVzaW5nIHR5cGUgc2Fm
ZSBjYWxscyBvZiB0aGUNCj4gaGFuZGxlcnMgYW5kIHRvIGVuc3VyZSByZWxhdGVkIGhhbmRsZXIg
KGUuZy4gUFYgYW5kIEhWTSBvbmVzKSBzaGFyZQ0KPiB0aGUgc2FtZSBwcm90b3R5cGVzLg0KPiAN
Cj4gQSB2ZXJ5IGJyaWVmIHBlcmZvcm1hbmNlIHRlc3QgKHBhcmFsbGVsIGJ1aWxkIG9mIHRoZSBY
ZW4gaHlwZXJ2aXNvcg0KPiBpbiBhIDYgdmNwdSBndWVzdCkgc2hvd2VkIGEgdmVyeSBzbGltIGlt
cHJvdmVtZW50IChsZXNzIHRoYW4gMSUpIG9mDQo+IHRoZSBwZXJmb3JtYW5jZSB3aXRoIHRoZSBw
YXRjaGVzIGFwcGxpZWQuIFRoZSB0ZXN0IHdhcyBwZXJmb3JtZWQgdXNpbmcNCj4gYSBQViBhbmQg
YSBQVkggZ3Vlc3QuDQo+IA0KPiBDaGFuZ2VzIGluIFYyOg0KPiAtIG5ldyBwYXRjaGVzIDYsIDE0
LCAxNQ0KPiAtIHBhdGNoIDc6IHN1cHBvcnQgaHlwZXJjYWxsIHByaW9yaXRpZXMgZm9yIGZhc3Rl
ciBjb2RlDQo+IC0gY29tbWVudHMgYWRkcmVzc2VkDQo+IA0KPiBDaGFuZ2VzIGluIFYzOg0KPiAt
IHBhdGNoZXMgMSBhbmQgNCByZW1vdmVkIGFzIGFscmVhZHkgYXBwbGllZA0KPiAtIGNvbW1lbnRz
IGFkZHJlc3NlZA0KPiANCj4gQ2hhbmdlcyBpbiBWNDoNCj4gLSA1IHBhdGNoZXMgcmVtb3ZlZCBh
bCBhbHJlYWR5IGFwcGxpZWQNCj4gLSBuZXcgcGF0Y2hlcyAxLCAzIGFuZCAxMQ0KPiAtIGF2b2lk
IHN3aXRjaGluZyBBcm0gaHlwZXJjYWxsIGhhbmRsZXJzIHRvIHJldHVybiBsb25nIChubyBjaGFu
Z2Ugb2YNCj4gICBoYW5kbGVycyByZXR1cm5pbmcgbG9uZyBhbHJlYWR5KQ0KPiANCj4gQ2hhbmdl
cyBpbiBWNToNCj4gLSBwYXRjaCAzIG9mIFY0IGhhcyBiZWVuIGFwcGxpZWQgYWxyZWFkeQ0KPiAt
IGNvbW1lbnRzIGFkZHJlc3NlZA0KPiAtIHJlYmFzZQ0KPiANCj4gQ2hhbmdlcyBpbiBWNjoNCj4g
LSBwYXRjaCAxIG9mIFY1IGhhcyBiZWVuIGFwcGxpZWQgYWxyZWFkeQ0KPiAtIGZpeCBvZiBhIHJl
YmFzZSBhcnRpZmFjdA0KPiANCj4gSnVlcmdlbiBHcm9zcyAoOSk6DQo+ICAgeGVuOiBtb3ZlIGRv
X3ZjcHVfb3AoKSB0byBhcmNoIHNwZWNpZmljIGNvZGUNCj4gICB4ZW46IGhhcm1vbml6ZSByZXR1
cm4gdHlwZXMgb2YgaHlwZXJjYWxsIGhhbmRsZXJzDQo+ICAgeGVuOiBkb24ndCBpbmNsdWRlIGFz
bS9oeXBlcmNhbGwuaCBmcm9tIEMgc291cmNlcw0KPiAgIHhlbjogaW5jbHVkZSBjb21wYXQvcGxh
dGZvcm0uaCBmcm9tIGh5cGVyY2FsbC5oDQo+ICAgeGVuOiBnZW5lcmF0ZSBoeXBlcmNhbGwgaW50
ZXJmYWNlIHJlbGF0ZWQgY29kZQ0KPiAgIHhlbjogdXNlIGdlbmVyYXRlZCBwcm90b3R5cGVzIGZv
ciBoeXBlcmNhbGwgaGFuZGxlcnMNCj4gICB4ZW4veDg2OiBjYWxsIGh5cGVyY2FsbCBoYW5kbGVy
cyB2aWEgZ2VuZXJhdGVkIG1hY3JvDQo+ICAgeGVuL2FybTogY2FsbCBoeXBlcmNhbGwgaGFuZGxl
cnMgdmlhIGdlbmVyYXRlZCBtYWNybw0KPiAgIHhlbi94ODY6IHJlbW92ZSBjZl9jaGVjayBhdHRy
aWJ1dGUgZnJvbSBoeXBlcmNhbGwgaGFuZGxlcnMNCj4gDQo+ICAuZ2l0aWdub3JlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIHhlbi9hcmNoL2FybS9kb21haW4uYyAg
ICAgICAgICAgICAgICAgICAgfCAgMTUgKy0NCj4gIHhlbi9hcmNoL2FybS9odm0uYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDMgKy0NCj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9oeXBl
cmNhbGwuaCAgICAgfCAgIDcgKy0NCj4gIHhlbi9hcmNoL2FybS9wbGF0Zm9ybV9oeXBlcmNhbGwu
YyAgICAgICAgfCAgIDEgKw0KPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgICAg
ICAgICB8IDExNyArKy0tLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9jb21wYXQuYyAgICAgICAgICAg
ICAgICAgICAgfCAgIDYgKy0NCj4gIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jICAgICAg
ICAgICAgfCAgIDIgKy0NCj4gIHhlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jICAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0NCj4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgICAgICAg
fCAgMTEgKy0NCj4gIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgfCAg
IDQgKy0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vZG0uYyAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Ky0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0N
Cj4gIHhlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgICAgICAgICAgICAgfCAxNzcgKystLS0t
LS0tLS0tLQ0KPiAgeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jICAgICAgICAgICAgICAgICB8ICA1
OSAtLS0tLQ0KPiAgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVyY2FsbC5oICAgICB8IDIw
MSArKysrLS0tLS0tLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdpbmcuaCAg
ICAgICAgfCAgIDMgLQ0KPiAgeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxMyArLQ0KPiAgeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgICAgICB8
ICAgMyArLQ0KPiAgeGVuL2FyY2gveDg2L3BoeXNkZXYuYyAgICAgICAgICAgICAgICAgICB8ICAg
MiArLQ0KPiAgeGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jICAgICAgICB8ICAgMyAr
LQ0KPiAgeGVuL2FyY2gveDg2L3B2L2NhbGxiYWNrLmMgICAgICAgICAgICAgICB8ICAyNiArLQ0K
PiAgeGVuL2FyY2gveDg2L3B2L2Rlc2NyaXB0b3ItdGFibGVzLmMgICAgICB8ICAgOCArLQ0KPiAg
eGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVu
L2FyY2gveDg2L3B2L2h5cGVyY2FsbC5jICAgICAgICAgICAgICB8IDE4NyArKy0tLS0tLS0tLS0t
LQ0KPiAgeGVuL2FyY2gveDg2L3B2L2lyZXQuYyAgICAgICAgICAgICAgICAgICB8ICAgNSArLQ0K
PiAgeGVuL2FyY2gveDg2L3B2L21pc2MtaHlwZXJjYWxscy5jICAgICAgICB8ICAyMiArLQ0KPiAg
eGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPiAgeGVu
L2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2Fy
Y2gveDg2L3g4Nl82NC9jb21wYXQvbW0uYyAgICAgICAgICB8ICAgMyArLQ0KPiAgeGVuL2FyY2gv
eDg2L3g4Nl82NC9kb21haW4uYyAgICAgICAgICAgICB8ICAxNiArLQ0KPiAgeGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ICB4ZW4vYXJjaC94ODYveDg2
XzY0L3BsYXRmb3JtX2h5cGVyY2FsbC5jIHwgICAxIC0NCj4gIHhlbi9jb21tb24vYXJnby5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCj4gIHhlbi9jb21tb24vY29tcGF0L2RvbWFp
bi5jICAgICAgICAgICAgICAgfCAgMTUgKy0NCj4gIHhlbi9jb21tb24vY29tcGF0L2dyYW50X3Rh
YmxlLmMgICAgICAgICAgfCAgIDMgKy0NCj4gIHhlbi9jb21tb24vY29tcGF0L2tlcm5lbC5jICAg
ICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9jb21tb24vY29tcGF0L21lbW9yeS5jICAgICAg
ICAgICAgICAgfCAgIDMgKy0NCj4gIHhlbi9jb21tb24vZG0uYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0NCj4gIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTQgKy0NCj4gIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKy0NCj4gIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jICAgICAgICAgICAgICAgfCAg
IDMgKy0NCj4gIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0NCj4gIHhlbi9jb21tb24vaHlwZnMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0N
Cj4gIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4g
IHhlbi9jb21tb24va2V4ZWMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gIHhl
bi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9j
b21tb24vbXVsdGljYWxsLmMgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gIHhlbi9jb21t
b24vc2NoZWQvY29tcGF0LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9jb21tb24v
c2NoZWQvY29yZS5jICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gIHhlbi9jb21tb24vc3lz
Y3RsLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9jb21tb24veGVub3By
b2YuYyAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIHhlbi9pbmNsdWRlL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgfCAgMTMgKw0KPiAgeGVuL2luY2x1ZGUvaHlwZXJjYWxsLWRlZnMu
YyAgICAgICAgICAgICB8IDI4NSArKysrKysrKysrKysrKysrKysrKw0KPiAgeGVuL2luY2x1ZGUv
eGVuL2h5cGVyY2FsbC5oICAgICAgICAgICAgICB8IDE4NSArLS0tLS0tLS0tLS0tDQo+ICB4ZW4v
c2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3ayAgICAgICAgICAgIHwgMzE0ICsrKysrKysrKysrKysr
KysrKysrKysrDQo+ICB4ZW4veHNtL3hzbV9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstDQo+ICA1OCBmaWxlcyBjaGFuZ2VkLCA4NjEgaW5zZXJ0aW9ucygrKSwgOTM3IGRlbGV0
aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2h5cGVyY2FsbC1kZWZz
LmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vc2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3aw0K
PiANCj4gLS0NCj4gMi4zNC4xDQo+IA0KDQo=

