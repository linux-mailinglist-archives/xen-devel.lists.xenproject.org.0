Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F635562F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106017.202725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmSp-0006kB-UG; Tue, 06 Apr 2021 14:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106017.202725; Tue, 06 Apr 2021 14:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmSp-0006jm-Q6; Tue, 06 Apr 2021 14:13:55 +0000
Received: by outflank-mailman (input) for mailman id 106017;
 Tue, 06 Apr 2021 14:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lTmSn-0006jd-Bi
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:13:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce8364e8-bac7-4ee5-a930-f502c8ce1ae4;
 Tue, 06 Apr 2021 14:13:51 +0000 (UTC)
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
X-Inumbo-ID: ce8364e8-bac7-4ee5-a930-f502c8ce1ae4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617718431;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fBbnseOTu4W+gnaY19GhH3zKUfXk3+RGdijgoKLm6Os=;
  b=Kb6XiRJyKdNIeGDGYIKMYmjTR+kD/SCHohqefDIsWPHelvwyQAs8pQsp
   QXEqBYpIWTvO7KRkl69aQhJeBY5E8/PtzbJmNRVm63gnB9xwmKp94dmIV
   t/Uk74cLgRPK4BLtkNSexeeuXEFPyz1A2KSAZfU9e4ElHdW9w2ozCgnFo
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wc4geeFj6gQ0luS0NJQOsjnPWfq5BOhTZp1YbtRK9kBfjE4W2guOFiVYXS4pUVYfIUzwoeJ7vu
 NrCNJbZ8Qu3oHg6Dt9lHZvqyx7rckyIeLC0cYc+TNUHPKi5nSr+LiXHSfES6XcpOGUtpdlODoD
 Lmzhp1hs20LQyiuxZj4vzlh72Qhb12Qcw5sp0SnUqGOOsgZ0Ekq+EJBgb6aOmUHgoG1nxfThcj
 QUCFc1hRq/iksmXPPKCL2FPWoRrKpZx4HAGgTO0FQVWOQODNHxQENGbY8mKAPkWAc/6oDD7gDp
 D4Q=
X-SBRS: 5.2
X-MesageID: 40978237
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2r1bgKy0yLMald3V05+OKrPxve4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbacQcLbiRXkzWmoBGJzPrBExae1goDSD8n+9kf2E
 XMjgCR3NTAj9iV0RnZvlWjiqh+uNyk8ddbAdzJt859EESQti+NRKBMH4KPpyo0pubH0idarP
 Dprw07N8p+r1P9F1vF2CfF4AXr3DYw53KK8zbx6hGC0K+JNw4SMMZPiZlUdRHU8SMbzalB+Z
 lGwn6DsN5vBQ7A9R6NmeTgbQ1glUa/vBMZ4IgupkFYOLFuDIN5nMg0+UNYF4o4ByTq6IwrO/
 kGNrCi2N9mNXyddHzXpW9p3ZiFWWkyBA6PRgw4ttWSyCU+pgE182IogOgk2lsQ/pM0TJdJo8
 zCL6RTjblLCusbd7h0CustSda+Y1a9DS7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBeEkwjx9yR2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCy4Tkw0mcfImYRQPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOIPvNIWXE+Pv9LrJoXmuvezSoeRGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1PhE3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gTdE
 t6K7X3r7OjqQCNjCP1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXmxOwn2dJFtaQ9nNGA
 BS43R7kJjHYKC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9cfFZYpWKt4EC3RDBxrkQNWqG
 NOATV0BnP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAGhv801f2AaWDSvSMaTpg4rS1Nv9x
 lM2p5apIDFtSekKGM5juh9FFFXcmyYDIhLCxm/aJxOlqrmfxxxSmm2lSWX4itDClbCxgE3vC
 jMPCeUcfbEDh5mtndU3r3D3Xl0em+eFngAIkxSgMlYLyDrq3xz2eiEau6PyGOXcEIF2fxYGi
 rCeyEuLgRnwM2X2BaZlC2ZL2gvwowjM4XmffMeWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 2YYA2YIVrDepQU8j3QgkxgHiZ6qHMpy6y1nDLk6XW1x345D775Jk98S7QSPtGb6CzFSp+zoe
 BEpONwmdH1FGP7LuOi4+XwSRVoLxvIu264T+0ys/lvzOsPnYo2O6OeaCfC0XFM4Q43I8j1nn
 4PWagT2sGyBqZfO+gpPx9D9lUnlN6zPFImnwz/DOg5Z0wshRbgTqe0youNjbokGUuaogTsfX
 GZ7i1G5v/ANhHznoIyOuYVIW5MblI752kn1OSed5fIAAHvU+1Y5lK1Pjucd7BaIZL1U4k4n1
 Jf49uSmfWQeDe98AfMvSFjKqYLyl2Ze6qJcXSxMN8N1ce7N1SKirar58D2rA6fc0rGV20owa
 tfdUIRacxfjCIFl4Nf6Fn1dpDK
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="40978237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS6Q737OQMKROoAIo3uXx5vbNBs7DUQsn3iYs2GZeJZq+hucW0RROjfuHrD79nW2tRr/T25j7c8uxRmwKurSqWBWrZSlnsHpGOBictKpQpUj7fdhTYMAT5jsJaVhUC1feAVXYmJlcdHVKIWjNREVqlN122Oyx5vGJOcMNQ/RCL9nryKCaYl0iI4Zls6WAKBSogfGBM8u2e/zq8kAxRQPF+5Mh6FlF2ePj+EMgzmcroJytigh+15yOC9gQKrF+pzyIyl2FLfatqe80sKZeIGXx/hQg1112xy2t27wjvfBDNTqfOECktLjmI3R1VwfpvTxYAJFH9uFUTWIQQRJZ3nENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQSFE5Ykvq6/LpHS2MvCngSqL58CoX0TTlRAuPYais=;
 b=HCkYD+wzwL6pdMGcuHn+q4v4FaLQulvl664ZwLdCLqe+tSg2BVCZe1qDbLsd3MjxqrzEYMKT/GCjVSQcbGioo5NLBdVpWqa2giWGrAVItw2Ydea/flQs8pF8Z9onOR0kLE4tSJrckVKYXRWUdikR0wcDZQw4VvUvnVgELMTfsyizfAW11Ulwyp6j5Kp9gRy8HMud3QLw4XXXEQhNSrDeiB8JEjz+Tx5j9vEEJ9+kLuQs2ZtlmmQl0QxFrIWdKEHuGWISl8+V5UUndLXEB7O0CYrGA+TZ7Ak8V6WuzsXnnwh5zYTOUsRmlEY/tX9/TUy8PvUb7wfN2D0Lkb/2AnQj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQSFE5Ykvq6/LpHS2MvCngSqL58CoX0TTlRAuPYais=;
 b=pjgD2P1nMo1WWjisAB7MljzoQxDWjhu5JLNldATiqFKhR/L4guszHuHg9wSmvL/ZcPeVhuyIp5d6TSo6GeuRbaL0tsuRTurSUGeE3S127wrJMpNJrhsSHZA93n+4MMQctYFl28RT3CcIuWbezDdjxTNTe3WZycWMQO5m56LhU1k=
Date: Tue, 6 Apr 2021 16:13:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Message-ID: <YGxsfdK9GEefLgAv@Air-de-Roger>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
X-ClientProxiedBy: AM6PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27094280-a87e-4243-2c53-08d8f9062342
X-MS-TrafficTypeDiagnostic: DS7PR03MB5575:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55751432CCDD77CF930BDCF48F769@DS7PR03MB5575.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BV6gSC0alji8wISxZqCFtzFpMU9rXJs2vtQrKoh6vRhBgiN5Lx9CpBtY/JQ9fEjLyGIssJZ2bPcvjPnmFojGX6yUC2xQzZoAorBscytd1HizbO6macQFrIl/cC0WFzcAU+zDYJp2D/xQPLYNlvaMYFl1YqTyALmMqItW/6y4FiOmDcBcK9hhsPxBaaEahYe+9PyWVPKjuwQIMgymBuNumerz65ukuVZBGrzwxl0rWUFrohbDzbenGaCRTqEZgeZkqPSxSp0jsLR46EzKjI/k99eu61PwlRypXBDBYhfhuRJVm0ATHWhIbdCfme4zPemzWpj2tH8Q2PYMR3dpxfJ/1aJgAILYbQPTBwq+7Tss7MJSj9mEdcdLUY3hqB0/nmAExLkU+u2u1GEmT+ZmHvwsnIuNPcrd2+OYBMDDKbrq3GTl2gnKV2mSGrwFH9KL+QgooKXgMJDOacyzI3XRWWIkLJsubdgSIYUhMAjqR6VtpDVxVlIo+YHpoaG0+Gt7ENx4JdzBk6MTxLp9P31PEI1Ed9aCsnEylS2qKJuYT8WJpi0StZS29vUM7qWK3haPcP6q72XWkV7MGkAeBnJmhlwdHLnSvqyGsmohO2Wi5tmQKOQ6MJ78YjXIaFLKdEdTomdmk6lrnwxP1NN4O/FRT59Mascp3MV425Bla5GHgLBLGEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(54906003)(85182001)(9686003)(478600001)(6666004)(26005)(7416002)(33716001)(6486002)(956004)(66946007)(86362001)(8676002)(316002)(5660300002)(66476007)(66556008)(8936002)(6916009)(2906002)(4744005)(6496006)(4326008)(16526019)(38100700001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTF3ZDkxbHJ4Nm9UeklwaHNVTEdOZlV3YUE5blEwbjIwN3h0T0R5Y3o3WG5x?=
 =?utf-8?B?NEJ0ZFk0dG9uUEVkSnF1L3VZbkRUL0JtVW9GNkJna1ZKOXdva1ZtbVFZanlW?=
 =?utf-8?B?TFpMREJ3aEw1R1duR0p2dnQ5NnlpVlZ2Mi9UMTY5ZzBieWlpNzlBN0d3dys3?=
 =?utf-8?B?bGtqS3kwWk5Sa3NTR0ZTTUYxTFZvb0ZQeUdiMFBrNWowR1B2TlpPOUV0M2x1?=
 =?utf-8?B?VHA2TFdQQko4U0FSUDJ1OXRrSEtqNHpkMGIxelVCOTQ1WXNjSHp6c1FYRHk4?=
 =?utf-8?B?RUdCQzNXdUhuQWVMSWtudDVSZ1psay82M3I2aTVMUjR4K2Fmd0IwclBnKzJs?=
 =?utf-8?B?dkZ1cHlNRlNGb1NBRmRiZS9BV216ZmRCU2lsVU5WL0o1d040T01lQ016eTd3?=
 =?utf-8?B?UllPcnpQakZZM3ZpUHJQdjVOUVRiSzZBdGk3UWJjNmltRlYybzRJVGZXY2w3?=
 =?utf-8?B?anFQaDRuemVpZDYyMHNTWUpTd0U4czY2ME5FczAyYjloUzlFekVkRWYrb0FU?=
 =?utf-8?B?M0puenJSbzM0d3lRekNIc2pmM25jK3NKSWdWeXc1YVo5SFZ5eDcyV3NoS29i?=
 =?utf-8?B?Wjc5LzRxWUN3VC9TQXFFRXhoN202TXdWZFZ6ckFudHQ1ZEhla3BDbzAwUlFw?=
 =?utf-8?B?L21ZZjYzcmZObG4zalhtV2lNSHFNL1IrZnZNWVhvYVh0TEFPMjd0VnlQUmh3?=
 =?utf-8?B?TnhOQ0Y0MWJCZVphaGt1RGZLNjdXZ0RzblNYeHFoR1hnWVBmdVh5T0pGdE82?=
 =?utf-8?B?cS80NThDbVNyeStJWWxZT2xmVEp0eXN5VWtVcUlFVUVOWWp5ZmJhMVNoQTNM?=
 =?utf-8?B?WVlDU1FwZE9nODgxTno5Z2wyWnBPNHNoT0F2Ukk5LzBwWmNsTC9Pd1F6OUV3?=
 =?utf-8?B?V24vTFJjaUg2ZWo5bnlEdkNER2c2ZjNuY29yZ0JEUFpiVk1wUnFWZFpVTzVX?=
 =?utf-8?B?VVd0eG1vWGR4WStxcElxSHJyZ29oZzgyUUZMOTBMWXhkTjlpSXZRMXBtckpO?=
 =?utf-8?B?K3lvaXV2UmZiNzlldGxXWlZTMjVOdE9zdndmdFlUcnlVZWdSdDhUYTZSaFdT?=
 =?utf-8?B?RG9hY3JLRjJKSDg3Zmlkd3FDOFhtcy9yeTNYT0dCcG53OHVma0pTWHNXOTZr?=
 =?utf-8?B?VWQvOWt0SXNJeE9JamtSSy83RGNkR2JQTkxjdi9PTzIxTmsrM21wV2xXUTZN?=
 =?utf-8?B?ZWRETFE3OVk1cnVXdUNzK3JnUXVMdGZMcWNRTjl0RStMNVBrNGJheUliKytT?=
 =?utf-8?B?cVB4UnhzZW9QSXE2SG1XWTNpdCtoTWZ2QnRQa0poMllvQktadGRLTU9PNGNw?=
 =?utf-8?B?UktrNFFuYnl4T3RiNUJUb3hyYW56bUhBZW96eDJwbkZkbEN2dERBMXB3VWh0?=
 =?utf-8?B?eTh0NmYyeHZZY0c2ME95K1hVSDRiOFA5ejFRaURNSlMrSWlFRk1NSWVTY1ow?=
 =?utf-8?B?dURhMUFHaWY4bG9BRmhmdlNONDlXZWRObkZUck1XeGlXVHlkMmdtbXIwY3Bm?=
 =?utf-8?B?ZXdEempqOExVazhKYktjNkVqNkdZallxK2RZK1BKbDFFWTFpWTJSR3ZDWDRI?=
 =?utf-8?B?UW04cEpCcHBUejdHMnlIM3RhUnhKZ2Nua3dHd2NiSGhPaEVFMkJJdWtLUFpI?=
 =?utf-8?B?SWw4RXorYVMxdjZGZ1NmN040V1h2eUU2NEVRRGRIT0FCWDlOYit1QnM5czZU?=
 =?utf-8?B?OHNaTHc3M1VqZzI5U1hvQnMrK2M0dkhxTldvaVYrMGZDb3krZmJob2NuVGJV?=
 =?utf-8?Q?BPaTK4OxC3U8E3Yp9Jygnc2pjwANzwVnHx/YkNy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27094280-a87e-4243-2c53-08d8f9062342
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 14:13:23.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcdCKNxJxYmIhx83glDAz4nW991l30Vh49zYxpXsnTIFp92EFslbmk105X36s2I4TD7+zipUOgj9DV/maF5AzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575
X-OriginatorOrg: citrix.com

On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
> MSI support is not implemented for ARM architecture but it is enabled
> for x86 architecture and referenced in common passthrough/pci.c code.
> 
> Therefore introducing the new flag to gate the MSI code for ARM in
> common code to avoid compilation error when HAS_PCI is enabled for ARM.

Is such option really interesting long term?

IIRC PCI Express mandates MSI support, at which point I don't see much
value in being able to compile out the MSI support.

So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
warrants a Kconfig option, I would rather see Arm introduce dummy
helpers for the missing functionality, even if unimplemented at the
moment.

Thanks, Roger.

