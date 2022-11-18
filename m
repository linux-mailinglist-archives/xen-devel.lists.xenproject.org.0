Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED562F6D4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 15:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445798.701195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow23l-0000CP-N7; Fri, 18 Nov 2022 14:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445798.701195; Fri, 18 Nov 2022 14:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow23l-0000A9-KG; Fri, 18 Nov 2022 14:09:37 +0000
Received: by outflank-mailman (input) for mailman id 445798;
 Fri, 18 Nov 2022 14:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow23k-00009w-Li
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 14:09:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a024ab52-674a-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 15:09:35 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 09:09:20 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5452.namprd03.prod.outlook.com (2603:10b6:806:c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 14:09:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 14:09:17 +0000
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
X-Inumbo-ID: a024ab52-674a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668780575;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q8UmST6oS+LA7ANIQGYHQXQhnAHoVkyC9TJv4pXJq6I=;
  b=FlQaCioDB0L6q5ApFnni9jzbu4Q5OTjrR3xtd3Bo66Qb5DeEkIZSsItR
   2v9iahqOd5NsIBC1CpgymP4C4VXf7VdwD/3DyXb41lr6MWf3qbaK4SZzn
   YfiA8sIdz0YxTcI0G9VZZNOUKo49UlrQQos16AB3OxCszn+TZ+GHjnwGB
   w=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 84696034
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PSiy0q4CfgjmBGHCcSH1EwxRtBLGchMFZxGqfqrLsTDasY5as4F+v
 jNOCG+DOqqLNmH8eNhwaoWyp0wBuMTXytFmHgs/+3wwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 /wjIQkATU66of+u5IqeUbZ3iMYFFZy+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6NkkotitABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+Tw3KlANlOfFG+3qBouHij/0MUMjkLdUKnpKOggG6ncd0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiZIddgOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6k2hxPLC9N8Sqi8i4SvHSmqm
 2zQ6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHb1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:7cHytaPLviXN28BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="84696034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIl7FjEibHsBKRsQCHTfw+IItdg2yJpcKHsN6xcv5vcnQK6xiWIvJTL73NsGoWKVpplqHxqEacDofs2ARKfy7mBE7dPAwemeOjlNOdDgc6I+iccGYsNjhm7JdxTe/q314bCnqxrY4jG5yXugtLktMCfWmRqC0Xd7aD2Q1hu/XRWSqcP0CD/ewT+erGYTLJeVSloknFLZhQsdjKj1CfX8NUT4PSZ2k2he2140xb9GVdSj45KGyHKLpKVUPAoGDs8uCio9WXMLaGVRBJHsJtKnsXrRhAEJ102kZ1O9vqUclLMavyy8z/daziT6zXdNHHMPpinFM5hOTSVOp9FO4AUmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI41v7wgd+nwcrMXBSYhUl49WAatpc5nbxjV5Y99p8w=;
 b=G7SEDdNrZR6RyE+kjCMPLS9sH9cXarnIidinmuR8xumt9YHZtdoG9YyfdWXe96ldyP0TgJ/d8s1FA+CgzyF+GJ8EZdqWO/Dt4oVfPUxK01NDjRVJimprfywn3Icm4ZrbypXgRuh2FPEV8GClxWpRwNIiIIaGY/0rwgk7E9kSmMHPP3rtxxOO1sCgmMafNJ0Me7odPAZco2RFl8NdCT0rlM2o8PQ4LGgpfHMGMD8Rgn1vD6hsuDc4ZWsqyXQAkzEL34xxvnwLmehTtEFgHMzhsxx4VKTE9DwjYECVKwTBsh3aulQ4W2CKv/jesMlpkLPpH65VT30z8WfxVeY6zylq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI41v7wgd+nwcrMXBSYhUl49WAatpc5nbxjV5Y99p8w=;
 b=nWRguZ1XwcslC41uaWHduKfnVQgqKBOOPb+PVYiFHPPHCrzbrz0hEmuN9o8wb8tNtgvf4yZZSCik+3rm6lcQ6k8YNx9PzDuMFjpktsUWULIsXHB9BND29fTfP6fdxwtlk5vD+coUg4w7tbFu2NlaPzyQAyj0J06jRtQnKd26yeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 15:09:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3eSCjajBa39038W@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <Y3eO0bMKRPYJc2yQ@Air-de-Roger>
 <aea20fd0-9c68-25c5-d8dc-fd46b0b99867@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aea20fd0-9c68-25c5-d8dc-fd46b0b99867@suse.com>
X-ClientProxiedBy: BN9PR03CA0417.namprd03.prod.outlook.com
 (2603:10b6:408:111::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5452:EE_
X-MS-Office365-Filtering-Correlation-Id: 28163c3a-7765-4704-b59b-08dac96e7b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a6uTfvQllSJLp0/ewTS+9D0OtlLF4zyPvibT2M8hsLXsqanvemioM7WfTU26VWL/bbgVLYa0j+dIuk3e9qiDPeaaHnXwcpL6AWZJUMHNtPkahdRAJ0cwQkiqIeXzOXvJYAjVZ+Q1vdbAvXVkjBaXEkMIJgyOgU5JFwgyxIqI6B/PgDrgYxFEOW71Sigc+Xqcoqefsb/Xol9Cns3CcVF6eurYF4hc0WQFM8PIRHuWEJ90v1kDueo1OT2L71wUvJsuZAVpAqDxI3oZT2NQccMbIOZoVnRjhptQi0poOXWvg8hwJGJYh04PVSVTdiimmCpDnhT1bBpGjnFUFOe+QbPC00IMfIipsnPdcJ4wXEtK1G71bTbsmbUHBxMCb0DbmHwvVCoRlX25s9qNqoodlbPCz7kYBbzb0uznhXVi1Q+tHmyPhEx59WarTdJiSi4k4NgtZBGBxh8BUX8hBcj2CVH5Jw5QSLK3fIxVz9mGVCMmlG1qnAr04KjCMZPhxFb86RvhP9gaxEPyNzBe6sX4XLVYWdXp0e5UqKwJR388RhsQEbe+aVr0KluF297fwHuIqOaej5eDHA+AzqPAC98TxoZuAKXjvcJ2vY0zMA4tUvRWwwrXINSoCvY7i6NPdplGHt0polxUBm4w21+xhCq+jB1Xtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(85182001)(86362001)(82960400001)(38100700002)(33716001)(6486002)(26005)(6512007)(6666004)(53546011)(6916009)(6506007)(54906003)(9686003)(8936002)(186003)(5660300002)(83380400001)(66476007)(2906002)(8676002)(4326008)(66556008)(316002)(478600001)(66946007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZXWkI0blpncW1mT3FZeldURFZSNy9nbzJqWlE4eWlrL3ExaTRtTzFTaFFD?=
 =?utf-8?B?alN5T2VCakZ1VEJHTGhIL1JteXU2NUI5dmZRa3I1ZmFNYlpXc3ZxZk1IUE9S?=
 =?utf-8?B?K0ErdlgzMVY2c3cvRStNZFpCRnFkd2ZtS1FoaDMzaHF1RUVxUTBvSTl4NnNr?=
 =?utf-8?B?cVJmU1gwb2tUOXNyK3NEQ21QR3VLcUVabGM5aUhsRElTa2FoOWpYQlllTFJ2?=
 =?utf-8?B?Qm45VDgvR28rTmhZL29rbmtsQlh6b1R5a3VYR1RGMVFBSml6SU1ubTliVGla?=
 =?utf-8?B?TVJ2S0Mya0owNzk4bzBQcStaOHl6dk8xOHBYVEJBR2loODU2L09lbDhMYXlS?=
 =?utf-8?B?TjF4bXhvY2o1dU5CdEpMM0ozMHppQWZTVGNCdkJIZ0Jvb3lZeEdSSGZPNVM2?=
 =?utf-8?B?NzE0UEV2ZjZYSzFYQkFudHRDNmExSHVUR1gxYUF6dnRTbUpMVDJJU2dNZmxT?=
 =?utf-8?B?c2RFUndKdHFodzc0NDZOWkM1ZDRqMGwzOWo0MlFaUXhVd0R3eWpnRkhBQzkz?=
 =?utf-8?B?dTZiN1JqRXYwVEdnRXl3eHorODFMMTJTRnhHR2NiRkIyalJ1bk9seHZtSGpa?=
 =?utf-8?B?NTZ0djlITGxDSkhsa25RUkJ5bklRUzgwM2JyYWM0dUpnVE5UOE4wVWllVXVy?=
 =?utf-8?B?aE1TaFJ5cWt3ZHB3UHU5SEVPWFQ3dTBobHdRb3pTL0VOYS9qeVQ4SFhGNC9N?=
 =?utf-8?B?QzlMRXcveTEyUU9sVnBPb25ZeFNqcFFmbEt2VzRqNUJkOFQweFRTRnNhUzZ6?=
 =?utf-8?B?dGJSN3h0d3ozMUZMWG1vSlJQVzhxTlVKZitxZ3FTZ1BzclAvRGFjTURCUkJF?=
 =?utf-8?B?Tk5lMEFZc3JpQ3FjYTZ3bXByb0JSbTgvQmpMdEFMU0c2ZGlWbUhqY0V4Qk94?=
 =?utf-8?B?blVKdWIra3RVcUxOQ0Q2MnlNTFhCdTJmYU5VTDkzVXh4NEROd1dDSnVUVms3?=
 =?utf-8?B?bmF3b0dmSG1McE9nQXpWc2RpcVowcFhWM24yNmR6REhJK2tLUUE3RnhGMlB2?=
 =?utf-8?B?VlYyd0N0MklpTFVWaGhDQ3JRY2dQeG1uSXBaRlBvSStHb3hOdW9BSzFFNG12?=
 =?utf-8?B?Mjgrd1dMcVh2Q2g1VDU0dGRoKys3RmlJY0V0NGdpeXQydUNqVUFPVG0wSXZw?=
 =?utf-8?B?M2lGT283Z1FrMzd6TzM5M3pWOGdiN1ZVRzhSQ3h5VWNkSUVPOVJPdjRNRFhO?=
 =?utf-8?B?QjV0Y3ltVktjakpJTWtGSzZwY0pBSnlxS0JzQUt5YS9ob1IxMFFSbmRFeUxN?=
 =?utf-8?B?WW53MU9pa0dJZFFSR2xJRFYzNUxYamlrRnhEQS9nTVFjL29qamhTYWVKTW9k?=
 =?utf-8?B?TkZYVnlaS1ZXTC9uUFQ5TVFVZU5peURSYWVZcldZKzU3ZkJtaUZNZzZSMW1h?=
 =?utf-8?B?WGtYR21MQ3BVM1JXaVVBYVBlcXpVbG1zdFlsVy9zSkpMdmE2SjhtNXNkREU3?=
 =?utf-8?B?TjBiU1Fra3hDSzJqakgxRnJwK0dFQ2xCQXpnaGpML2ZudlJYME5yWWdjZ2ZR?=
 =?utf-8?B?OCtKdjBoWndMSUVIYklsY2M3eUIxV0VHK1UySHZtMXBzK3dOb2RmWGM5d05R?=
 =?utf-8?B?K3psTnFYSmNvTnFxTndOdFhqL1ozYzVQOWtON2JVVlJuLzRjZXdFeVFVbXVD?=
 =?utf-8?B?VmhmMVBiZ2M0WkQ5MzVsQzkrQVFZV21EN0N1RDR3Z0ZDMnJ1SmxRRVNXa1pF?=
 =?utf-8?B?Z3QwRllTK2JjYkpjWVduQzFYZ0Y3Qkxad2RscXF2ajZ2UUdEcVUzQWdaZkFU?=
 =?utf-8?B?MDlTRGlSS2x1cW1PT3IyZUlJZWVZREJPMkpBeGJqMFFrazBWcTBnK2FJZC82?=
 =?utf-8?B?U1NQMTNEazFUMjF2WCtJR29BN3JOZEg2VU13NU1VdXFjVjlZVjZnbUJadnZv?=
 =?utf-8?B?OERheXNxckFyUC9rV0FvQVNSR0g5RGliMzlnMEhPSHhlR1B6Tit3TkdIY0l1?=
 =?utf-8?B?RnVSZVJNMmkxQUhVZjlCT3NtenVPenhDL0hFN3ByRW1zT0F1N3E4K1kyVTBu?=
 =?utf-8?B?K21hK0pOSnpYY3o0Rm53aWxnOUVMcE54cXRibnBUK25QemxkYjBVdE0xaUJG?=
 =?utf-8?B?OFl3NTFYYTNCMVJkYkRQOGh4cTM1eU5BQU9maTB2WmNBUXY5ek02UjBQNy80?=
 =?utf-8?Q?om0deS7Wgi35Uc/LyMFyjlcs0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GtkbP10ZAz6R1YHAH3j8+tXm89XEFVA8NrE6cxZb//HL+pwIiVHYfa96/WPKEYymdz/D6emU2TYBULmpIl8HzLfPgg31+qRTjB1GpNfY3aTUHjFx5W1QQoyWiO4P35OFMXTDYJ9R+K7DBN9D9nlRKR6jNAbM/3Bq5mY9vQYlXu9qdyfmAPruxtCquzKaolacmgIynyTLA319oC++7zW7hUT43d6alteucVroa2cufI3DEjmzLCyjo93P88dA4DhVegHpRJcg9aLJIuUpDfvB/p9PpHNo6EAzjBd2xj0VPnECmqOCM+mxfMwa3cNO3yHJ1G2h+lTcIweJlePUCa46+qCHNQo8swAprYzwX3tPFpNKjCj3I/Y55nd6TPIkwnZfQyp8YAKVZ1OYdVQcw7HmMAaKG2sFVIaVQgx1QLeXQUvS1ldoOwxRtR1/a/WvtP5FFRjuep/xtcROVkyR4eveZGgUpc0rF+MOMoOfWHgrAmPyjrNpC4/oPwOe9VOJStDmo8ppDFKv7pDM/nfJq7gSk9VpDeEe/WsNkJb1EeL3ApgyoJzSHDDP/1oRXmsl/yvBMV1RPq8ERCdKmd2XNT37N5wY3AWRabKTzKe3HMGKBbctYvjcNMTzbsk5jsaVp7GFEuwv6fKLOOyh3xBBqedJMt9ZPnx1eiEoJlKrnz5Y6nTukJ8F4bdmBA7zrbmxdtNiBFAk2P8NXoB2kfy4Pz230kNikqn9WVfiEROi8e8kTax5zHs51j9ZRuZbsllNkfDhu1HOFfN+OYRyDIK+4HAhU4oUV5HnH6Q8jAEOvjh1x/WLsUKGj8WqXfxm3etGmuLor9lsHTS0dz7nc6ZDPi/UM80mtp+0Hab50dKCRqMDCtI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28163c3a-7765-4704-b59b-08dac96e7b0a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:09:17.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vmBB+svo0ZgDUgqS65Q+xf00Q/N62NHiaihCFzdsUrPUgxnHMWJrA662QhThJj1n26C6xN2Vovyhp9wG9uh+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5452

On Fri, Nov 18, 2022 at 02:58:10PM +0100, Jan Beulich wrote:
> On 18.11.2022 14:55, Roger Pau Monné wrote:
> > On Fri, Nov 18, 2022 at 01:54:33PM +0100, Jan Beulich wrote:
> >> On 18.11.2022 13:33, Andrew Cooper wrote:
> >>> On 18/11/2022 10:31, Jan Beulich wrote:
> >>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> >>>> exposed a problem with the marking of the respective vector as
> >>>> pending: For quite some time Linux has been checking whether any stale
> >>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
> >>>> This check is now triggering on the upcall vector, as the registration,
> >>>> at least for APs, happens before the LAPIC is actually enabled.
> >>>>
> >>>> In software-disabled state an LAPIC would not accept any interrupt
> >>>> requests and hence no IRR bit would newly become set while in this
> >>>> state. As a result it is also wrong for us to mark the upcall vector as
> >>>> having a pending request when the vLAPIC is in this state.
> >>>
> >>> I agree with this.
> >>>
> >>>> To compensate for the "enabled" check added to the assertion logic, add
> >>>> logic to (conditionally) mark the upcall vector as having a request
> >>>> pending at the time the LAPIC is being software-enabled by the guest.
> >>>
> >>> But this, I don't think is appropriate.
> >>>
> >>> The point of raising on enable is allegedly to work around setup race
> >>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
> >>> and the stated behaviour is to raise there and then.
> >>>
> >>> If a guest enables evtchn while the LAPIC is disabled, then the
> >>> interrupt is lost.  Like every other interrupt in an x86 system.
> >>
> >> Edge triggered ones you mean, I suppose, but yes.
> >>
> >>> I don't think there is any credible way a guest kernel author can expect
> >>> the weird evtchn edgecase to wait for an arbitrary point in the future,
> >>> and it's a corner case that I think is worth not keeping.
> >>
> >> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
> >> after setting upcall vector"), referenced by the Fixes: tag? The issue is
> >> that with evtchn_upcall_pending once set, there would never again be a
> >> notification. So if what you say is to be the model we follow, then that
> >> earlier change was perhaps wrong as well. Instead it should then have
> >> been a guest change (as also implicit from your reply) to clear
> >> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
> >> enabling (here), perhaps by way of "manually" invoking the handling of
> >> that pending event, or by issuing a self-IPI with that vector.
> >> Especially the LAPIC enabling case would then be yet another Xen-specific
> >> on a guest code path which better wouldn't have to be aware of Xen.
> > 
> > Another option might be to clear evtchn_upcall_pending once the vLAPIC
> > is enabled, so that further setting of evtchn_upcall_pending will
> > inject the vector.  I'm worried however whether that could break
> > existing users, as this would be an interface behavior change.
> 
> You mean _Xen_ clearing the flag? No, that breaks firmly documented
> behavior. Xen only ever sets this field.

So the only other option would be for Xen to ignore
evtchn_upcall_pending and always inject the interrupt in
vcpu_mark_events_pending(), but that would then lead to spurious
interrupts if an event channel triggers while the pending upcall
vector is still set in the ISR and evtchn_upcall_pending has already
been cleared.

Thanks, Roger.

