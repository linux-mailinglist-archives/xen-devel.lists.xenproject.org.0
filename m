Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E43D0AF5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 11:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159226.292892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68BU-00011g-C9; Wed, 21 Jul 2021 09:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159226.292892; Wed, 21 Jul 2021 09:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68BU-0000yc-8N; Wed, 21 Jul 2021 09:06:32 +0000
Received: by outflank-mailman (input) for mailman id 159226;
 Wed, 21 Jul 2021 09:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7UN6=MN=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m68BS-0000yW-CG
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:06:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eefe7374-ea02-11eb-8c09-12813bfff9fa;
 Wed, 21 Jul 2021 09:06:29 +0000 (UTC)
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
X-Inumbo-ID: eefe7374-ea02-11eb-8c09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626858388;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uh5PJfiRc7Ja7Loaxr4P52vXB2d0IaOEL6WCp0fZM2M=;
  b=ZxqXF/L1kZY7KREV+xZCdvl00XcGcktPqeoSlFYym9RJ4569W6K69/rK
   lgXCSzHD/V7EOd4EHq3REdG78DTUKkoVFF0tdM7TsPL91UrGJHw9HGyif
   2wnns9Cxm7hJKqWE9UEjpAxbtChTjMHjF8rGyL5KRPp+CeNLYrB5CjnJz
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aPPgSyaDGzD/917tQDdE7c0CQ0jR69lG2uxNfYs8OImL04LtK74wq0cQ4bdE0b7K97oTlUJ8rM
 cJwdun5w6uTIGsXBdRc9N/prnO2vyjnvcct7s4u9HWrIsCnkVk1jMf6Y2NVdil+zZFe8Oc5L7Y
 YDsR8mPzpjHqX642GJaVvYi4mkS0ytQKmbmu/0vlUABZ2w/lFxlDXuZ/jEEOBp+/Uf4gbsLnGh
 OlO9KXJVei1kWJk5y77Ixhm12phw/+Nf+s3ttuujALysQQz605GpPJXFp4LjBJGVGpdwIQNgGM
 OumFP3zO0AAJRNxN3I4xM24P
X-SBRS: 5.1
X-MesageID: 49119864
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Zw1Vda6jVvpTx/l0dQPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-IronPort-AV: E=Sophos;i="5.84,257,1620705600"; 
   d="scan'208";a="49119864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSHYDqQoMh/2jtVxRLAhcP9KSgsy1HqTNWt9w8xjI2I8JGtKKQvpXsBLvJqm+PaUeHUmbEyuiSHWiagvSmj+OAQvDnV9DKBWDWorhRquoBKaan9mGMhbt/8IfkpSbL5O5vvrW4RaU4IkvK2DaUae6Uu8td42uviNcoJBIDOjkB+lvl3AMZe7RTlzj/oax+cS/+LCuIRmRQ4S6ZFtSrjsSEz2WFTmwC0Qf/f/JhFqdEVeC+4QfD/A1Ie09piMvoalYoPI4cRR7/zq6UzZ3Rn32x2R6cczgH20BIksnmMccTs/RySRxaFki506Omkx1AS4JpPFg581i90w9r4MvecTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh5PJfiRc7Ja7Loaxr4P52vXB2d0IaOEL6WCp0fZM2M=;
 b=gv8RpwbaqxmCvcXEhWfIGUJKxrifeaVtpi+YjFsPkKxJbzb0PNAUCKSQMWIXOl10pqtX7ARHCNkeISEvNTGmAAIma2FhopkVDQZZybVTSo3PGgoLylTPj64jVkrXxxnMd3giA3hdxwTFfyhTvcjNB85UmKCT7ZKzA9etYZQ3Q88msl/XoGyvmzJuzR4mJYiXa0yOLDJPKjf1o3WLMaTKOdGHoliDlUQVfsYpTlbkv84O3mZXP8wkBGKWcpXOCUAgjKftXJD2hVq4ww6WnbhTyfE9pBbvqZ0PzHJW1hwQCz0lJ9g1kyTr4oZyLRlIElkDEYTeGgk5jqTHRfpZCcl81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh5PJfiRc7Ja7Loaxr4P52vXB2d0IaOEL6WCp0fZM2M=;
 b=YDq3WIH6GnzZNCSpAYwLkhFuXfXdA1JEp+9RpH8idcm9u/W6wYHbnzpW8pOHr4JprPh2SCw3SCMaQWV0qdDGZGxu0ZIs6SjWweKETp5M8HFgHtJSNhV1Fa93jzKHlDOMDIXWzIFKNFdgczAN0U5vj0sAl8IRW4t/b7NmRYEO12Y=
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Julien Grall <julien@xen.org>, Scott Davis <scottwd@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
 <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <56f86674-7a6c-3f3a-40e9-dcb35cddbb88@citrix.com>
Date: Wed, 21 Jul 2021 10:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a432fd0b-a658-44f8-b1e5-08d94c26ccb6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5744021996C363CC8257E8E9BAE39@SJ0PR03MB5744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjK+YZp7wksSVlNr5k6kYRtjnFaeMvsn6uGhKbFhz+xLsIqWEoU+xZ+v+htFk4KT8QmHRoHIJB2TLmwy3rFLfGpkD/BfpSQUnI3o3iuKZO1mZmHv7CmGfHI2YByD3MCCxawdUTkDzkLpg47Le5M/DRBZaUjw4DkzOk11c7DF67gaXHyZxNas1hXkz8V61qYS8+sZbFbVjcYdauaB5mZzcDQr6EnSJKUYI9Yj3fQHmUNPikJjsmAKoHlkH+VCpPt8PlaWpRgoiZX5Kk8gwwEfYh0JCyTrmXxpYkmbUaU52eAybPv/2XJcbL7N+nPVdGj/PRI46UDDW/bQ22xuBcvNgNvo7FXLB6MdzUZLxh6VuS8Kv2ADPHsXZbGfjEQEf/uACms2Raxh+Swh8vN+JvNWayLbG479WvWwxsTo+r48mZAGw7j6FOev44ORfRT1VuC1NRfN/JiJnb1KnylHM7z8vn77HFruPRGtF7C9/+qzVBD5aCJoUSD9k5/KxtiptHWIGEPNIQl4Ke9WpBp4awcl60TfUnvi8pVEQaj8LVT/SwV96cOsj0L0OQAIZ79rtSFsP6s6rr8gOof0wO0hWXsjeLjNFuZrxUF9V3aQAc6/GkF88KAfnzYpNkn1Gr1RK0/8xzsQtDFaSp5H6P6pdrb8OLo/dL1IOOQplnRuHttHPjMzTXWKlC6t93b2GUFmhS+1fXQuAof08Xlh7kT1tPBZqpmsbFKlUkhE8LI5cWXvvJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(86362001)(16576012)(4326008)(5660300002)(53546011)(316002)(31686004)(31696002)(26005)(66476007)(8936002)(66556008)(38100700002)(956004)(186003)(66946007)(110136005)(36756003)(6486002)(4744005)(508600001)(8676002)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHo1ZjFscE5acDBOQ3hsditoenlWakw4NlRTUFI4Q2VwOHcwSWFpcWpNS2NM?=
 =?utf-8?B?a3RmVFZRVXpIMG5lUDhoclY0MFFuY3BweGhyODE0dFJRL1dKbE5nSG1TZm56?=
 =?utf-8?B?YncvR2lDR21wVS9VdnhvSDVIUGtwMHdIbDdTK0dIL2FuaXIzcFJBajhabnBW?=
 =?utf-8?B?VFd2c09VZTFsV0ZPRmhZUG5YYUU0YUVxeHIzZDIwQnNHVmJ0S3ZwaURTVVlJ?=
 =?utf-8?B?U3NqTkxLUFJXbmRNdnFzb0pKSkhaSUFyblRhdWljNDRIY1FDemZtM1FSMUhH?=
 =?utf-8?B?Q1h3MUpOcUVCNHhvMERLemF2QnFIUlZhY0ZrK0twL09TTDh1aGZIOU5JN3M4?=
 =?utf-8?B?aTNOWW9NUm5wa1JkZzJ1bUxKYWoyZUdXQ0hLMEVNam1XQ3YvejJTNjlzTEZG?=
 =?utf-8?B?NU1zOVVOd2huRXU5eTREamZWZEtyeTU0eHl6TWR3eFR6V21zbU5wclJxNE9i?=
 =?utf-8?B?OUkrRW1tL1BGK0lXa21pbnNENEFyRDRzM3VheDVsWVYxd0J0RWJ5alNRZjdv?=
 =?utf-8?B?eU1aT2RaanFGR1Y1QlorcXFzMlVwbVdRN054OHRYUStiUWZnaXNGVnQwSW9T?=
 =?utf-8?B?bW1CR3F0TzBjNWRCZjkzSUZZdFVIYjk3cHhIM3R3d1pBbmtobmdSVFFZQ0JZ?=
 =?utf-8?B?SVBVNVRZQVpqQjNLMTJQckpBQ1FlRVB6QnE0b0dwR2RMV0hKa3hjc3hETHNF?=
 =?utf-8?B?VHozZzVjQmMxZFpWbS9iYlIzcmhOTTdaUzZiV2xTckpXMG8rVXVURXFNeVdT?=
 =?utf-8?B?bmNlcjUvV1pFQVlmWENlQUI1VTEyMnJ4S2cvYTBhY3o5YzhUUkUxS2VhMm9V?=
 =?utf-8?B?U0dPcThzZVFXZEpVT1NidTZCQy90RG9ZZ1RON1diL3QzbU9TdDRTNnVyUVhz?=
 =?utf-8?B?czNxR0NJMWpJOU9QcTNMUnhybXFYMlpHcHh6UWY4Qk1GVDlHZWlkMTdSTnpx?=
 =?utf-8?B?Wi9MeXI2VUd2OWpMRTZaN0JYWDVVSC9MVzNpbkFMQllzdy9NQnpNamJBY2Zz?=
 =?utf-8?B?SWFkb2hoVmRpTGU4V1hWVUhxQUdXTlJGM0Z6aWM0c3NEZUgzcEM0Y3Y2Q2s5?=
 =?utf-8?B?NUIvb3R3QVRXQ0NZYUQvUDExTjB0TlZpbTJrUGFEanA2ZzV4U211dGJXTzhX?=
 =?utf-8?B?WVV0dVlQaW4rVWtmeEwyN24vcDl3QzBIUVdlMHYyalpqVGtWZFpzZzFhaTFn?=
 =?utf-8?B?OEs0QVdiQndXbWdBNFRSaWRFV2VVT1l3Z1VZTEIzdVVTS2NaSmRUMTQ1b3FH?=
 =?utf-8?B?eG1uRUcxVmF6WTA2eDlJdXdvRlp2NnlEVEhTWUlxek4zbW1pMVJqbW9ueFY3?=
 =?utf-8?B?aFV3WllkUkdYS2dCNlFXY3pKMllhR2k2VTAvbHBDbk8zOHpOMUQxTHI2QVJT?=
 =?utf-8?B?amtVcFBRLzJHRE1KcEJsRW15NWJER1d1SytxeEFDbDRNTE9iTFgxQkpLaVdl?=
 =?utf-8?B?dkJCc0ExMmJpb05KS1pSRkdVK3d5eGpSV1ZWK0NGckd0eFRNSzZFa0FtVjF1?=
 =?utf-8?B?ZHNlY1ppZytMaWtGWlg0SFRvbVQ3cXNkZHlOako1d3Fhdi9xeEtpOU1CbWha?=
 =?utf-8?B?NmNsc3NtUFZIRStZTXV6MVlPTzU5NE9DQytrZVRMMjM4ZWU5QWRWQkV2Tnhq?=
 =?utf-8?B?akVPejg4QTVheldPRVZ4MWVVb2labmUvTktPTzhoMnpGcW5aRlQwVHlQSE16?=
 =?utf-8?B?MnVpb2M3bTJ1RmlMdnpaR0ZCWVAxd2dQWFdDcjBDMGUxUXhyYlRHaDVPTTVZ?=
 =?utf-8?Q?PQPmds3tJNB0Lj4IrJEynEotBdOhunSkBIeIdsN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a432fd0b-a658-44f8-b1e5-08d94c26ccb6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:06:18.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4J27SutgLQKwAXCwc0xo2l06+EaAlEJ+us9oCsF23vLf3ssCzAmZFOnolGKE3RM1AGvoIiBhvWfSDSYODh+FuKJT300jg2rTYDHaJzb5K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-OriginatorOrg: citrix.com

On 21/07/2021 09:21, Julien Grall wrote:
> Hi Scott,
>
> On 20/07/2021 18:56, Scott Davis wrote:
>> This adds an option to the xl domain configuration file syntax for
>> specifying
>> a kernel command line for device-model stubdomains. It is intended
>> for use with
>> Linux-based stubdomains.
>
> May I ask why embedding the command line in the kernel would not be a
> solution? Do you expect it to change from stubdom to stubdom?

Why should users of stubdoms be forced to embed command line options? 
Especially when its not the normal way of working?

They shouldn't, and this alone is enough justification for the change.

~Andrew

