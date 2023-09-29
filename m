Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878987B2E55
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610404.949769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm998-0001v8-Kz; Fri, 29 Sep 2023 08:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610404.949769; Fri, 29 Sep 2023 08:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm998-0001s2-HL; Fri, 29 Sep 2023 08:46:50 +0000
Received: by outflank-mailman (input) for mailman id 610404;
 Fri, 29 Sep 2023 08:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm997-0001rh-Hh
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:46:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b986110f-5ea4-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:46:48 +0200 (CEST)
Received: from DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) by AS8PR08MB8778.eurprd08.prod.outlook.com
 (2603:10a6:20b:5bf::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:46:45 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::c7) by DUZPR01CA0064.outlook.office365.com
 (2603:10a6:10:3c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24 via Frontend
 Transport; Fri, 29 Sep 2023 08:46:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Fri, 29 Sep 2023 08:46:44 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Fri, 29 Sep 2023 08:46:44 +0000
Received: from e2ad50fe000d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22818982-42E6-48F8-8EFE-C1CD829BD661.1; 
 Fri, 29 Sep 2023 08:46:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2ad50fe000d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:46:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9433.eurprd08.prod.outlook.com (2603:10a6:102:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 29 Sep
 2023 08:46:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:46:36 +0000
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
X-Inumbo-ID: b986110f-5ea4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/18ITuBagn3j6CdrLAC7BenFW5denps1Qs/5TXe9g=;
 b=hV/oH13V5i0jhtNIvjG2G3WwXk2Mwpdb7N9WWg7ESsTGUOe8ZmB0HUiZDEbEUKtB0LGgso823WZkFd+5KpWm9dO0/SHfi2M8lsVgH+OxSgJTA7i42W7rywK3q4P5A0MaBYlhklL++l7jE68w3LzY7cqc28ZaWFrfywmCN1ZLIB8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b11eec1ca70dcf5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfDnQKAWhsGDACNM7xWgVk4admFMxNZnqCSYwfJLFy/sRbzACltB8ea0WiAhn2BCcKGfsMSuQYzSAHmaucbsO+WQt0jlu6eFNuwfbwGXM9Zp9cBwWI05od69pCywQ2b5MU6M6LikwkYcXFJOYDty7O9RmhiiFTC/a0hQkG+dBZ51oBA7ALFVSA9lFF16fg7qVN2Eyb7BZkcigL3lgS4J83TXBl87l4hZFgn++oIixrazG0WDxLPVgOjQtq+WvycFz1vLe699X9bq4iY+n4ZJDUUG9rLXvrW7MB/Jwj/CdXDBsR3NBThKwIeCAIFkXp/SJzROjqKCdpuhEshZ32sxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z/18ITuBagn3j6CdrLAC7BenFW5denps1Qs/5TXe9g=;
 b=dTpTSSXBZoX4E41D+scKr/IPYzO796eXUcFZJaGebx+4ZfIRTFNL7nT4aW6jJzwFEQZOuIjKDOuNB+Ef49uAtR3dtV7vlOu246fmu9VYFX+1fQQYdkAL+dSmLowyn6uSGHk+FPhtVZ2kR64zekHAYZI2xzN/aPtUMUSZ8QaBt4eSGKFty/Rk9zZZriOJRL7wUGGWXMXj2d+CWvMNKGjiqDh9TP0eUlhS8XE4cn1IK8J8Prnun2hKe6VrEdZpWxwEPmMVEEu1+SDzIL1dgQls3gTaI6DC6y4nI28OORgbZLLQemd6j6hwoxRcfQjMDfb/g7S/hrrIWu8scPulDx31MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/18ITuBagn3j6CdrLAC7BenFW5denps1Qs/5TXe9g=;
 b=hV/oH13V5i0jhtNIvjG2G3WwXk2Mwpdb7N9WWg7ESsTGUOe8ZmB0HUiZDEbEUKtB0LGgso823WZkFd+5KpWm9dO0/SHfi2M8lsVgH+OxSgJTA7i42W7rywK3q4P5A0MaBYlhklL++l7jE68w3LzY7cqc28ZaWFrfywmCN1ZLIB8=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>, David Kahurani <k.kahurani@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/xenstore: Avoid leaking memory in check_store
Thread-Topic: [PATCH] tools/xenstore: Avoid leaking memory in check_store
Thread-Index: AQHZ8pGDrH8+iI/p30O2arocOudwy7AxTkYAgAAo9ICAAAZ+gA==
Date: Fri, 29 Sep 2023 08:46:36 +0000
Message-ID: <AEA1F572-50B4-4EBE-922F-25A212243C4A@arm.com>
References: <20230929045724.6844-1-k.kahurani@gmail.com>
 <43936092-75f5-42ff-b0c2-2f79147e2f86@suse.com>
 <0a5bab77-5cac-47a2-805b-76396e4d4c89@citrix.com>
In-Reply-To: <0a5bab77-5cac-47a2-805b-76396e4d4c89@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9433:EE_|DBAEUR03FT035:EE_|AS8PR08MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 08109da7-da4f-40de-85e9-08dbc0c89c37
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 V5u8rw5qn8wFZzmspHM9pz+TNOXRSNhAmKYdsg8YHUY+WR7227ThU9rc4nTOIvfy8GOjb9z8DARaAPMjom49/1cz/cWOE1NfE1TBksv/9UboYzOdeUYb9CLr37CG3iK5zxgTgzyYrU2YDyd4WEWrOq+uqjiR7X5Avn0IDFuqv31/h7gl2UhsEyb6e65S8CsRBNqEd+oRgrOaH03oOjd5wZ2okG5xItyK69FVBNKORmPW16OdcjD5+/ILE2iYgqoskr0PO19eKTfCvxsd9TCx43VPOY28RK9grnYLJuZZh7XT6qIuyIxOevF2TpVmGWvK+c3C5WrWoXq4MsFCGdHzIAm9tsdQAQRJSjevulHnhMXomwnBa7lCdg7pYjBV6hubGO32TpVsMMeXGCLmuGeRKufq0tiSjLmVgZw/SgDYOEz609b18n0KMcbNNFyEYq6QZXEltOO/cydURSWFWGX+z3ZoSeKl4QqJuD+Ny1fRaKiRTxLmiH2WhPu0XpYYh5EU9OK+iC1kAYByk2iCihaubEMYzdbpBTxAGFu9iLwPgNfy8Gz+0uJI8oTWHRlehhwXtWhwtJMtdRBsvg2S9M/+SDKOrXP+afFzHMZxrLwBxznYP8p+tqToTty8GezFqmnrFPEIHGrjFMBNMiImzpP+fQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(122000001)(83380400001)(316002)(6506007)(53546011)(38070700005)(26005)(6512007)(4326008)(66556008)(64756008)(8936002)(54906003)(2906002)(5660300002)(6486002)(36756003)(8676002)(6916009)(33656002)(41300700001)(38100700002)(91956017)(2616005)(76116006)(71200400001)(478600001)(66476007)(66446008)(86362001)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6892D4E3D83042498188D85371333CB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9433
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd698f0e-4bfa-4816-1532-08dbc0c89727
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KdiqH/J8beTOiJAo5slb4cWdDS/hoouh4IL1FeykOwfvT/zYOOhgUvYCMNpy54or5UipEcGH9Yta6uVHGTUU+nDaH698WJxzc3dlZcfCPeicyhR1vF/6Z5Z4K24lrh9pwmi9FwNyKHLOdUTp52YrbUBdwNssF4EvBQycP8GxgzgB6Zenyv2MBsGzH5CrZhW+SXjUqF3qwD+Qf0RxGiVdtOSs/F6akUXsgiFP7ykW/cTv+ar6/iM0EIU7MfPejtJ4AmHyAXa6fq5Otsriz9AeQfRSMDQ+ZhY//g3lojrbZjrYjvW0NSYOGCY5T2zd5EbBupLWptnScAtEjYuWQ232pUlejh0JBuN4ebpoIy+Ml01CqbOAKcmZft3fvRzg06f4tIpZP7mx0qiwW602u3KzI4G7rvutZd9VA7NllhjFh5clqRw/caLsHrguYWawKHdDExQCK/JNVoqRSUpx4EHJ+o9o2e4oCFlpbOKQSDyLCeKS55ZQxqnuZr14gUeLUS/yciNVOJhznaGRdIQ7ykEhFtO9Rv7OeOneyM6n1RThKKU5QdwysS4OYll9xw+iDdH3gWfNmSCNgHwff0a65a5slcfPHVmAIOwFJ7q8euXP+CVG2CswqyTu2Osg3yt/NLzc9kXPMbvQWT6p3Cngxzt2bNq3RfnOQsR8bSP4W94uFzOHa7KsOJsgPgVFWGK+j56Z/bghhEukyMkSN+cVAUU83EmZHPuxlvTwND8s40S7he4E2torzPP06S4hKmIy4I+i
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(6512007)(6506007)(6486002)(53546011)(2616005)(26005)(336012)(33656002)(70586007)(70206006)(54906003)(86362001)(478600001)(47076005)(36860700001)(82740400003)(81166007)(83380400001)(356005)(2906002)(8936002)(8676002)(6862004)(4326008)(41300700001)(316002)(40480700001)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:46:44.9777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08109da7-da4f-40de-85e9-08dbc0c89c37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8778

Hi all,

> On Sep 29, 2023, at 16:23, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 29/09/2023 6:56 am, Juergen Gross wrote:
>> On 29.09.23 06:57, David Kahurani wrote:
>>=20
>> I'd like the following paragraph added to the commit message:
>>=20
>>   check_store() will leak the memory from reading the "@introduceDomain"
>>   and "@releaseDomain" nodes.
>>=20
>>> While this code should not be trigger-able from an unprivileged domain
>>> it is called multiple times when the database gets inconsistent. This
>>> means that a malicious guest able to corrupt the database will trigger
>>> the leaks here.
>>>=20
>>> Fix the leaks so that this code can be safely called from anywhere
>>>=20
>>=20
>> Fixes: 67617067f0b6 ("tools/xenstore: let check_store() check the
>> accounting data")
>>=20
>>> Signed-off-by: David Kahurani <k.kahurani@gmail.com>
>>=20
>> With above additions (can probably be done while committing):
>>=20
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> Can do, but this needs Henry's approval too at this point in 4.18

This is definitely a patch that should go with 4.18 so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> ~Andrew


