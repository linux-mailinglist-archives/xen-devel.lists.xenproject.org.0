Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FF500ED4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304760.519496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezNJ-0002Cg-Qp; Thu, 14 Apr 2022 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304760.519496; Thu, 14 Apr 2022 13:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezNJ-0002Ac-Nx; Thu, 14 Apr 2022 13:19:05 +0000
Received: by outflank-mailman (input) for mailman id 304760;
 Thu, 14 Apr 2022 13:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNLD=UY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nezNH-0002AW-Bi
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:19:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a2f390e-bbf5-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 15:18:52 +0200 (CEST)
Received: from AM5P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::33)
 by VI1PR0801MB1773.eurprd08.prod.outlook.com (2603:10a6:800:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:18:41 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::f1) by AM5P194CA0023.outlook.office365.com
 (2603:10a6:203:8f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Thu, 14 Apr 2022 13:18:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 13:18:41 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 14 Apr 2022 13:18:40 +0000
Received: from 50866bb17fc4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE362ABC-E18F-42D3-9F4A-1533A044DBAF.1; 
 Thu, 14 Apr 2022 13:18:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50866bb17fc4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Apr 2022 13:18:34 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Thu, 14 Apr
 2022 13:18:30 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:18:30 +0000
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
X-Inumbo-ID: 6a2f390e-bbf5-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygycZQNB6jKUTy5lFMUwvzRm8/tVyCQEmLeBeAetm4=;
 b=lkMA429Zez6f9P5HkN9xSd2VM6QBdgFM1TDDYfEbej2w+oTj6xhsPtPqST5DHYNV9f3Zkf0VwZu5ds07J9a8bwB51cVmxuJRZ3N2zj0ARuiNFHm7vMl1K8Pg3S1yoPTmH6eEHjXU8C8ifwSObQGAm55TFVKV1i7D8itzqWrXxcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e14f8990e6422d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoEyzkBp4z/+oho6XpY0RI/pxun9frYaAfxoCZ3FGm/3mvHnj2gb2Y+APFBGG6UCjw3+2dUvKx7rJlXKlb5EFiIX1VkyLZZ2UQ901PHGXry2YHS30LtCXZF62FKEHBM5DQi4RX5v1gkoNP3P1W7psPix80T37DIagIB0rknqiaMhH0QIoFxeR0gWmoRv3dQvUrovqX3YCU/MbIimH9hDnNqDY4i5nDuvnI1B22qO1CGcffkysmpg41o8k3HJK1iqe823c4Z09VjKH0tcSyxZH8BeW/WUoNN3JvYCHXtf6n+76rhQf2DuPNFplhJ4jKEtOi0TE16NI6kAIFierccOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fygycZQNB6jKUTy5lFMUwvzRm8/tVyCQEmLeBeAetm4=;
 b=Q62S5o/KfrjR5yQPHhstrTpGgg2FRPXLYqZub/NqID0B71Slu7OllMWqv2LfJDVxSrcFS60Y0e1UWobfehHoShpTrBIoDhSRnrs0nMPk3x12fYFppEkj1RGbLNHSJ8h/sGFWP9uInE1076Vby3rVKwNmkXwn7Q24QW/J0jtiqID/E8BrRv3vxPMWsuDTzhObzAfFGJGb6CasDso75Aw7FP1fvXBg3v+K6N9TfxF5FyYdXdNu3cFJEyljZkZbz8Hl2MIcAT43q1I2/0+LMNbRIXOMPNW7Yd9lnfetdwaOdm6l8OvG5C9hgHqggMhbXvskesNXlt4atGle6YwgvOIFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygycZQNB6jKUTy5lFMUwvzRm8/tVyCQEmLeBeAetm4=;
 b=lkMA429Zez6f9P5HkN9xSd2VM6QBdgFM1TDDYfEbej2w+oTj6xhsPtPqST5DHYNV9f3Zkf0VwZu5ds07J9a8bwB51cVmxuJRZ3N2zj0ARuiNFHm7vMl1K8Pg3S1yoPTmH6eEHjXU8C8ifwSObQGAm55TFVKV1i7D8itzqWrXxcg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9JkZghYSHXUuV0Y0fm4T+9azm3KwAgAAMjACAA7tTAIAEF8gAgADKVoA=
Date: Thu, 14 Apr 2022 13:18:30 +0000
Message-ID: <BA690DF6-577C-44CD-BB01-2E8B2FCFEFC6@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2204081837410.3066615@ubuntu-linux-20-04-desktop>
 <D24074F6-E6CF-440A-9E9B-A10783C273D7@arm.com>
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b841157a-b698-4559-50b8-08da1e194b40
x-ms-traffictypediagnostic:
	GV2PR08MB8076:EE_|AM5EUR03FT047:EE_|VI1PR0801MB1773:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1773817FB453325195D5E0289DEF9@VI1PR0801MB1773.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PDW8sIP0VYkcPVWQIXZcCONjwArqhYHNomcHTEKXAegN8CsibI9xH4E/48XI/d7ujtHB5jFvr6KRw3mRIVvs4I9m4VrsGKb6WCPZA0WT5fwm6SbX+SnzbnjT9xTIi2vJXGNOUeUlQ8b4PgsYwDMkK848CMoGXlepDjiszwSD4/19Ykjqo4rnwUBG+bk6YQsis8JNGjk0ZjyCzcCKFkXLDRyqXIElOGPN9RB1pPcjn+rOO91em5riFS0vxSK34ZpxX3/qxww6VKb37PIZlzFjeWdW9m7BEDl+yOoQOsAp/t9EKcvgILESQHEgWH7/Mo16OoIdUq+73LzXT4cnttnFiu+PAfHDUuRE5J/bn5/Ui56X8OlSCHVVECt22yzSY9aOq7zIEgoDYrKwKsHen7f4U97TpdxcajgP1GP0ums1pehEq+dRpXfHJ4OkeM2x9J2QQN/F6XqLUmhQITO0y29A0gx15yhW9yQ6Gr3YQ4KmUYFsXTXs5bb+cZB3pTkJNYD7era2KdaM/pBzDPIEZlqbgJa1W42Id3N5JBOHc4iFSnjBWWiJbbWLDz8Saa90q+d6eJO9ApbM/OaSr74bArNNSJWsbluD4Rjo9oVIjnrAZkkA4lo1u53N4c1DewNRSmd+Pu5We/OklCWwv2hdWVMsL81iu4aivOfaztlGpKETVA4iUH6ChfHoOZR7+aKT/NAjBSxAdGDaJyqdzB+/SfevUN+LOkRqLXHYZeuT6MRPQcbC+11p67Ow4iCqBaTnswVomPW3m3IYstQpiJLWA1XojuNKpTjxTCLxDLgf5MfAXZDLYNKVnCKxJMGh16/I5EfHLAoG87+G6HnVaeIjvwBCNQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(186003)(66946007)(122000001)(2906002)(36756003)(38100700002)(6512007)(38070700005)(966005)(2616005)(71200400001)(8936002)(26005)(6486002)(508600001)(66446008)(6506007)(66556008)(86362001)(33656002)(8676002)(76116006)(5660300002)(316002)(4326008)(91956017)(83380400001)(66476007)(54906003)(6916009)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8C6CD1DB6F8E34EAF8746268E000D1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e49470f4-f224-4c3b-0e49-08da1e1944d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Am9wku8b8qkyektngoUBnIwuXBstI3ebLdwsXYXRqaLgtAXECWIWZwGQv3BxVj05FKW2T68Tb2ulnSjplpgyfKh6s3YF0dNKwWJyue+8VVNrj9iMKP53GCr1RedkjyblznHPWdNklKNUcLbq+GYIs7nUbSG5d3soooJ/AJ3F9OL2dfLnYEDuU1WWyYyQ4OfMSqYFoA7iEIIhbIdaYqJVm+rrVNvi4dZ59EH+fs3jbcn08prj6oXUAYriGhr5j7LUFGhAF1243J47j7LJYbUkEwDk9j+piMk6uu6EQtIkE3LEuEbiYiQ5PS60NoOutRS1I3pkSOX2lToxabYN001HRp8MGcoj//0j04rTocJpTtESnPAM2wLy9qh4CZ/AwiRvFt8j38O9oF1aMNfLZ8VVl6yIckO9NaZY7FW021ZWCtrEqeZxj6eRUrX1AM2X7W24J18vrF3eJiRK0xAoecIc6Zt2E1sNNWYKRGzDQHldcLBKpLmzn/rSfHlXvY+FCF3v7FqJJn4NsFeOar62Y67Rz9FIT5q6fbVl06n5jcdb1H3KHm5fszax6az+6Zg0zsz4yCyzDgbxrBlrmaRKL5uTZKTB3IsxbmdljPKgz77quIv6+harUSOmO4jUm7zIw8muA2JkEH5T+N4euUubgQTJm1OAX3JErLYcJXUh2iAIqXCjwhKdt3N2PbLp+8yXbj6kbPbT6pYri2E1WLDodZhS9mqpl2euZBQkbyk8a8po86wyuv3qdza6ou6YiaF8Md35rZbmKl7Zsp3ZlpQ+emuBLw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(53546011)(33656002)(6512007)(5660300002)(54906003)(26005)(186003)(36860700001)(47076005)(2616005)(336012)(81166007)(6506007)(83380400001)(86362001)(82310400005)(6486002)(966005)(36756003)(40460700003)(6862004)(70206006)(70586007)(4326008)(8676002)(508600001)(2906002)(316002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:18:41.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b841157a-b698-4559-50b8-08da1e194b40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1773

Hi Stefano,

> On 14 Apr 2022, at 02:14, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 11 Apr 2022, Bertrand Marquis wrote:
>> What you mention here is actually combining 2 different solutions inside
>> Xen to build a custom communication solution.
>> My assumption here is that the user will actually create the device tree
>> nodes he wants to do that and we should not create guest node entries
>> as it would enforce some design.
>>=20
>> If everything can be statically defined for Xen then the user can also
>> statically define node entries inside his guest to make use of the event=
s
>> and the shared memories.
>>=20
>> For example one might need more than one event to build a communication
>> system, or more than one shared memory or could build something
>> communicating with multiple guest thus requiring even more events and
>> shared memories.
>=20
> Hi Bertrand, Rahul,
>=20
> If the guests are allowed some level of dynamic discovery, this feature
> is not needed. They can discover the shared memory location from the
> domU device tree, then proceed to allocate evtchns as needed and tell
> the other end the evtchn numbers over shared memory. I already have an
> example of it here:
>=20
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2251030537/Xen+Shar=
ed+Memory+and+Interrupts+Between+VMs
>=20
> What if the guest doesn't support device tree at runtime, like baremetal
> or Zephyr? The shared memory address can be hardcoded or generated from
> device tree at build time. That's no problem. Then, the event channels
> can still be allocated at runtime and passed to the other end over
> shared memory. That's what the example on the wikipage does.
>=20
>=20
> When are static event channels actually useful? When the application
> cannot allocate the event channels at runtime at all. The reason for the
> restriction could be related to safety (no dynamic allocations at
> runtime) or convenience (everything else is fully static, why should the
> event channel numbers be dynamic?)

An other use case here is dom0less: you cannot have dom0 create them.

>=20
> Given the above, I can see why there is no need to describe the static
> event channel info in the domU device tree: static event channels are
> only useful in fully static configurations, and in those configurations
> the domU device tree dynamically generated by Xen is not needed. I can
> see where you are coming from.
>=20
>=20
> The workflow that we have been trying to enable with the System Device
> Tree effort (System Device Tree is similar to a normal Device Tree plus
> the xen,domains nodes) is the following:
>=20
> S-DT ---[lopper]---> Linux DT
>                L--> Zephyr DT ---[Zephyr build]---> Zephyr .h files
>=20
> S-DT contains all the needed information for both the regular Linux DT
> generation and also the Zephyr/RTOS/baremetal header files generation,
> that happens at build time.
>=20
> S-DT is not the same as the Xen device tree, but so far it has been
> conceptually and practically similar. I always imagine that the bindings
> we have in Xen we'll also have corresponding bindings in System Device
> Tree.
>=20
> For this workflow to work S-DT needs all the info so that both Linux DT
> and Zephyr DT and Zephyr .h files can be generated.
>=20
> Does this proposal contain enough information so that Zephyr .h files
> could be statically generated with the event channel numbers and static
> shared memory regions addresses?
>=20
> I am not sure. Maybe not?

Yes it should be possible to have all infos as the integrator will setup th=
e
system and will decide upfront the address and the event(s) number(s).

>=20
>=20
> It is possible that the shared memory usage is so application specific
> that there is no point in even talking about it. But I think that
> introducing a simple bundle of both event channels and shared memory
> would help a lot.
>=20
> Something like the following in the Xen device tree would be enough to
> specify an arbitrary number of event channels connected with the same
> domains sharing the memory region.
>=20
> It looks like that if we did the below, we would carry a lot more useful
> information compared to the original proposal alone. We could add a
> similar xen,notificaiton property to the domU reserved-memory region in
> device tree generated by Xen for consistency, so that everything
> available to the domU is described fully in device tree.
>=20
>=20
>    domU1 {
>        compatible =3D "xen,domain";
>=20
>        /* one sub-node per local event channel */
>        ec1: evtchn@1 {
>            compatible =3D "xen,evtchn-v1";
>            /* local-evtchn link-to-foreign-evtchn */
>            xen,evtchn =3D <0x1 &ec3>
>        };
>        ec2: evtchn@2 {
>            compatible =3D "xen,evtchn-v1";
>            xen,evtchn =3D <0x2 &ec4>
>        };
>        /*
>         * shared memory region between DomU1 and DomU2.
>         */
>        domU1-shared-mem@50000000 {
>            compatible =3D "xen,domain-shared-memory-v1";
>            xen,shm-id =3D <0x1>;
>            xen,shared-mem =3D <0x50000000 0x20000000 0x60000000>;
>            /* this is new */
>            xen,notification =3D <&ec1 &ec2>;
>        }
>    };
>=20
>    domU2 {
>        compatible =3D "xen,domain";
>=20
>        /* one sub-node per local event channel */
>        ec3: evtchn@3 {
>            compatible =3D "xen,evtchn-v1";
>            /* local-evtchn link-to-foreign-evtchn */
>            xen,evtchn =3D <0x3 &ec1>
>        };
>        ec4: evtchn@4 {
>            compatible =3D "xen,evtchn-v1";
>            xen,evtchn =3D <0x4 &ec2>
>        };
>        /*
>         * shared memory region between domU1 and domU2.
>         */
>        domU2-shared-mem@50000000 {
>            compatible =3D "xen,domain-shared-memory-v1";
>            xen,shm-id =3D <0x1>;
>            xen,shared-mem =3D <0x50000000 0x20000000 0x70000000>;
>            /* this is new */
>            xen,notification =3D <&ec3 &ec4>;
>        }
>    };

Few remarks/questions on this:
- this is not a shared memory anymore as you add a notification system to i=
t
- what if someone wants to use only a shared memory, or an event, what shou=
ld xen do ?
- in xen device tree, how do you associate the event with the shared memory=
 ?

>=20
>=20
>=20
> The good thing about this is that:
>=20
> - it is very flexible
> - nothing to do in this series, except switching to the
>  one-subnode-per-evtchn model, which we called 2) in the previous email
> - there were good reasons to use the one-subnode-per-evtchn model anyway
> - the xen,notification property can be added later without issues, after =
Penny's series
>=20
> There are a couple of ways to implement the xen,notification property
> but we don't need to discuss them now.

I think there is something to do here but we need a bit more discussion and=
 this can be done later.
Right now I am not quite sure we will not add something that will end up no=
t being used.

>=20
>=20
> Short Summary
> ------------
> I think it is fine to only introduce the Xen device tree binding for
> static event channels without domU binding, but I prefer if we switched
> to using proposal 2) "one subnode per event channel".

I will let Rahul answer on that.

Cheers
Bertrand



