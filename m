Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D13644272
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454761.712308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WSS-0006pC-2o; Tue, 06 Dec 2022 11:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454761.712308; Tue, 06 Dec 2022 11:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WSR-0006mN-W9; Tue, 06 Dec 2022 11:49:55 +0000
Received: by outflank-mailman (input) for mailman id 454761;
 Tue, 06 Dec 2022 11:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZfYr=4E=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2WSQ-0006mH-6k
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:49:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1760d173-755c-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:49:51 +0100 (CET)
Received: from DB9PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:10:1d9::10)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:49:40 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::1) by DB9PR02CA0005.outlook.office365.com
 (2603:10a6:10:1d9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Tue, 6 Dec 2022 11:49:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Tue, 6 Dec 2022 11:49:39 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Tue, 06 Dec 2022 11:49:39 +0000
Received: from b98325164b99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5ADFF7E-29C6-40F2-BF9B-F52933D67648.1; 
 Tue, 06 Dec 2022 11:49:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b98325164b99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Dec 2022 11:49:31 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB8083.eurprd08.prod.outlook.com (2603:10a6:150:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 6 Dec
 2022 11:49:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:49:26 +0000
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
X-Inumbo-ID: 1760d173-755c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6+jHMFw/gB8nLK3z+xYtUntAvpnbHMSCLei1hpOzfk=;
 b=CEKzoLgzsVQIaU/9ZE5OgMm3fL4XqJGdf3U8X71QnWtF1RNhKGQVaI5JktQMLKok9f03kX1UxdrOO5SHv0SqxBkcoqj981je3v+49UmUiaUra1Wu1CXfZrYMCfjRjG55m6ENmhVOLJugP2vS1NEfTLczB678NwcLVCaXKqNi+ZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30c6bf89309ca8d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0VzPBbIKvcQZGKgCFt/DqfxB0XQ2IqyrFE+n3khf/i8mqSzMReM4BhGGIL5Isw8Sc/0qbGy8kalHqylcQMIb7a2APUj83WeaBO0Bg0vQNhCCCnH3tW9Qk/Pt29+EcpZI8hU1faSifOYcP2IhJCsojTHL3Of57AqdWt01RCduLVjnpTda/drKK9yY4/juOExbW9c89ZvfFQpphTXyAMu1+0vSTaGcSjmGPf8E/aPrVvVt/SpZCiaTSxJAo1E23FrndXhcqhtniIQiZvcDcPKF8Hy3GdF50qz4yEZhB2E9AnwWpKfEtWg4fHhAXl1FVYcVd+CH/PCdPNW+c4LjVn+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6+jHMFw/gB8nLK3z+xYtUntAvpnbHMSCLei1hpOzfk=;
 b=NrhssJMkVbXEDFEVIMSQkDF3Pr64Y6NhYRpQ16lyfkmyTA9sMSj9PphkfwaOGSq2Uu0QnHUK45GLi70uRLwuwUxuxi0BYNQ4Onxy8qClegFWeQv2jP1doQiLTXa7ZB6qzRHJxBSHFzPME+cNrFpqouuxOnPO3U3AJaB1YUkys7N51QLoEtju43GsdLEC9RYSAv1AMFIszLlXI7iewECgBSo8USAmjq6xhEqD5oK8M9rrWUdaB5IHsB7Pc2lkjYXXR/yUGoskj0oB8O6Zy9XOyt9oahQil5B2YT6j5kcnU/2pXvouUI4OlINnh8915lm25VZVYLuonNVQdv7wjfU1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6+jHMFw/gB8nLK3z+xYtUntAvpnbHMSCLei1hpOzfk=;
 b=CEKzoLgzsVQIaU/9ZE5OgMm3fL4XqJGdf3U8X71QnWtF1RNhKGQVaI5JktQMLKok9f03kX1UxdrOO5SHv0SqxBkcoqj981je3v+49UmUiaUra1Wu1CXfZrYMCfjRjG55m6ENmhVOLJugP2vS1NEfTLczB678NwcLVCaXKqNi+ZU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Topic: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Index: AQHZBZ5+Ng+vzjZ4EEiQHhlU/SEGMa5cu/uAgAMd/ICAAOxSAA==
Date: Tue, 6 Dec 2022 11:49:25 +0000
Message-ID: <5EFEFA00-945E-4797-B5B3-264788B890A0@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <849cf3a4-e7b2-f555-d759-978170088a54@xen.org>
 <alpine.DEB.2.22.394.2212051342490.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2212051342490.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV1PR08MB8083:EE_|DBAEUR03FT014:EE_|PA4PR08MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 48cc5f60-98e6-4b68-5860-08dad77ff4b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pOYDNIbhGbXSFtmrDeSj2/85nfgyLIfeQTVLhVv6YCCtlXiSkXEpC4oxgHlnnAgaQAgQahvwOjMl4zQNnOabMbFV+6zdKU5JEQg/0PgBbtYIBFunL+/EbqB4UDQYt0cBpT2ih8gHHRndZZOWKr9z6ekzl8dJsGbmHiWjBTkwHSRKwRfFduWpgWb5sfNLynkGjVi+XyO7bBM0ZLN7Q0XVsrvSX6hxjfPslMFzT1QNb/sXIFz4z5Y5eksKZAoAT8wJuGeEsOtVjh+7RutlrDhMs6PsZCyuKHLAFHXPRWhbj4khBKSqkqeUUCoONvN1OGzWfnB02ZFsoO3YClBxP0sNn0oMoTfy0syODOeZ9Oo7nCwrgu7p9bPtt4P7VRSP9C7Foba6AQXDIps7itslpr37YcWU4Ohz9q7KKrxiBcZv567MOHgLDNSvmxM2aAnPQDFhEl9P3F9Kev8uRMWJ81zMEIQLVZNWSU6wqs/kKtJreJUlT4QewHw8M84qtJrj8r+oxu7vPg+V0SbOPOZS4cG1JR6tn1iAUrFZcDg6lA+FodZ4aC5SO1IaiS7L408oW1wSShYqmcR8/AHvTKhtDxLoYnXW409VxuzQDTfZ6Hl27nAUdgqZGORH9fVmdzzl8DNmTNbBiJx03Rjkld+S57c8QBfYFuxfdTzCPdDtGR+xxgO5mZ1Og3jywH75SkTE64Db+6McxARBcjOEe5WhTCfX+igaJsH1Nm/H6IdTrmaLyKE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(2616005)(66446008)(64756008)(2906002)(66946007)(66476007)(8676002)(66556008)(6486002)(186003)(4326008)(316002)(33656002)(122000001)(38100700002)(83380400001)(6916009)(38070700005)(54906003)(8936002)(7416002)(36756003)(91956017)(41300700001)(5660300002)(26005)(86362001)(76116006)(478600001)(6512007)(6506007)(71200400001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AC6EFB812266284DBBB24D3A4D0633AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d05a3669-c78a-47f6-a624-08dad77fec58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xMq29vM/zY288gP7B6VRo8GlC2QcgCCz0BU0ypwE8Ea49G7Xfxb0BsYzz+s6g4+D5fIfnaI6t9SgDPS70fU5ZQSMBhxwhlOyutvdbPAAPgLBul713LOqlR1Oms4wu/lG5xhsSgmghd02tIbaqCkoE12KQSwV2v2OSX04hH0SpRKLjAZMs3iSUO74I020B3bhbuAtlotah1E03CaSeXoPo3x9s+RslKzInMAelgto0pI+feelt0/RS+bIzVdYQ+22jmP+QfRxwL2JX0DpmbhTueZljaKNgcmDwRsqqVc36eQhNa7Dt3lCnzPNr2yQT9U9O/ROZkpuaefhSxEyhMCJRHghr3NsXJ03KCMI5lbsIEVh/4ZGKRaJNXhGJtvWyWGbhtQ2G69odVH9SLAju1/yi+hxocYttx97J8VnNlKMv+LftGtkMsE629/XEKFpwS77f9SziIQ5fmEhhaef/Mu+vJ4f6a8WVmNqK6jU86VusIpii8BXiSPM85OggCysnB+5uB+nLRNouyK6733cvy1XsSjkNKL8HvTCFqYELwTLOchlzL3Wkl12NJeZl9WijPGkVNqIVkcAvLM5IKGu/Tym7hNDLs/nNwVWSRCQj+GEPZoePhHvjEErzQA30Pzf8Hd/nnd4KRBNoOYRsaYJANKA3Xbaudj8Yiti3iEZKwb/XI/LHiZ5u7g1nj6vLj1PLTahR7JKapapfAzbh13eBb038A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(4326008)(70586007)(70206006)(40480700001)(8676002)(41300700001)(6862004)(86362001)(54906003)(316002)(356005)(81166007)(36860700001)(26005)(6512007)(2616005)(82740400003)(6506007)(2906002)(6486002)(47076005)(33656002)(40460700003)(8936002)(478600001)(83380400001)(5660300002)(53546011)(36756003)(107886003)(186003)(82310400005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:49:39.2952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cc5f60-98e6-4b68-5860-08dad77ff4b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271

Hi Stefano,Julien

> On 5 Dec 2022, at 9:43 pm, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Sat, 3 Dec 2022, Julien Grall wrote:
>> On 01/12/2022 16:02, Rahul Singh wrote:
>>> This patch series is sent as RFC to get the initial feedback from the
>>> community. This patch series consists of 21 patches which is a big numb=
er
>>> for
>>> the reviewer to review the patches but to understand the feature end-to=
-end
>>> we
>>> thought of sending this as a big series. Once we will get initial feedb=
ack,
>>> we
>>> will divide the series into a small number of patches for review.
>>=20
>> From the cover letter, it is not clear to me what sort of input you are
>> expecting for the RFC. Is this about the design itself?
>>=20
>> If so, I think it would be more helpful to write an high level document =
on how
>> you plan to emulate the vIOMMU in Xen. So there is one place to
>> read/agree/verify rather than trying to collate all the information from=
 the
>> 20+ patches.
>>=20
>> Briefly skimming through I think the main things that need to be address=
ed in
>> order of priority:
>>  - How to secure the vIOMMU
>>  - 1 vs multiple vIOMMU
>>=20
>> The questions are very similar to the vITS because the SMMUv3 is based o=
n a
>> queue. And given you are selling this feature as a security one, I don't=
 think
>> we can go forward with the review without any understanding/agreement on=
 what
>> needs to be implemented in order to have a safe/secure vIOMMU.
>=20
> I think we are all aligned here, but let me try to clarify further.
>=20
> As the vIOMMU is exposed to the guest, and exposing a queue-based
> interface to the guest is not simple, it would be good to clarify in a
> document the following points:
>=20
> - how is the queue exposed to the guest
> - how are guest-inputs sanitized
> - how do the virtual queue resources map to the physical queue
>  resources
> - lifecycle of the resource mappings
> - any memory allocations triggered by guest actions and their lifecycle
>=20
> It is difficult to extrapole these details from 21 patches. Having these
> key detailed written down in the 0/21 email would greatly help with the
> review. It would make the review go a lot faster.

Ack. I will send the design docs by next week that will include all the req=
uested
information.

Regards.
Rahul



