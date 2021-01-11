Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7A2F1DE9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 19:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65332.115738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1pQ-0002tr-GW; Mon, 11 Jan 2021 18:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65332.115738; Mon, 11 Jan 2021 18:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1pQ-0002tS-CW; Mon, 11 Jan 2021 18:22:08 +0000
Received: by outflank-mailman (input) for mailman id 65332;
 Mon, 11 Jan 2021 18:22:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6qt=GO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kz1pO-0002tN-1d
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 18:22:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cca74972-02c6-4500-bf4f-d1b797072c1d;
 Mon, 11 Jan 2021 18:22:04 +0000 (UTC)
Received: from AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) by AM0PR08MB4467.eurprd08.prod.outlook.com
 (2603:10a6:208:138::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 18:22:03 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::74) by AM5PR0301CA0031.outlook.office365.com
 (2603:10a6:206:14::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 18:22:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 18:22:02 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Mon, 11 Jan 2021 18:22:01 +0000
Received: from 32014a942c64.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7465C3F-E4F2-486C-9B0D-E5926E2F1669.1; 
 Mon, 11 Jan 2021 18:21:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32014a942c64.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jan 2021 18:21:56 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 18:21:54 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 18:21:54 +0000
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
X-Inumbo-ID: cca74972-02c6-4500-bf4f-d1b797072c1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGpQK1eJfLKCk1OsdnT7f1HqRakzbIfZ3u3RmYxIJCE=;
 b=0e2ZwIpFuhVJZLgv/rQqAeCZhBv93QbHgHrke5dUmf4uFd/1YL6lb7FMGqLcBCirSIOmIAAKdndhDWMFlpdW1LDZw9D/daawyqS0CURB/hKpyc5YobHwDmDGv2EWpQJHqHiQWHUF9+Sr5YvJFvBNRt1jXDshdaq+t4Y2dtsPV3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 096c665978f9e0cc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS6wMcp+DDw1GAEWFUwkabPvGFseXoRiOiiLLFeT3a61KgxDSLt4C1gbTZiI5SnALJ26XmgxU3/58Ey7ZfuvYJFjrPMxfZD/L+alMZ0XvxH0CG4wl5qapogIRfPD39TQZqbex4Er51lr6leuihfQENsD1Oewnhm8OmEGI/dKAYD6j9jpHVPg1bS9acwxLCD6FRN4X+ZnCs22ku8Wy0f4OgEowbqCNzOtq1sIvGnAvSGOi5ZBixyBo8HYgl8UnNuTqnku/m7ZQ6wYzzcycI5i4x8lvdzGPAQMlxSwkxxQgN6iSQPipbiQBjJXSlllJbG9Q7DiWRk7NqGQqcqddDlMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGpQK1eJfLKCk1OsdnT7f1HqRakzbIfZ3u3RmYxIJCE=;
 b=MHlPTOMzApfa7VRkoKqW0iwgwRxrSna8+JXqz1Ye0eIR6tgRziB0GOZaEbjXLpW8n72B4dyVQH6Ss7uxFftx7fRDcsih+iHTHJWV6vzRl+z/YYsLaNwIAY0EZFP4Abt1ItscPczZyS5qCzvOL9+VagTEgLQUKQ1XRVgQWPA5+XjPEc69Zt5oj0rn9lN476sMFeueLmj+GAqfCHr31iVZAyXVE5gLvzFx5FpyfiOm+lak439Jx4+p73NbCP39nDEUECWeqGzSPKy+aYowknMr0f+DCN9YK0n9YgZJnJKRFJgEVYPSQ56eCGrzvOPCr2lym4kkW0+FmG+Yn0zrWpm+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGpQK1eJfLKCk1OsdnT7f1HqRakzbIfZ3u3RmYxIJCE=;
 b=0e2ZwIpFuhVJZLgv/rQqAeCZhBv93QbHgHrke5dUmf4uFd/1YL6lb7FMGqLcBCirSIOmIAAKdndhDWMFlpdW1LDZw9D/daawyqS0CURB/hKpyc5YobHwDmDGv2EWpQJHqHiQWHUF9+Sr5YvJFvBNRt1jXDshdaq+t4Y2dtsPV3M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Topic: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Index: AQHW5fO/cBZB5l3jZkmpNH6hbDKrc6oiIY2AgAAasgCAAIUfgA==
Date: Mon, 11 Jan 2021 18:21:54 +0000
Message-ID: <F715A994-7B47-4171-84F8-5BE912985784@arm.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
 <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
 <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
In-Reply-To: <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6e6bd19-f98b-4fad-cb28-08d8b65dcad8
x-ms-traffictypediagnostic: VI1PR08MB3471:|AM0PR08MB4467:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4467AA633885E0D02772C3169DAB0@AM0PR08MB4467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eEy+88RtaCNa0hixhkcA8WVP+NSn4tA13ttt3ydiRef5n8eAfRb9wdNEgfNORX7z0Ks4P8bUnZh+Uya9TELoPjZ7TEiejhg84fbHXaKznrwowExyttN3Foh3WE8W7lU5L5Q0Cj26sLMlrNVxGSGlT7YckL5jFHYQSn+HWHyJFuIYrgTDReM9a1OIExRO5grr/SYmtvXgzEQ+vuUDTsLX3ZDnH2vz+ITewmqKtcGNAShlSPmYG/4qZxlGGa+/FTJbInUr6AIZ6lDIuQ+zuLoZtkrBHguiswitfZFN4OanBpF4oh6IXOM78CPZT/4+hgs00lGnEbRqQY//hyTY58jykC9zyWwT2TuT9y/Km7jMDxo79LE2Ttp7abpNScqWr9Wdb+2Sh/QSh8JurYfO9g69XwzcdvpQPtBmukxci0UfWWps+glSEoZa9E+iXJa14naWUMkmD1hnLNSBSe/0uNbzKV5lTcY6+/JPZ67tG8zPy+nPfK9E+uAEUJxCJ4PvaCx9zTlaKFWyAmL04zRbRudoKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(64756008)(6512007)(83380400001)(66446008)(4326008)(966005)(8936002)(54906003)(66946007)(36756003)(316002)(71200400001)(478600001)(66556008)(76116006)(6916009)(91956017)(66476007)(86362001)(8676002)(2906002)(55236004)(5660300002)(6486002)(26005)(186003)(6506007)(33656002)(53546011)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?7U3LTyjkEU77MvKE10MbSyCQ+Am4r3RxnjctdmPZEtvtA7MathX7YsWn/sqP?=
 =?us-ascii?Q?+gMqyFXv+PElDi5B6ZUV2wsOYMtrDWreHghXq9lp6wlpOOLXnUPizyye7Hbi?=
 =?us-ascii?Q?gHfq0ms5d3kHp6F4kzk6J3RJAuciClEERgTRvwC7R7xtMXWmM9VpCLSlmR6h?=
 =?us-ascii?Q?NFu2Rk8YXyD48db1b4hu+Spdq+R7erBLdoEr2DOaDmhCoZ2q5TpjMfhSDO2s?=
 =?us-ascii?Q?wwxAuOBskU2lnumUNS4fWVRh9vg+XjAA/kUJiKQMSRItKIDuQKqwFbBdSbuP?=
 =?us-ascii?Q?T+wQ91Owvjhhh6NS3cBVi2BQc9wrEDBiwN7H2yi90SXU+/lmssucX/U0HPPN?=
 =?us-ascii?Q?dZi/VFN1e5dCznuCrJa5D8egEbDO45gfz8Lt6uBMdDbTnMotJLkkGDA3AedR?=
 =?us-ascii?Q?QKYpMrvkcnmINsuBRPd92ma6D1sXdMrZXbISgKK1S2fEaxo8pN2C4oZRv5VF?=
 =?us-ascii?Q?viNMGiKO29vQKii0JxEJbaoEW7mJOnoQTDrQQZu2YUUOLkIXfrX8FSG2HUWd?=
 =?us-ascii?Q?izgfUdwBHlL0OZZx3UJt6X2u8OfLMRjLnMvKjSnVmo2xYToqplbeQU6UlL7R?=
 =?us-ascii?Q?eYm3NUNNRp2XxRPWaff+q0bTPnun6qZQsRadsAcEg8dmv/wOyxdkorEFRNj1?=
 =?us-ascii?Q?O8k57WfYMUyic+2oqE6ikBrAShRWKnYgHYpSIC3vFDFPl0qlE4rkPz97Acrp?=
 =?us-ascii?Q?ndXLHSlc7wL3ElAnfLZXcf0H/rxgqZ4PygJ9eF2HK/eR+hJASHbGE9KXxEnq?=
 =?us-ascii?Q?CWJnJQoHaQnpoY9Sv1mACMTW6fdPzhCW9UtPP0Nh1HxvRjIHOAyHESiW5VWJ?=
 =?us-ascii?Q?FBtYqCVil7ArIefH8ma2wt9iws0x9jNH2Hsxg49JMvFAlGGgBA8tTiwe5J+R?=
 =?us-ascii?Q?QqKKCEXAnZt2eU+KbVrayHSiI5Ii+79Hyfk31EqFjMb7eInZDNhra0xPRU1s?=
 =?us-ascii?Q?2blVgyv25pi85aGHS7v5nJKwJ1QizBdlLzJzq+fPAFCV0bcZWuG3Fh8aeyPe?=
 =?us-ascii?Q?/hTz?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBB886813F28C7449CA017F29291798F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e150f60e-89ab-4e01-3326-08d8b65dc621
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x438ZLfc8g6sziF9QQTkBT8U41FKZzJSLvkENxzsXIlZ8AqSp4xdEhAuHNMf+JH1k/C3jHlVnA6HLodLqFJxskztAhWLqz9b4GLZgNAYL5bIF3nsLxWIaGZEtn37/hMi48xUNu/nF5PNJKH0GOdJTCL8mrmqK6s6KHtd3KAi9WmqAs82ZN2PTorNUAn7CLb6y6e/k+O5jfNJOkc1eGZ1oCL+tVr92qtMfk1L7iSMt7CfYjxLnyTayPlJXNizZ0DJeEq1rtERDYqkuBa9jyzn6R1ujrKBs1799pT1DVJD2ZcOacqpP/5lha5n55FO/ZY0SlDtBilQn8JwSsrBlNLLNDyEjHUNdQzup2tJaDjvhR+sInjRT7btwPk3fGXUnU+letYzBL+0SUz+BsFJWSosUs6Uh9ypcFJxPxLnzX/5Du1NBBUWtSg9Ly2Lgzr3BEGnnI+8vtPoxprP5nsRVKNOnkKz9HHcbOqaqgZA6bL+8c+EQ7J6Oxp+S+ZAfmBY0KTEdq0QtaEjHXt+FBL8Sp5Nx7r/BqRcaUe0awshV0GbFhsbaJ2V3IVwaVb3DIu5u/J8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36756003)(82740400003)(54906003)(53546011)(6506007)(55236004)(8676002)(2906002)(316002)(336012)(6862004)(2616005)(47076005)(966005)(478600001)(86362001)(70206006)(356005)(8936002)(5660300002)(70586007)(6486002)(6512007)(83380400001)(34020700004)(82310400003)(33656002)(26005)(4326008)(81166007)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 18:22:02.3704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e6bd19-f98b-4fad-cb28-08d8b65dcad8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4467

Hi Julien,

Sorry for the delay but I was on holiday until today.

> On 11 Jan 2021, at 10:25, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 11/01/2021 08:49, Jan Beulich wrote:
>> On 08.01.2021 20:22, Stefano Stabellini wrote:
>>> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
>>> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
>>>=20
>>> Avoid the issue by doing the following:
>>>=20
>>> - define MVFR2_MAYBE_UNDEFINED on arm32
>>> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
>>> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
>>>   guest read to the register returns '0' instead of crashing the guest.
>>>=20
>>> '0' is an appropriate value to return to the guest because it is define=
d
>>> as "no support for miscellaneous features".
>>>=20
>>> Aarch64 Xen is not affected by this patch.
>> But it looks to also be affected by ...
>=20
> AFAICT, the smoke test passed on Laxton0 (AMD Seattle) [1] over the week-=
end.
>=20
>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
>> ... this, faulting (according to osstest logs) early during boot on
>=20
> The xen-unstable flight [2] ran on Rochester0 (Cavium Thunder-X). So this=
 has something to do with the platform.
>=20
> The main difference is AMD Seattle supports AArch32 while Cavium Thunder-=
X doesn't.
>=20
>> 000000000025D314	mrs	x1, id_pfr2_el1
> This register contains information for the AArch32 state.
>=20
> AFAICT, the Arm Arm back to at least ARM DDI 0487A.j (published in 2016) =
described the encoding as Read-Only. So I am not sure why we receive an UND=
EF here, the more it looks like ID_PFR{0, 1}_EL1 were correctly accessed.
>=20
> Andre, Bertrand, do you have any clue?

I will double check this but my understanding when I checked this was that =
it would be possible to read with an unknown value but should not generate =
an UNDEF.

>=20
> However, most of the AArch32 ID registers are UNKNOWN on platform not imp=
lementing AArch32. So we may want to conditionally skip the access to AArch=
32 state.

We could skip aarch32 registers on platforms not supporting aarch32 but we =
will still have to provide values to a guest trying to access them so might=
 be better to return what is returned by the hardware.
Now if some platforms are generating an UNDEF we need to understand in what=
 cases and behave the same way for the guest.

Do i understand it right that on Cavium which has no aarch32 support the ac=
cess is generating an UNDEF ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-ar=
m64-xl-xsm/info.html
>=20
>> Jan
>=20
> [1]
>=20
>=20
> --=20
> Julien Grall


