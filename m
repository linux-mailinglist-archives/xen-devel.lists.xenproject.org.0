Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC58144A3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654986.1022592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4dl-0007qs-T8; Fri, 15 Dec 2023 09:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654986.1022592; Fri, 15 Dec 2023 09:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4dl-0007od-QF; Fri, 15 Dec 2023 09:37:53 +0000
Received: by outflank-mailman (input) for mailman id 654986;
 Fri, 15 Dec 2023 09:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+kaI=H2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1rE4dj-0007oW-SR
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:37:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cc2c72c-9b2d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 10:37:50 +0100 (CET)
Received: from AS9PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:489::13)
 by VE1PR08MB5679.eurprd08.prod.outlook.com (2603:10a6:800:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 09:37:44 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:489:cafe::ca) by AS9PR05CA0054.outlook.office365.com
 (2603:10a6:20b:489::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31 via Frontend
 Transport; Fri, 15 Dec 2023 09:37:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Fri, 15 Dec 2023 09:37:43 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Fri, 15 Dec 2023 09:37:43 +0000
Received: from a41c0e88ad43.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC849A52-4CB6-46BA-9EF5-F9EF4C35489B.1; 
 Fri, 15 Dec 2023 09:36:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a41c0e88ad43.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Dec 2023 09:36:52 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB10252.eurprd08.prod.outlook.com (2603:10a6:20b:648::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 09:36:50 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::6cb4:5aeb:a290:1770]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::6cb4:5aeb:a290:1770%3]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 09:36:50 +0000
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
X-Inumbo-ID: 9cc2c72c-9b2d-11ee-98ea-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fbtg14kSgTWsDuJfBrw/wXxI9KXYXcB7V/uTr6NvklInzYmDNwSiumr1BMYprq9R7d91prWMBec6DVgw8b0lKDaPlI2eWd7alah8r6Br2lf9M312J6qG+X2qXRKRGvTxjaatn7MwqNzQIXEvsbvH5EyTQeAdjCRHmCycxY4JY6cS4IyUvDtE4uOxeIzGmSepMuJu7T2XSaSqxGciT5x66g8TjuYoSH2sczf5mxnLceeHy9iV6SaVaOb84aEBa8YhC5KYthQQGAxTCAsWlbz7+wFCaLFv4G8AgjKLVh7X54vx8Bkxy1yJiWBjHik7t3z0Tp8hOjCbRrG8Yqn+f/4JdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YGWxqzJeuJrALw4MTaFhrvF/9TdLY1BHDeRC9/lVaU=;
 b=Ef8IYBaPjkJMDlPkH3STqCtZjdH+VYtl2qbajI0tw+PC2D/u0lhuFMGtYrmneSW8lcgznYFqCHNihAiYXlkVWIk3jMRJTLMEhnd50GZpsBzGNf+AjyEe2swV4ydRr+KncNbal8zZbXGgTRtufdHhB6IxA1sqck+lH7KXCuhd6GMDCIkzVvxG6UastPs7Y/fE0aj5VIbv3xLAQf8HoECnQxTeL8tQ0JAzkMWAHOzMUQOtmvyQixJaoh0vj1pnIEB5uCJPOovPQCx3ZffxsXQpKnwaoRKvNNgVCyFHxhRgQEywNJcSHAKpvX+eMdEBy0zmKE3M3Usqg0AQJOcy3IgseA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YGWxqzJeuJrALw4MTaFhrvF/9TdLY1BHDeRC9/lVaU=;
 b=a0BDuiSiigHQzFkHXx9PL7b3Acr8uNM4zZ3kH60zLdow932ijHYVJQEusbCgo8viBazC3C9s00vnEQeWmEvD76Bi8ZjbI7T1nLRf9miPl0p+FmyiHlsbDueMWFfJN9e19/zb7y7v07bWP39iY8XqTwn5XAeAEaK8zngxHqOZUUI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b85d46dc4e010fa0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKJZJeN1R4RDQM9m9K6ABOkVZODYQDyTLUkN5ZJdAMkWbGM3N02MDnaHWd9FvbGzFlTpOx/QOGnmOz/BIQR9Zt8z1tTGYHPqF4tWe4+JyxisGpm9Bbu7Gb/07FBD4ZwkuTA2B5YcaqDELCPnIm3LXzI/VH2hsFkq1Q23euaKgSBurY2C5WN2f0O6zVNzKm0sQwthaGsdKU3E5IlWkaqng69hPGQjmPu1krfzIgiWixvoVwVGFfIC60EmMAJQycn92Xk9DDmQeyeVw/kt0G5r+dOujsMP6xexD7357xZ1B+MxzOHkR2bT+kC7vB1ZsyohDs3e3tnWgkkMoyVqIFgDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YGWxqzJeuJrALw4MTaFhrvF/9TdLY1BHDeRC9/lVaU=;
 b=TCOvaf3R+Bu0q8IOIXguBohNJaOxyNvJ6smGB8vVhuxqwhOA7bu+E8EQM8GIhhfy7hOIF8k7kuhMWz72gzyvVRiemqMeeHUDmDEfj36QpH8y9kGzA5Uml5DrPSpGZ92WyWmAlwb/SSbHyuWZ0Oy7NzMaRsu7F14wh347ub13UexWXBbg6D9PyYJAPQGHhQ1GwfLwP2gotBiLX7EJJ84ow49degE2+WM85mZkxe11huKD5uK1d2uvWuNGzkNSQrPNszD2DtIIbb1RrDYyygwV0a6CdLXhktxyIFNR3TVjLEvGwX10HnmSLYCk9ckqlkd6KHf6pQbISsiUIMkYmrd47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YGWxqzJeuJrALw4MTaFhrvF/9TdLY1BHDeRC9/lVaU=;
 b=a0BDuiSiigHQzFkHXx9PL7b3Acr8uNM4zZ3kH60zLdow932ijHYVJQEusbCgo8viBazC3C9s00vnEQeWmEvD76Bi8ZjbI7T1nLRf9miPl0p+FmyiHlsbDueMWFfJN9e19/zb7y7v07bWP39iY8XqTwn5XAeAEaK8zngxHqOZUUI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Christian Lindig
	<christian.lindig@cloud.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Thread-Topic: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Thread-Index: AQHaFn/ghOWRrQCqzUOzpwxJJh+Sd7B5h/6AgBhgEgCAGF9AgA==
Date: Fri, 15 Dec 2023 09:36:49 +0000
Message-ID: <3BA22E6C-F2AE-487D-AF2C-F9AE67E429D7@arm.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-3-stewart.hildebrand@amd.com>
 <da9eb6fe-3eaf-de9a-2790-79165ecfd917@suse.com>
 <e6019342-8e46-48c9-8211-26105c61fa52@amd.com>
In-Reply-To: <e6019342-8e46-48c9-8211-26105c61fa52@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS2PR08MB10252:EE_|AMS0EPF000001AA:EE_|VE1PR08MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4a9b0a-4693-4066-4d75-08dbfd517d23
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8cH80QRgWElGc1KZoJI+KU9RgxSdN8YkyQOr0kze+sL3vaCFGkmWNuh6EszTfPyaLOhTz3qsNspoPJQAK3bJ6Cz/QcHGFE3Z9b2nju/4QmhQ0zJBh/1MDlRv+m8QbwbSa4JQNLGvNuUaiDfLq7YN+bfARr2ezRXuNiGx434hlDlUhraPfNstsecBggR6PDjZUnDVPS/yyV4jixgrQcnUMqUsS//yslOF73U4Hib9KbYHNzZGhLkZ1CwhzmPVt5JQY4Rz1gdlxQABikDVpqDtP6pkT3EuFU0mFuCf0MEW7J+CMjvC54G0UExCStivjvW1jve36cXgfnLciG8w/UrEHAiGiequExTjtro5lcFa53Kw9gT+r/Fqk/Ld26ets/1CcnfrDL0ASKha3l9R38+YznDFNYx7YF8p1uaiMWh0czUgRpICLIlLdmxNKBUkYcwKeSDWv15PVMzeKJWLYTzg7+qwsKwmH9n+1Un4wJluYfBVPD00Zqjo5SE9OTgeSYtVctL8anhEfGUarO5Qk4uamaBImXftnTkkDUiNJIKjO0q9w5cDVlMgv+xW1mPTco5F2BIqjheeKB7mIvdQ9hO3m2M+T1aLrH05/eadmtBhPh9bsV7jBrkGBL0oTiBlC8znUvbxvD5pmrAgakp7aH8L9A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(36756003)(33656002)(41300700001)(71200400001)(91956017)(76116006)(66556008)(478600001)(6506007)(53546011)(66946007)(66446008)(64756008)(54906003)(6916009)(66476007)(38070700009)(26005)(6512007)(38100700002)(122000001)(83380400001)(2616005)(7416002)(5660300002)(2906002)(316002)(6486002)(8936002)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01257103CDC1D74DB240733EC19850BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10252
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a6f2f2b-6bf6-42e0-2a63-08dbfd515d2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LRlyGzIt0bgjedNU4ruXbxcyJ8Bj5Lcovz/ySuYzEQHZShLFbMHitilwvedHMT8eQ+jLXiwrLA7xUiIsqi70AdVn6DjvPeMnV+mhD6j2SnT3ehWyugHhf6vXn6fPeRAXyqqvahbEWgH8GJzmwxSv8RmDGg6wEhSA/Klf0j7aOsTS9htmIUs+ZcQDTkibTxuyF+IeS/zFqeJe3tq0ctatiRHXgLXktInAf1gDGxh4fYSAe7c/nItIj9ftHBt+MkMI5rKBf87OenYOCdHsy1cnYkl0+QUjaLvY4zuD2hOEg4wjuoA2FlKfgIQuC/1Wh1osAZ2mmuZcsiJhRlL/quwUHOfz/ShHXJyjY6yIJW8D4E2pdbXBNNkbkll0jzbaWTi3NHplubpwc6sDReF2Og0z7Wkiv1Nvo7/QXhbaInChCB0xJO3aP9xoqYHXTH0f8D14Ao87CWeSaY4TeodIlcpp2fLY7EaitM9JtH7M77tCGOwOgo3FwIuhmKoG0G1aVshTU4pdIqXgmqEEL2n0UWHHGmniAtDPoFV9yB4C5UDeDmlaSg4EMZMuB+OKi20GUBcXyelTgLzL/R61cAJ7hTRDd2rC+iCwXKgRn1ayI94rh2q7Jv0bRk0fTFNwxeye/OeOknd21iTAK5i71xgIiMag0CwkmwaNIBbxwoNCsFsv6DbA+2EIxe0RHYPv+iV76w7AODcPgccGoZn7kGM+qduiSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39850400004)(136003)(396003)(230922051799003)(82310400011)(64100799003)(186009)(1800799012)(451199024)(46966006)(36840700001)(26005)(2616005)(336012)(6506007)(53546011)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(4326008)(6862004)(41300700001)(2906002)(478600001)(6486002)(8676002)(8936002)(70586007)(70206006)(316002)(54906003)(82740400003)(356005)(33656002)(36756003)(86362001)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 09:37:43.5919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4a9b0a-4693-4066-4d75-08dbfd517d23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5679

SGkgU3Rld2FydCwNCg0KPiBPbiAyOSBOb3YgMjAyMywgYXQgOToyNeKAr3BtLCBTdGV3YXJ0IEhp
bGRlYnJhbmQgPFN0ZXdhcnQuSGlsZGVicmFuZEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEx
LzE0LzIzIDA0OjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDEzLjExLjIwMjMgMjM6MjEs
IFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4+PiBAQCAtNzA5LDEwICs3MTAsMTcgQEAgaW50
IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21h
aW4gKmNvbmZpZykNCj4+PiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+ICAgICB9DQo+Pj4g
DQo+Pj4gKyAgICBpZiAoIHZwY2kgJiYgIWh2bSApDQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAg
ZHByaW50ayhYRU5MT0dfSU5GTywgInZQQ0kgcmVxdWVzdGVkIGZvciBub24tSFZNIGd1ZXN0XG4i
KTsNCj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+PiArICAgIH0NCj4+PiArDQo+Pj4g
ICAgIHJldHVybiAwOw0KPj4+IH0NCj4+IA0KPj4gQXMgc2FpZCBvbiB0aGUgdjUgdGhyZWFkLCBJ
IHRoaW5rIG15IGNvbW1lbnQgd2FzIG1pc2d1aWRlZCAoSSdtIHNvcnJ5KQ0KPj4gYW5kIHRoaXMg
d2FudHMga2VlcGluZyBpbiBjb21tb24gY29kZSBhcyB5b3UgaGFkIGl0Lg0KPiANCj4gSSdsbCBt
b3ZlIGl0IGJhY2sgdG8geGVuL2NvbW1vbi9kb21haW4uYy4gTm8gd29ycmllcy4NCg0KSSB0ZXN0
ZWQgdGhpcyBwYXRjaCBhbmQgb2JzZXJ2ZWQgYnVpbGQgZmFpbHVyZSB3aGVuIGNvbXBpbGluZyB0
aGUgIng4Nl82NOKAnSBhcmNoIHdpdGgNCiJDT05GSUdfSFZNPW7igJwgb3B0aW9uLg0KDQp4ODZf
NjQtbGludXgtZ251LWxkICAgIC1tZWxmX3g4Nl82NCAgLVQgYXJjaC94ODYveGVuLmxkcyAtTiBw
cmVsaW5rLm8gLS1idWlsZC1pZD1zaGExIFwNCiAgICAuL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8g
LW8gLi8ueGVuLXN5bXMuMCANCng4Nl82NC1saW51eC1nbnUtbGQ6IHByZWxpbmsubzogaW4gZnVu
Y3Rpb24gYGFyY2hfaW9tbXVfaHdkb21faW5pdOKAmToNCiguaW5pdC50ZXh0KzB4MjE5MmIpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB2cGNpX2lzX21tY2ZnX2FkZHJlc3PigJkNCiguaW5pdC50
ZXh0KzB4MjE5MmIpOiByZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfWDg2XzY0X1BMVDMy
IGFnYWluc3QgdW5kZWZpbmVkIHN5bWJvbCBgdnBjaV9pc19tbWNmZ19hZGRyZXNzJw0KeDg2XzY0
LWxpbnV4LWdudS1sZDogKC5pbml0LnRleHQrMHgyMTk0Nyk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYHZwY2lfaXNfbW1jZmdfYWRkcmVzcycNCiguaW5pdC50ZXh0KzB4MjE5NDcpOiByZWxvY2F0
aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfWDg2XzY0X1BMVDMyIGFnYWluc3QgdW5kZWZpbmVkIHN5
bWJvbCBgdnBjaV9pc19tbWNmZ19hZGRyZXNzJw0KeDg2XzY0LWxpbnV4LWdudS1sZDogcHJlbGlu
ay5vOiBpbiBmdW5jdGlvbiBgZG9fcGh5c2Rldl9vcOKAmTogDQooLnRleHQuZG9fcGh5c2Rldl9v
cCsweDZkYik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJlZ2lzdGVyX3ZwY2lfbW1jZmdfaGFu
ZGxlcicNCigudGV4dC5kb19waHlzZGV2X29wKzB4NmRiKTogcmVsb2NhdGlvbiB0cnVuY2F0ZWQg
dG8gZml0OiBSX1g4Nl82NF9QTFQzMiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1ib2wgYHJlZ2lzdGVy
X3ZwY2lfbW1jZmdfaGFuZGxlcicNCng4Nl82NC1saW51eC1nbnUtbGQ6IC4vLnhlbi1zeW1zLjA6
IGhpZGRlbiBzeW1ib2wgYHZwY2lfaXNfbW1jZmdfYWRkcmVzcycgaXNuJ3QgZGVmaW5lZA0KeDg2
XzY0LWxpbnV4LWdudS1sZDogZmluYWwgbGluayBmYWlsZWQ6IGJhZCB2YWx1ZSAgICAgICAgICAg
ICAgICANCg0KDQpSZWdhcmRzLA0KUmFodWwNCg0KDQo+IA0KPj4gDQo+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2FyY2gteDg2L3hlbi5oDQo+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGlj
L2FyY2gteDg2L3hlbi5oDQo+Pj4gQEAgLTI4MywxNSArMjgzLDE2IEBAIHN0cnVjdCB4ZW5fYXJj
aF9kb21haW5jb25maWcgew0KPj4+ICNkZWZpbmUgWEVOX1g4Nl9FTVVfUElUICAgICAgICAgICAg
ICgxVTw8X1hFTl9YODZfRU1VX1BJVCkNCj4+PiAjZGVmaW5lIF9YRU5fWDg2X0VNVV9VU0VfUElS
USAgICAgICA5DQo+Pj4gI2RlZmluZSBYRU5fWDg2X0VNVV9VU0VfUElSUSAgICAgICAgKDFVPDxf
WEVOX1g4Nl9FTVVfVVNFX1BJUlEpDQo+Pj4gLSNkZWZpbmUgX1hFTl9YODZfRU1VX1ZQQ0kgICAg
ICAgICAgIDEwDQo+Pj4gLSNkZWZpbmUgWEVOX1g4Nl9FTVVfVlBDSSAgICAgICAgICAgICgxVTw8
X1hFTl9YODZfRU1VX1ZQQ0kpDQo+Pj4gKy8qDQo+Pj4gKyAqIE5vdGU6IGJpdCAxMCB3YXMgcHJl
dmlvdXNseSB1c2VkIGZvciBhIFhFTl9YODZfRU1VX1ZQQ0kgZmxhZy4gVGhpcyBiaXQgc2hvdWxk
DQo+Pj4gKyAqIG5vdCBiZSByZS11c2VkIHdpdGhvdXQgY2FyZWZ1bCBjb25zaWRlcmF0aW9uLg0K
Pj4+ICsgKi8NCj4+IA0KPj4gSSB0aGluayBhIG11bHRpLWxpbmUgY29tbWVudCBpcyBkcmF3aW5n
IG92ZXJseSBtdWNoIGF0dGVudGlvbiB0byB0aGlzLg0KPj4gSG93IGFib3V0ICJOb3RlOiBCaXQg
MTAgd2FzIHByZXZpb3VzbHkgdXNlZCBmb3IgWEVOX1g4Nl9FTVVfVlBDSS4gUmUtdXNlDQo+PiB3
aXRoIGNhcmUuIiB3aGljaCBJIHRoaW5rIGZpdHMgaW4gYSBzaW5nbGUgbGluZSBjb21tZW50Lg0K
PiANCj4gU291bmRzIGdvb2QuDQo+IA0KPj4gDQo+PiBKYW4NCg0KDQo=

