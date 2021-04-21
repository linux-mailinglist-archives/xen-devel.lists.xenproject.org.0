Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EB3666BD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 10:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114143.217398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7ta-0000Fc-8r; Wed, 21 Apr 2021 08:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114143.217398; Wed, 21 Apr 2021 08:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7ta-0000FE-3c; Wed, 21 Apr 2021 08:07:38 +0000
Received: by outflank-mailman (input) for mailman id 114143;
 Wed, 21 Apr 2021 08:07:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IT8=JS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lZ7tY-0000F9-J0
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 08:07:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8481e0ad-6fc6-4de3-a264-f482c7470a36;
 Wed, 21 Apr 2021 08:07:33 +0000 (UTC)
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by AM0PR08MB5153.eurprd08.prod.outlook.com (2603:10a6:208:163::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Wed, 21 Apr
 2021 08:07:32 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::b4) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend
 Transport; Wed, 21 Apr 2021 08:07:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 08:07:31 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 21 Apr 2021 08:07:31 +0000
Received: from b755683f15de.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B461E8E-7A8C-42AC-9061-F381617E4766.1; 
 Wed, 21 Apr 2021 08:07:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b755683f15de.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Apr 2021 08:07:20 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 08:07:08 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 08:07:08 +0000
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
X-Inumbo-ID: 8481e0ad-6fc6-4de3-a264-f482c7470a36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZCxa6qdpc8jLjqAvQ4QD/EzziEXyFJsgkOTsEZME+s=;
 b=I1Ln+2XvaAG6ZjOYvxz818iAa/qCXy4CGcsOB9BIhi/qHKH/Stiirx2TSCri+VrvBjSlZz9z/wJDjoOEcYVlxsidWkTWHKdrLKvVxN1lFh7fqN4REQ4rluQajTJPyWgXs8m6qTecwWf/sBSRq+Q9cLbW6bcG99HSR50H3e/Sx1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78e5fa09b8027581
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7MSfkDEJlv5DkelpID679+wvFAAsCtGaGfCv9rq/CWogJvLPZDFYtG5Y60cehkjTSV7U25mZhozX2c/PM2fooLF8CoeReiMUPnS4vDgr4rOf4zyLX3fZd67vwqNXpMnbsdfZvI0wfu98NGuXXgjJtz/7co2sK0/6h50ujwUC/my8uDVIDyypHnV0S+dmwaRyaZjHMWIUcotrvdi/G/tItDE8CV0vEdgk4hD40jEEwJTKdJ+feQB+rRPzPats16U8ITFDeUwDj4X6cUb2asEz47uwdbAQIHbfMFSgtr6Z5AYYqHfkEcsm3nd848IOcsmyXpwmWXUuyhBUznz+iqk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZCxa6qdpc8jLjqAvQ4QD/EzziEXyFJsgkOTsEZME+s=;
 b=jFnYAXp5A50HbB4cjpmSgLOA+F3AuZgKD1MsTWNMwepO0D7K68Aumgf0LnJ1VCb4P6/U2FMtG48b4Tl0C4nX6dOj6+V0S+GGJ5RWorkjxZffdjZAYLNGrOVBX/URqrADswyyNHDBZ8YaszeucwRRKojsN3cMSx/zE7BQPYUNSduR9r5VhVVLHAGH+eIGtFhFFiKFQUAMej+/HrsxB7VmEfAusJeb1UwBit1/Q70TDgYl7wRm5FnrcpqiKv9E36D/WNSekthlzCHJtj5b4lfGV/+xo03BJspbYJBV/73ykb3fZOxG+CbIOi/AidyIT26QZvJ3oCiufNYqFomNctt/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZCxa6qdpc8jLjqAvQ4QD/EzziEXyFJsgkOTsEZME+s=;
 b=I1Ln+2XvaAG6ZjOYvxz818iAa/qCXy4CGcsOB9BIhi/qHKH/Stiirx2TSCri+VrvBjSlZz9z/wJDjoOEcYVlxsidWkTWHKdrLKvVxN1lFh7fqN4REQ4rluQajTJPyWgXs8m6qTecwWf/sBSRq+Q9cLbW6bcG99HSR50H3e/Sx1M=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index:
 AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAH9VwCAAPmtgIAADD+AgAHfkACAAAF1gIAF4LkAgAAXZQCAACuvgIAACpEAgAAKwACAAaaJgIAAHu8AgAEU14A=
Date: Wed, 21 Apr 2021 08:07:08 +0000
Message-ID: <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
References:
 <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
In-Reply-To: <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ab8344c4-0e4d-42bb-bb69-08d9049c837e
x-ms-traffictypediagnostic: AS8PR08MB6135:|AM0PR08MB5153:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB515368B229F6BFDA36E81475FC479@AM0PR08MB5153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VppXGwiwxVTdF69Iovmo0EaOE9ecXODPp/snf30+WZ9pYndY7S1Gr4GHdUz0xiDr043VgkCWpxKgs7m/Ok/4tGk1XPZpYmoIpB9iydYhaUz9PivNMD3jU8SveTANMHN2XBNdmRZiuT/H8iElVpAe/W0CwMuxzck4O1iG7SJ2wjQUj0kKKVy9HC0/YtUFl1z5EjvtwSSsSSFMwMalG6XlScFe3fhemRXEnuNh8PKbxf18i7RDT80tmMs5fUeJYqztXs6j6w0TyUA54kmobPdZg0MLHK+eSU1nrBwchpLTD6KFv/jqBTiWyaQ8/Z9TzFs0c+wV2qQhWEgXi+wkpD6PaLJ4TCLLpHZ1As74zbPK6yD0mh59Y1X30z2M8VRX6GrZfuxofnVsgo65X0lmsfSBxDPIq0x67IRFnPVx5NDvciM1jhLV41ND1KbdEXkWxkDdufm0Jr5iXddTqDVO2X2KNpPJXJxMf0pu59RBJuepzZU2xSw/A+fFIeE+R6YcMeZHEnijzzduDw6QThI6RMVM2O85lY/wQtgIxM8VtmoBwMnQaKkxZjd79rJ+F2ieu2ToEaF2eH0+NMacxRuIMjg7fJm/qXhJWYgb+MWFFkyyyel1HzgCh7rU6xwXGHBq0My6OSK1JTNX6lBh4BlEcR9OO+7qHaMkrdBDsmH/A835vZA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(478600001)(316002)(66446008)(6506007)(2906002)(36756003)(64756008)(86362001)(83380400001)(38100700002)(186003)(66476007)(33656002)(122000001)(2616005)(53546011)(6486002)(66556008)(8676002)(6916009)(7416002)(91956017)(26005)(54906003)(71200400001)(76116006)(6512007)(4326008)(8936002)(5660300002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ejJYUUo3N3NpeCtMb3ArOFNtejZaUldobjVKUU9XQ2loN0xCRnJqYlFqZmly?=
 =?utf-8?B?TzJhcVVSZXlGMkJHNTZTeEc0alQxZ0t1YjN5aFRRUUY5WjBQMkwwcXJhekJH?=
 =?utf-8?B?QnBJN0RXWXdRcGJsM0toSjUwVTdsUURYSGRzUkp4V09QRE9iVDUwRlQvdm10?=
 =?utf-8?B?OGRCdmJYalB4S3lvU01ITzlVQUJ1OGg4UUljSlRCUmZGYURFSFIzeCtiV29C?=
 =?utf-8?B?bFBHWnVmM2dEcWVMcldCb29IVVNoVGQyUjhqZHl5NE4xNlVNK295SnVPcmZo?=
 =?utf-8?B?UTNFcCtpMFc0UWVHNHhsRkNldzVnTkdmLzl0Z240aHpudzVieEcyRmhxYXJx?=
 =?utf-8?B?eUttVjArMHQ3VmtjYnREVStzTWFUMUh4RHhCdTRqZjhVL0JrR1Y4TVhHcTl1?=
 =?utf-8?B?MEFHMVlkaUl6OEdsMVZXajRveXBNbVlpSnpyWWhpOWNncmhBS1BQZHM5bXBh?=
 =?utf-8?B?a2tWUWNYc0V5Qk1pUEphUDgwVUZTMUVuY0ZhMlUwTllGT04zMzY0M0NPaG9M?=
 =?utf-8?B?ZGhYdkgyaTVmbHNYS2tWSVBoQXhCTklucXFEZnRtZTg4ZGhiWXk5TG5WR083?=
 =?utf-8?B?QW9ySlFLci9qVCtxaEJSeTZVdDhjaDV3bklBNndZOTUzYmZqQzBPTzk3MGJZ?=
 =?utf-8?B?UmsxRmJTVCtBelA0R3ZvWXdKSjJDVnlxdTdRZCtDbHRscWQwWjBUUUR5NGZp?=
 =?utf-8?B?MHEyR1N3Qk9QWkUrdGx6MzB3bXdkV0R4UUZpNFA5K1lhRkh1NGNrWE5BOEg4?=
 =?utf-8?B?YWhGanNZczdqRXBUWVlOMzB0cjFrRXdIaVo3ZisyRDhSVTVaYjJLcVBESjgz?=
 =?utf-8?B?SXhIT3JRTjA4S0FOdDB2R3I5a0ZFM1ZTcVh3bDBYbHVyaWs1Q2QyVFBLbVFG?=
 =?utf-8?B?YVZ2RUpGSTV0cThqRlVmU2pJRkxITlp5SmUxZVpJSTE1WkNoWnNoZVlzNWFn?=
 =?utf-8?B?TC96WWNLUjQvZm1jWERiMEtMSmhNMVBNOGxsZ1B5N2lHdEpsVVFNVkhYK1JQ?=
 =?utf-8?B?VnQ4ZU4xRW50N2tUUnBVUzZoS3FlMy9CYjBldzlHL1NKVkZXb1lmSFpPMWRX?=
 =?utf-8?B?dTRkNjhqbHd5NFpOcFlPVUxvTmEwdXk1RXVtTWtFVXE2d05yK3p4U2VEd2Zn?=
 =?utf-8?B?aTlyY1hlam9icVlzNUpaUVV1RjhWV0FsOFkyakRpMVpwSmloS1pqV21tZHBN?=
 =?utf-8?B?YjlZOG4vMis0eE5YdVlFSU0vdjVEc29STDdVQTJCRHdZaC9wY3dITVpheWRh?=
 =?utf-8?B?VkNHam82YmRHZisvUU5QcjAwT0pybVZXSGhKSWNmR3NpcEF1OHphTG5vWEdq?=
 =?utf-8?B?dXpiRDlnSEs0L2lHMWtaRW55VDhNN09yWVgxcEYwNVpZdVZZQUViSnBrRGpm?=
 =?utf-8?B?M1VZWXBRVDg1WTJKcFA1b1U5QUs5SG90RE9QK1R5bGRNd1NsY01DWXNOaFBW?=
 =?utf-8?B?TDNSem5XN2Q1WDd0dkNpc01QeDY5bUhFUEpvdGFJQmRjanQrMjdreUVFMmQ0?=
 =?utf-8?B?MDVtUUtLWDdoMGltRUJMK1BnNkVWcDB3ZGlkQTlHZm5CTW1YeWhUaUQ3cncy?=
 =?utf-8?B?Z29ZNDhTQitNZzBva09VWEF6UGwwN1cyUlVwcVdSZ2IvRnhtUUJvUkcxNzdi?=
 =?utf-8?B?cGhCYzdpbGdxaWkvUW1tdzVhY3o2UTIzMlNTUDJ2ZW8welJXME5WWG1qc3JO?=
 =?utf-8?B?TEV3OWZsWnJIeThmRlN0czlPRHhlV1FVeXp1eFFBV0FuYXpJSFlxUHFsMm9J?=
 =?utf-8?Q?a5XTm201zzkvUOzp1QZu4eR93ntv4uFK1j6+IJQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1653F76D31763C43B1659200C0AA2732@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3803415-2dfc-47b1-1278-08d9049c75a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	59xh/1AiCWQnIQjtV46cWDjGgg2dj1gWv40EyAOomlLKuPsrXYMFB+2S+5qfsSqsy5i/h6kPXt9Ua+sH+gjRFxdnGsbVaa/mZUI+ZLYu3GJtVGQ/UwAxoEeJ7E6d0gEWWmW6s5IFMqj5wmCuCcu+4UfhGE3C2RRkXem9yLQJipwImpzb3jo9p1J5w0UUw9gSRjSOD5pgKIFYtiTnafY7JAsZ3QU59RYYT7F6DRakUyTnHquANFZRb7R82IWtvp++pL9KXDmF/6YMjPDtNmkePONh9I6q/1I4Ki8bagqxXn3ljT7wF/+qgffmxmoR9ol51xd8lOjq3VJRkshNMfPmQCbtEd+2DYehKKBAfO5fMx+bHnIrZUHVP2epzljcdzWt8t6JwiP1/4aEAXLmTHd7CRU+3xwUakPX/GTKT8PsGNCbfUeyQvGtGgvKraqdtkPpxHoP7ktVJuTYN5IlNNzeNBjPcYRtDzUIJN9nXbOTavNfGCAU8zH2kHh2ttwk1uHPfzSXgTFGuc6Uflp50gkE+3p4g4umSb48ySQ3XmgW2akDlTQDnge7bwBRn+uHW/6lFHVeGMRbkbDXkSS8N6X4z0m3jO606mRX2ylXK2HwL6NuVasABlO34QPLddsn6nwDiDP7sBDd4TW1VWmCn16bfDYuVbJOWchANHr+ySv8yRw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(26005)(82310400003)(53546011)(82740400003)(6512007)(54906003)(70586007)(36860700001)(2616005)(336012)(70206006)(6862004)(107886003)(4326008)(316002)(33656002)(8676002)(86362001)(36756003)(186003)(8936002)(5660300002)(83380400001)(81166007)(478600001)(6506007)(356005)(2906002)(6486002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:07:31.5606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8344c4-0e4d-42bb-bb69-08d9049c837e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5153

SGkgSmFuLA0KDQo+IE9uIDIwIEFwciAyMDIxLCBhdCA0OjM2IHBtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAuMDQuMjAyMSAxNTo0NSwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+Pj4gT24gMTkgQXByIDIwMjEsIGF0IDE6MzMgcG0sIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTkuMDQuMjAyMSAxMzo1NCwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgdGhpbmsgbW92ZSB0
aGlzIGNvZGUgaW4geDg2IGlzIGEgbG90IGJldHRlciB0aGFuIA0KPj4+PiAjaWZkZWYgb3Iga2Vl
cCB0aGUgY29kZSBpbiBjb21tb24gY29kZS4NCj4+PiANCj4+PiBXZWxsLCBJIHdvdWxkIHBlcmhh
cHMgYWdyZWUgaWYgaXQgZW5kZWQgdXAgYmVpbmcgI2lmZGVmIENPTkZJR19YODYuDQo+Pj4gSSB3
b3VsZCBwZXJoYXBzIG5vdCBhZ3JlZSBpZiB0aGVyZSB3YXMgYSBuZXcgQ09ORklHXyogd2hpY2gg
b3RoZXINCj4+PiAoZnV0dXJlKSBhcmNoLWVzIGNvdWxkIHNlbGVjdCBpZiBkZXNpcmVkLg0KPj4g
DQo+PiBJIGFncmVlIHdpdGggSnVsaWVuIG1vdmluZyB0aGUgY29kZSB0byB4ODYgZmlsZSBhcyBj
dXJyZW50bHkgaXQgaXMgcmVmZXJlbmNlZCBvbmx5IGluIHg4NiBjb2RlDQo+PiBhbmQgYXMgb2Yg
bm93IHdlIGFyZSBub3Qgc3VyZSBob3cgb3RoZXIgYXJjaGl0ZWN0dXJlIHdpbGwgaW1wbGVtZW50
IHRoZSBJbnRlcnJ1cHQgcmVtYXBwaW5nDQo+PiAodmlhIElPTU1VIG9yIGFueSBvdGhlciBtZWFu
cykuICANCj4+IA0KPj4gTGV0IG1lIGtub3cgaWYgeW91IGFyZSBvayB3aXRoIG1vdmluZyB0aGUg
Y29kZSB0byB4ODYuDQo+IA0KPiBJIGNhbid0IGFuc3dlciB0aGlzIHdpdGggInllcyIgb3IgIm5v
IiB3aXRob3V0IGtub3dpbmcgd2hhdCB0aGUgYWx0ZXJuYXRpdmUNCj4gd291bGQgYmUuIEFzIHNh
aWQsIGlmIHRoZSBhbHRlcm5hdGl2ZSBpcyBDT05GSUdfWDg2ICNpZmRlZi1hcnksIHRoZW4geWVz
Lg0KPiBJZiBhIHNlcGFyYXRlIENPTkZJR18qIGdldHMgaW50cm9kdWNlZCAoYW5kIHNlbGVjdGVk
IGJ5IFg4NiksIHRoZW4gYQ0KPiBzZXBhcmF0ZSBmaWxlIChnZXR0aW5nIGJ1aWx0IG9ubHkgd2hl
biB0aGF0IG5ldyBzZXR0aW5nIGlzIHkpIHdvdWxkIHNlZW0NCj4gYmV0dGVyIHRvIG1lLg0KDQpJ
IGp1c3QgbWFkZSBhIHF1aWNrIHBhdGNoLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYmVsb3cgcGF0
Y2ggaXMgb2suIEkgbW92ZSB0aGUgZGVmaW5pdGlvbiB0byAgInBhc3N0aHJvdWdoL3g4Ni9pb21t
dS5j4oCdIGZpbGUuDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQppbmRleCA3MDUxMzdmOGJlLi4xOTlj
ZTA4NjEyIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCisrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpAQCAtMTMwMywxMyArMTMwMyw2IEBAIHN0
YXRpYyBpbnQgX19pbml0IHNldHVwX2R1bXBfcGNpZGV2cyh2b2lkKQ0KIH0NCiBfX2luaXRjYWxs
KHNldHVwX2R1bXBfcGNpZGV2cyk7DQogDQotaW50IGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2ko
DQotICAgIHN0cnVjdCBtc2lfZGVzYyAqbXNpX2Rlc2MsIHN0cnVjdCBtc2lfbXNnICptc2cpDQot
ew0KLSAgICByZXR1cm4gaW9tbXVfaW50cmVtYXANCi0gICAgICAgICAgID8gaW9tbXVfY2FsbCgm
aW9tbXVfb3BzLCB1cGRhdGVfaXJlX2Zyb21fbXNpLCBtc2lfZGVzYywgbXNnKSA6IDA7DQotfQ0K
LQ0KIHN0YXRpYyBpbnQgaW9tbXVfYWRkX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCiB7
DQogICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkOw0KZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
eDg2L2lvbW11LmMNCmluZGV4IGI5MGJiMzFiZmUuLmNmNTFkZWM1NjQgMTAwNjQ0DQotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gveDg2L2lvbW11LmMNCkBAIC0zNDAsNiArMzQwLDEzIEBAIGJvb2wgYXJjaF9pb21t
dV91c2VfcGVybWl0dGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQogICAgICAgICAgICAgbGlr
ZWx5KCFwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkpOw0KIH0NCiANCitpbnQg
aW9tbXVfdXBkYXRlX2lyZV9mcm9tX21zaSgNCisgICAgc3RydWN0IG1zaV9kZXNjICptc2lfZGVz
Yywgc3RydWN0IG1zaV9tc2cgKm1zZykNCit7DQorICAgIHJldHVybiBpb21tdV9pbnRyZW1hcA0K
KyAgICAgICAgICAgPyBpb21tdV9jYWxsKCZpb21tdV9vcHMsIHVwZGF0ZV9pcmVfZnJvbV9tc2ks
IG1zaV9kZXNjLCBtc2cpIDogMDsNCit9DQorDQogLyoNCiAgKiBMb2NhbCB2YXJpYWJsZXM6DQog
ICogbW9kZTogQw0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oIGIveGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmgNCmluZGV4IGVhMGNkMGYxYTIuLmJkNDJkODdiNzIgMTAwNjQ0DQot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgNCkBAIC0yNDMsNyArMjQzLDYgQEAgc3RydWN0IGlvbW11X29wcyB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTggZGV2Zm4sIGRldmljZV90ICpkZXYpOw0KICNpZmRlZiBDT05GSUdf
SEFTX1BDSQ0KICAgICBpbnQgKCpnZXRfZGV2aWNlX2dyb3VwX2lkKSh1MTYgc2VnLCB1OCBidXMs
IHU4IGRldmZuKTsNCi0gICAgaW50ICgqdXBkYXRlX2lyZV9mcm9tX21zaSkoc3RydWN0IG1zaV9k
ZXNjICptc2lfZGVzYywgc3RydWN0IG1zaV9tc2cgKm1zZyk7DQogI2VuZGlmIC8qIEhBU19QQ0kg
Ki8NCiANCiAgICAgdm9pZCAoKnRlYXJkb3duKShzdHJ1Y3QgZG9tYWluICpkKTsNCkBAIC0yNzIs
NiArMjcxLDcgQEAgc3RydWN0IGlvbW11X29wcyB7DQogICAgIGludCAoKmFkanVzdF9pcnFfYWZm
aW5pdGllcykodm9pZCk7DQogICAgIHZvaWQgKCpzeW5jX2NhY2hlKShjb25zdCB2b2lkICphZGRy
LCB1bnNpZ25lZCBpbnQgc2l6ZSk7DQogICAgIHZvaWQgKCpjbGVhcl9yb290X3BndGFibGUpKHN0
cnVjdCBkb21haW4gKmQpOw0KKyAgICBpbnQgKCp1cGRhdGVfaXJlX2Zyb21fbXNpKShzdHJ1Y3Qg
bXNpX2Rlc2MgKm1zaV9kZXNjLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKTsNCiAjZW5kaWYgLyogQ09O
RklHX1g4NiAqLw0KIA0KICAgICBpbnQgX19tdXN0X2NoZWNrICgqc3VzcGVuZCkodm9pZCkNCg0K
UmVnYXJkcywNClJhaHVsDQo+IA0KPiBKYW4NCg0K

