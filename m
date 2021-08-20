Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A23F31EF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 19:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169624.309873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH7uJ-0003Sj-KV; Fri, 20 Aug 2021 17:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169624.309873; Fri, 20 Aug 2021 17:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH7uJ-0003PV-GU; Fri, 20 Aug 2021 17:02:15 +0000
Received: by outflank-mailman (input) for mailman id 169624;
 Fri, 20 Aug 2021 17:02:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH7uI-0003PP-NA
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 17:02:14 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cb87a44-01d8-11ec-a6e9-12813bfff9fa;
 Fri, 20 Aug 2021 17:02:12 +0000 (UTC)
Received: from DB9PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:1db::25)
 by VI1PR08MB3519.eurprd08.prod.outlook.com (2603:10a6:803:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Fri, 20 Aug
 2021 17:02:11 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::75) by DB9PR06CA0020.outlook.office365.com
 (2603:10a6:10:1db::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Fri, 20 Aug 2021 17:02:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 17:02:10 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Fri, 20 Aug 2021 17:02:10 +0000
Received: from f2716aa27af9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 275EC790-3351-4B80-8713-1BBC8EA11863.1; 
 Fri, 20 Aug 2021 17:02:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2716aa27af9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 17:02:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB5237.eurprd08.prod.outlook.com (2603:10a6:20b:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 17:01:59 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 17:01:59 +0000
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
X-Inumbo-ID: 5cb87a44-01d8-11ec-a6e9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ6+97H3saUxhivE3cn8tqVpZGQmL7lGL4gSErrjN0w=;
 b=bjy6LPzHs8CJLHKRx/K5F0gX12mAyMf+XDIYpMVtm7yXYOIvjusqvpl2xTVif6DP6M8DwN9GkJh7wGRR3uQK0mqv2XACZns7vxzOnI3WlFk+ykWOzFiSVPI4acfFPkgfspoHFWMHfnhYaQA3+TCJcdWQEavtnKSoQXbukt4LXAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0807fca869aa4eae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeHdaAsHL1walq0di9yCZRMGfBkXTJ0oQiXXX1eQzSoHIT+BknH85ehrBffbQmuh5aPNWXpZpTd82y+fFGtw3CFNw7dC5LEgEbar0YPFHORGhCNtoz49VI/4VjuqdUgDoOh0FKyrI7liVdRr5xDYaAzU6cRmWd5KKXp6WadDwMgydQi6zlin1vU/3OIH8TpHY3zGS2GGk87PuTFj64aCZnZbz/aFxTIf2UDi9ekhhiLQBihXbq1/OWWq+eIptLqZ0yoikpm3PwMSwG+m00+XvCuJrfDWgGv/LUtne+VmjxWXSPibl+O2QUdS8klu3LuIfh4fBl7c7XIh2FYHHEpiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ6+97H3saUxhivE3cn8tqVpZGQmL7lGL4gSErrjN0w=;
 b=Esef3ezN90GjDrkcVEoYfVsG074yvl4/KQElivVCqtA+K1BaBbsq6pK06vOxhrgX2z8XSkumu/GGw/drpSL6XkI9iUAAL0ypOhvvEH+ROjqaoYMLiBYVpd1HUXjFo8a6bd1GF1tEjScjH+tigTfbXKgvW97NghBTh9P+w1RIT5XVbTQihiQBItIlAXy/fTjZHRZkLV3OmcaJk4my31jNT8wAojlqAkn0mI1D5v3tvl0ClH0kE/LQusVqxPHbSNzKNqKZ5ck2TkdzCfIeKX8ktyhTfTeq3hLOgyKN9ZlYnIGhrmi2lzfl9CrEi4ql8xKmOIfIJHn35zyzzDohMaB41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ6+97H3saUxhivE3cn8tqVpZGQmL7lGL4gSErrjN0w=;
 b=bjy6LPzHs8CJLHKRx/K5F0gX12mAyMf+XDIYpMVtm7yXYOIvjusqvpl2xTVif6DP6M8DwN9GkJh7wGRR3uQK0mqv2XACZns7vxzOnI3WlFk+ykWOzFiSVPI4acfFPkgfspoHFWMHfnhYaQA3+TCJcdWQEavtnKSoQXbukt4LXAw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 13/14] xen/arm: Fixed error when PCI device is assigned
 to guest
Thread-Topic: [PATCH v1 13/14] xen/arm: Fixed error when PCI device is
 assigned to guest
Thread-Index: AQHXlPL/fNVOYnE9fEGgRojjCVjj8at6vRwAgAHjK4A=
Date: Fri, 20 Aug 2021 17:01:59 +0000
Message-ID: <EE39BE82-DAFE-4BA0-AB22-5543CBCBDF26@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <917720808121c3098690b51d55f2d60118ec6408.1629366665.git.rahul.singh@arm.com>
 <f57bc8cf-6fcf-b9ef-cdd5-1bf5ad4701a7@suse.com>
In-Reply-To: <f57bc8cf-6fcf-b9ef-cdd5-1bf5ad4701a7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4f90d0d-aaf2-40b4-0f72-08d963fc4019
x-ms-traffictypediagnostic: AM6PR08MB5237:|VI1PR08MB3519:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB35195C009A8F42C419297FDCFCC19@VI1PR08MB3519.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5z9lqM5BVv5YhlXVKiLbLJPzIPJvJ9XgHHIq5GJ+AOnI8KE2KEEDIk4ovfAk9d3RdLMHWzS3srAhsx4aX5pQPQK8f8Vlpoc9Awv1iV0z/vbCMkjdwjFAh4EaZAormSy5p3gdBopM2moOLWGZRrtj2Wzt43Md9Ay2Dx5eKXADOkI87rb87jIw3rq9CYyXn+ePDVdxfNO0VrSS3P5JakTa0QVPBRtlzFp65uwo7S5508Y5MVMIiNxPfmxJ6gfgVauNEjKkn8aPDg+HrDWFzhnk13h7EEWe5LSJZrmXTysKXy0oQ6KLts4PoAJR189C8waoMqJt7kyZf09yHW/SQzSzaKI45MeEg6aF6T+Bf1n5k5jN+jQjD3wvUlNTOpUnv/wra0uppE5EdHLaxiMPwA4TMdp+/qaijH35gnuR8OZ/typkAbaqmT+h+Bi5/eV9kB1yQH5MzyKJhfy4rZVWBcHUVXBPgWvSU9lYuauol3Hea3LzHQT8/ezOZa6WmkpfvS7f6OpjQqtYeCyliwzYJkf+StGzV6D8284CSxQF/eEr5P9LY17K+t1fCWHfQNGkf9erkZo2HtaHf0VBtVBJ4HK/KgUrYHqL5e8skGKWjxnGnE9TYhR+fbb3of8P1KA6tSmKNrGPSLb9cuMpGDodzY2K5yDxvRFgsTnNJYK8tSmdN79ZTBQhsCsjLiSFl3CMi95Cknyu2O623s5yyw6yS9WK2rbYVozGUSUvxgM+P/3+7aLiun47EKsAmwCQcv39Sk/p
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(91956017)(186003)(36756003)(76116006)(71200400001)(54906003)(53546011)(5660300002)(86362001)(4326008)(8936002)(2616005)(6512007)(316002)(122000001)(8676002)(6506007)(6486002)(2906002)(66446008)(64756008)(66556008)(66476007)(38100700002)(33656002)(66946007)(38070700005)(26005)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WZcPWudnsV3WFP4Ol7OwgqodXISuQ1iSa+xPQ9BwVQOZ79Lcwr2Pwu5sm56y?=
 =?us-ascii?Q?4CxUqW0QogohRG9BPvzLwDsbbnbQopxj9t7IbCjOPRZzuODffwbvexVo1F2O?=
 =?us-ascii?Q?VWdScHWd6NfSKtOEwrmRKjJUCcjMXh4h5WEcW84OJwchSH9L/SpAfWwImO9I?=
 =?us-ascii?Q?bxtvZBmm1TtBcEUjPCOFT+5k/yQGGjQGjdTuAX8t99c8SxOfnyw/EzxNZt9f?=
 =?us-ascii?Q?xkNqHGdnOp6O94nPC9y3B9Yq90UEG/gCcBjZ+E+3VoYzlUZ2seA6xz3eabAQ?=
 =?us-ascii?Q?JEb9P7tMpYEQtG53BYgxqP8abWJ30AU+osOtB42o5FyDVSpvpeTEsfci3aW8?=
 =?us-ascii?Q?bTERUpX0kjMr5dAlSNxEPYBpmyjQAkCjP4x7+OPX0R+004r9DfYkjOekKfFm?=
 =?us-ascii?Q?MOUSG74Q1JAcYR7cEXSvf+h1Eam26dv31s+8C/sPzVDSZcbti711/XUtVhTF?=
 =?us-ascii?Q?Udhdl8kyXGLZawFkTHpbQdkak8qcfW2TW6Rva4iJBw5lh/hHRXGYdDSBVMym?=
 =?us-ascii?Q?981g2P2Qd6aIappHFLfuJI3I7qqyqt8YsJ480/QpQWXI6TATwPkPtNU/OUDa?=
 =?us-ascii?Q?srwdtFP3JDk79ruKF7wiYdTTL9vQzUVDgoMsGNh1HLB++CTyUoFdxE3qpcrz?=
 =?us-ascii?Q?gcRBdKiyp/mymirI9z3NjkCoznLxuK2aysj42Lry50yJfaoA/UgdMVUyohce?=
 =?us-ascii?Q?8JbakulWyA/dMesX5hzWFQjR8HsuwNZWdJgeEILGIs1glEgWOWhX7u6YBSJp?=
 =?us-ascii?Q?sdXfuybiQ9h4g/X3Xf+YhIVjViu2gV4np3ydCx6kHqvL7+5SKYO4mXz2tvab?=
 =?us-ascii?Q?5zjpgWCeLUOyE79SrYZ7Ambwp42Ca9X8iMTkMxIBjUDt+p1gun08w7R8Tq1C?=
 =?us-ascii?Q?MT5CO7VDLZPMZvNh+2Bns+nQ4hWlSIYAdAjb7F+XW+001+7BL1FfTJbLj5wx?=
 =?us-ascii?Q?m3yoHgGnfbJcYWWKBYeI2JAyQ6khzHEfTqplbOD1W4YcZ9v4Ylra7cCxSpHX?=
 =?us-ascii?Q?IS2J3Y0qFBl6feAikFr+NNlWLkOgcoxFWoBbtIcc83OKWvd2wBIPiDVimdoB?=
 =?us-ascii?Q?naaVCyvwWGBguUuE1+f8AfHTUc4EsTIp6oymppJ3/kEJ64CT4S4i4eV7/X4b?=
 =?us-ascii?Q?0fSbnuLHd53ZFgawBDlAJ6hYCWWjLxjk/mgwcc67yCBnL5XrrWLRxQS1MI8b?=
 =?us-ascii?Q?MPguyumXrAVucKYUrc0JCVTPw6RM63ow5NYSSxpHCAHSD61PbnPp9yxcBKR3?=
 =?us-ascii?Q?VIUJRveLxxqtPSsOnbw9NmEhyjamwO7tcwdXnJY7gtWoZjv4EJCcQTz8JU31?=
 =?us-ascii?Q?Lg8bMXSx95j9pys8LNf87LA/?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B63C18ACEFD87A41A4285FCDF21381B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5237
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98c8c3b4-e770-4301-c40c-08d963fc3969
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xJzen9gk0h3xWvdAHYKS9YvYkmWw17yOqvrVDOnKw3V0alRCmysEVvw3Z5txT4jXSwHSnbcUugS0YvamQp/vUw/e1TgxMPzzz4WkWqj6rpjq3B/Uo8sNykLRCojFRZl2fAipJFZC/nReTdXwMoTg7WQLyJD3k/WSJDNdjb84jf7lGsef1siBkecPhHHIc5Ee0taJdWlw0Ow+08qXLhraouufhHOgqhF2ku044dAbwSqegBKPduNVKtC4KHdgCWLm7x97CD7UuRNWw9LKM2Fxj5gdu56duCnYocDNzCEE/AHwS0IS5JaLxDZdGI1qkZq/x1cY/+0OvTs3zIIOQiJRXzJRQ/tm4skijOIt0KrU0EZoTrOZ4s7ALxM0SFLXtHV4/ley9V7syGV6Re8tGWaVicyRga9eYdrtqQc+LQcaV+/NBCyzapaGYMgo6P5xam1o7xccWTBh4y2R4GNLa2en7lt4Zv4S3IQ6FnsjSs/Jw5YqOvSYhYNEkzG2DTMDiqSUOOvVJ/Qp+CVZxOj57Cvn1y4s38NyEMp+IZ88IJt3fbdLe47dXKaltO+pECF3JCWK2rW2TqeoClE4ITwot48c4boBohDG3ggl/f8fiYFNQSjy9sVyauOo5r0f9C7KahTBvYZguWizDs/490bis20se/J7Dx6NI2GEY2iI06vo8cE4EZDCBFVu7MfSB+tBNMtjEm2VJG1MtPvhPGR+SUiJig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(376002)(46966006)(36840700001)(86362001)(336012)(356005)(70586007)(4326008)(8936002)(53546011)(36860700001)(6512007)(36756003)(2616005)(54906003)(82740400003)(8676002)(81166007)(316002)(478600001)(26005)(70206006)(6506007)(33656002)(82310400003)(47076005)(6862004)(5660300002)(2906002)(186003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 17:02:10.7788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f90d0d-aaf2-40b4-0f72-08d963fc4019
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3519

Hi Jan,

> On 19 Aug 2021, at 1:12 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.08.2021 14:02, Rahul Singh wrote:
>> --- a/xen/arch/arm/domctl.c
>> +++ b/xen/arch/arm/domctl.c
>> @@ -173,6 +173,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struc=
t domain *d,
>>=20
>>         return rc;
>>     }
>> +    case XEN_DOMCTL_ioport_permission:
>> +        return 0;
>=20
> I don't think returning success for something that doesn't make
> much sense in the first place (there aren't truly "I/O ports" on
> Arm afaik) is a good idea.
> Instead I think the tool stack should
> avoid making arch-specific calls in an arch-independent way.

I agree with you let me try to modify the toolstack not to call the arch-sp=
ecific call.

Regards,
Rahul
>=20
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -42,6 +42,9 @@ int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
>>         break;
>>     }
>> #endif
>> +    case PHYSDEVOP_unmap_pirq:
>> +    case PHYSDEVOP_map_pirq:
>> +        break;
>=20
> Less sure here, but I'm not convinced either.
>=20
> Jan
>=20


