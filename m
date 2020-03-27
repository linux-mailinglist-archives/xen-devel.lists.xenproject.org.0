Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFEB195BAF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 17:55:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHsDm-0005et-S4; Fri, 27 Mar 2020 16:52:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RsLI=5M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHsDl-0005en-K3
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 16:52:37 +0000
X-Inumbo-ID: 5bfb3e68-704b-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bfb3e68-704b-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 16:52:36 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id u59so11983333edc.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 09:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nG2VPeC87YtDf39I1J29figmTqJosHnWEYIo6HdnFKI=;
 b=ktyqllf6afwJMYkxfFZLZ2Tsa1mUjYKCRnF/xQjvEuIY1+oFds0ywRVLWZL3tFJxD3
 KQW5berj1FeSmGW+zu3FkCGmv3RRmJvxmh0nZbFcf22po0geAqjmKPdUCAa22VN8Rq22
 P5HzEfOetuZZ4IgvrWCYxfPD/Ibm5RpcVw8JD0K8XM0X+LHwYBGCt0YzjDF23zd8aC1R
 WkPwwZnoVBAHNqI0JWmulvpsYG+t6Ay++uPp9GL4sfA0aYpNLyyNuVhW/9q8bskNLQKs
 cmtX7Q9smYlPXQ6yoGmmY90K3QF5qbm25uDRCioD9d+v6tZMkYS/gbAXIs9rVhUzkg5l
 CGfA==
X-Gm-Message-State: ANhLgQ10wffhHeUBaVhWCNpO8cvTxPpVpdoEQK94TE4X2B6z9pgXoNev
 Xozd8DDfyOf6jCNtRfhKNhc=
X-Google-Smtp-Source: ADFU+vult4jRfyLbvHVKKuwzMVjJDBHwPRwj1SnNV/LbJzC8KQG8+ufuPyBPVH9P/UMla27Ty17Alw==
X-Received: by 2002:a17:906:4754:: with SMTP id
 j20mr13492885ejs.277.1585327955199; 
 Fri, 27 Mar 2020 09:52:35 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id s25sm942040edi.37.2020.03.27.09.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 09:52:34 -0700 (PDT)
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200327134610.23387-1-paul@xen.org>
 <20200327134610.23387-2-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <88820057-720d-2a3b-c18c-8f259fe616c5@xen.org>
Date: Fri, 27 Mar 2020 16:52:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327134610.23387-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v8 1/2] docs/designs: Add a design document
 for non-cooperative live migration
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 27/03/2020 13:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> It has become apparent to some large cloud providers that the current
> model of cooperative migration of guests under Xen is not usable as it
> relies on software running inside the guest, which is likely beyond the
> provider's control.
> This patch introduces a proposal for non-cooperative live migration,
> designed not to rely on any guest-side software.
> 
> Signed-off-by: Paul Durrant <paul@xen.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <George.Dunlap@eu.citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> 
> v8:
>   - Addressed comments from Julien on v6 that I missed
> 
> v6:
>   - Addressed comments from Julien
> 
> v5:
>   - Note that PV domain are not just expected to co-operate, they are
>     required to
> 
> v4:
>   - Fix issues raised by Wei
> 
> v2:
>   - Use the term 'non-cooperative' instead of 'transparent'
>   - Replace 'trust in' with 'reliance on' when referring to guest-side
>     software
> ---
>   docs/designs/non-cooperative-migration.md | 280 ++++++++++++++++++++++
>   1 file changed, 280 insertions(+)
>   create mode 100644 docs/designs/non-cooperative-migration.md
> 
> diff --git a/docs/designs/non-cooperative-migration.md b/docs/designs/non-cooperative-migration.md
> new file mode 100644
> index 0000000000..4b876d809f
> --- /dev/null
> +++ b/docs/designs/non-cooperative-migration.md
> @@ -0,0 +1,280 @@
> +# Non-Cooperative Migration of Guests on Xen
> +
> +## Background
> +
> +The normal model of migration in Xen is driven by the guest because it was
> +originally implemented for PV guests, where the guest must be aware it is
> +running under Xen and is hence expected to co-operate. This model dates from
> +an era when it was assumed that the host administrator had control of at
> +least the privileged software running in the guest (i.e. the guest kernel)
> +which may still be true in an enterprise deployment but is not generally
> +true in a cloud environment. The aim of this design is to provide a model
> +which is purely host driven, requiring no co-operation from the software
> +running in the guest, and is thus suitable for cloud scenarios.
> +
> +PV guests are out of scope for this project because, as is outlined above,
> +they have a symbiotic relationship with the hypervisor and therefore a
> +certain level of co-operation is required.
> +
> +x86 HVM guests can already be migrated on Xen without guest co-operation
> +but only if they don’t have PV drivers installed[1] or are not in ACPI
> +power state S0. The reason for not expecting co-operation if the guest is
> +any sort of suspended state is obvious, but the reason co-operation is
> +expected if PV drivers are installed is due to the nature of PV protocols.
> +
> +## Xenstore Nodes and Domain ID
> +
> +The PV driver model consists of a *frontend* and a *backend*. The frontend
> +runs inside the guest domain and the backend runs inside a *service domain*
> +which may or may not be domain 0. The frontend and backend typically pass
> +data via memory pages which are shared between the two domains, but this
> +channel of communication is generally established using xenstore (the store
> +protocol itself being an exception to this for obvious chicken-and-egg
> +reasons).
> +
> +Typical protocol establishment is based on use of two separate xenstore
> +*areas*. If we consider PV drivers for the *netif* protocol (i.e. class vif)
> +and assume the guest has domid X, the service domain has domid Y, and the
> +vif has index Z then the frontend area will reside under the parent node:
> +
> +`/local/domain/Y/device/vif/Z`
> +
> +All backends, by convention, typically reside under parent node:
> +
> +`/local/domain/X/backend`
> +
> +and the normal backend area for vif Z would be:
> +
> +`/local/domain/X/backend/vif/Y/Z`
> +
> +but this should not be assumed.
> +
> +The toolstack will place two nodes in the frontend area to explicitly locate
> +the backend:
> +
> +    * `backend`: the fully qualified xenstore path of the backend area
> +    * `backend-id`: the domid of the service domain
> +
> +and similarly two nodes in the backend area to locate the frontend area:
> +
> +    * `frontend`: the fully qualified xenstore path of the frontend area
> +    * `frontend-id`: the domid of the guest domain
> +
> +
> +The guest domain only has write permission to the frontend area and
> +similarly the service domain only has write permission to the backend area,
> +but both ends have read permission to both areas.
> +
> +Under both frontend and backend areas is a node called *state*. This is key
> +to protocol establishment. Upon PV device creation the toolstack will set
> +the value of both state nodes to 1 (XenbusStateInitialising[2]). This
> +should cause enumeration of appropriate devices in both the guest and
> +service domains. The backend device, once it has written any necessary
> +protocol specific information into the xenstore backend area (to be read
> +by the frontend driver) will update the backend state node to 2
> +(XenbusStateInitWait). From this point on PV protocols differ slightly; the
> +following illustration is true of the netif protocol.
> +
> +Upon seeing a backend state value of 2, the frontend driver will then read
> +the protocol specific information, write details of grant references (for
> +shared pages) and event channel ports (for signalling) that it has created,
> +and set the state node in the frontend area to 4 (XenbusStateConnected).
> +Upon see this frontend state, the backend driver will then read the grant
> +references (mapping the shared pages) and event channel ports (opening its
> +end of them) and set the state node in the backend area to 4. Protocol
> +establishment is now complete and the frontend and backend start to pass
> +data.
> +
> +Because the domid of both ends of a PV protocol forms a key part of
> +negotiating the data plane for that protocol (because it is encoded into
> +both xenstore nodes and node paths), and because guest’s own domid and the
> +domid of the service domain are visible to the guest in xenstore (and hence
> +ay cached internally), and neither are necessarily preserved during
> +migration, it is hence necessary to have the co-operation of the frontend
> +in re-negotiating the protocol using the new domid after migration.
> +
> +Moreover the backend-id value will be used by the frontend driver in
> +setting up grant table entries and event channels to communicate with the
> +service domain, so the co-operation of the guest is required to
> +re-establish these in the new host environment after migration.
> +
> +Thus if we are to change the model and support migration of a guest with PV
> +drivers, without the co-operation of the frontend driver code, the paths and
> +values in both the frontend and backend xenstore areas must remain unchanged
> +and valid in the new host environment, and the grant table entries and event
> +channels must be preserved (and remain operational once guest execution is
> +resumed).
> +
> +Because the service domain’s domid is used directly by the guest in setting
> +up grant entries and event channels, the backend drivers in the new host
> +environment must be provided by service domain with the same domid. Also,
> +because the guest can sample its own domid from the frontend area and use
> +it in hypercalls (e.g. HVMOP_set_param) rather than DOMID_SELF, the guest
> +domid must also be preserved to maintain the ABI.
> +
> +Furthermore, it will necessary to modify backend drivers to re-establish
> +communication with frontend drivers without perturbing the content of the
> +backend area or requiring any changes to the values of the xenstore state
> +nodes.
> +
> +## Other Para-Virtual State
> +
> +### Shared Rings
> +
> +Because the console and store protocol shared pages are actually part of
> +the guest memory image (in an E820 reserved region just below 4G in x86
> +VMs) then the content will get migrated as part of the guest memory image.
> +Hence no additional code is require to prevent any guest visible change in
> +the content.
> +
> +### Shared Info
> +
> +There is already a record defined in *libxenctrl Domain Image Format* [3]
> +called `SHARED_INFO` which simply contains a complete copy of the domain’s
> +shared info page. It is not currently incuded in an HVM (type `0x0002`)
> +migration stream. It may be feasible to include it as an optional record
> +but it is not clear that the content of the shared info page ever needs
> +to be preserved for an HVM guest.
> +
> +For a PV guest the `arch_shared_info` sub-structure contains important
> +information about the guest’s P2M, but this information is not relevant for
> +an HVM guest where the P2M is not directly manipulated via the guest. The
> +other state contained in the `shared_info` structure relates the domain
> +wall-clock (the state of which should already be transferred by the `RTC`
> +HVM context information which contained in the `HVM_CONTEXT` save record)
> +and some event channel state (particularly if using the *2l* protocol).
> +Event channel state will need to be fully transferred if we are not going
> +to require the guest co-operation to re-open the channels and so it should
> +be possible to re-build a shared info page for an HVM guest from such other
> +state.
> +
> +Note that the shared info page also contains an array of
> +`XEN_LEGACY_MAX_VCPUS` (32 for x86) `vcpu_info` structures. A domain may
> +nominate a different guest physical address to use for the vcpu info. This
> +is mandatory if a domain wants to use more than XEN_LEGACY_MAX_VCPUS vCPUs
> +and optional otherwise. This mapping is not currently transferred in the
> +migration state so this will either need to be added into an existing save
> +record, or an additional type of save record will be needed.
> +
> +### Xenstore Watches
> +
> +As mentioned above, no domain Xenstore state is currently transferred in
> +the migration stream. There is a record defined in *libxenlight Domain
> +Image Format* [4] called `EMULATOR_XENSTORE_DATA` for transferring Xenstore
> +nodes relating to emulators but no record type is defined for nodes
> +relating to the domain itself, nor for registered *watches*. A XenStore
> +watch is a mechanism used by PV frontend and backend drivers to request a
> +notification if the value of a particular node (e.g. the other end’s state
> +node) changes, so it is important that watches continue to function after a
> +migration. One or more new save records will therefore be required to
> +transfer Xenstore state. It will also be necessary to extend the *store*
> +protocol[5] with mechanisms to allow the toolstack to acquire the list of
> +watches that the guest has registered and for the toolstack to register a
> +watch on behalf of a domain.
> +
> +### Event channels
> +
> +Event channels are essentially the para-virtual equivalent of interrupts.
> +They are an important part of post PV protocols. Normally a frontend driver
> +creates an *inter-domain* event channel between its own domain and the
> +domain running the backend, which it discovers using the `backend-id` node
> +in Xenstore (see above), by making a `EVTCHNOP_alloc_unbound` hypercall.
> +This hypercall allocates an event channel object in the hypervisor and
> +assigns a *local port* number which is then written into the frontend area
> +in Xenstore. The backend driver then reads this port number and *binds* to
> +the event channel by specifying it, and the value of `frontend-id`, as
> +*remote domain* and *remote port* (respectively) to a
> +`EVTCHNOP_bind_interdomain` hypercall. Once connection is established in
> +this fashion frontend and backend drivers can use the event channel as a
> +*mailbox* to notify each other when a shared ring has been updated with new
> +requests or response structures.
> +
> +Currently no event channel state is preserved on migration, requiring
> +frontend and backend drivers to create and bind a complete new set of event
> +channels in order to re-establish a protocol connection. Hence, one or more
> +new save records will be required to transfer event channel state in order
> +to avoid the need for explicit action by frontend drivers running in the
> +guest. Note that the local port numbers need to preserved in this state as
> +they are the only context the guest has to refer to the hypervisor event
> +channel objects.
> +
> +Note also that the PV *store* (Xenstore access) and *console* protocols
> +also rely on event channels which are set up by the toolstack. Normally,
> +early in migration, the toolstack running on the remote host would set up a
> +new pair of event channels for these protocols in the destination domain.
> +These may not be assigned the same local port numbers as the protocols
> +running in the source domain. For non-cooperative migration these channels
> +must either be created with fixed port numbers, or their creation must be
> +avoided and instead be included in the general event channel state
> +record(s).
> +
> +### Grant table
> +
> +The grant table is essentially the para-virtual equivalent of an IOMMU. For
> +example, the shared rings of a PV protocol are *granted* by a frontend
> +driver to the backend driver by allocating *grant entries* in the guest’s
> +table, filling in details of the memory pages and then writing the *grant
> +references* (the index values of the grant entries) into Xenstore. The
> +grant references of the protocol buffers themselves are typically written
> +directly into the request structures passed via a shared ring.
> +
> +The guest is responsible for managing its own grant table. No hypercall is
> +required to grant a memory page to another domain. It is sufficient to find
> +an unused grant entry and set bits in the entry to give read and/or write
> +access to a remote domain also specified in the entry along with the page
> +frame number. Thus the layout and content of the grant table logically
> +forms part of the guest state.
> +
> +Currently no grant table state is migrated, requiring a guest to separately
> +maintain any state that it wishes to persist elsewhere in its memory image
> +and then restore it after migration. Thus to avoid the need for such
> +explicit action by the guest, one or more new save records will be required
> +to migrate the contents of the grant table.
> +
> +# Outline Proposal
> +
> +* PV backend drivers will be modified to unilaterally re-establish
> +connection to a frontend if the backend state node is restored with value 4
> +(XenbusStateConnected)[6].
> +
> +* The toolstack choose a randomized domid for initial creation or default
> +migration, but preserve the source domid non-cooperative migration.
> +Non-Cooperative migration will have to be denied if the domid is
> +unavailable on the target host, but randomization of domid on creation
> +should hopefully minimize the likelihood of this. Non-Cooperative migration
> +to localhost will clearly not be possible.
> +
> +* `xenstored` should be modified to implement the new mechanisms needed.
> +See *Other Para-Virtual State* above. A further design document will
> +propose additional protocol messages.
> +
> +* Within the migration stream extra save records will be defined as
> +required. See *Other Para-Virtual State* above. A further design document
> +will propose modifications to the libxenlight and libxenctrl Domain Image
> +Formats.
> +
> +* An option should be added to the toolstack to initiate a non-cooperative
> +migration, instead of the (default) potentially co-operative migration.
> +Essentially this should skip the check to see if PV drivers and migrate as
> +if there are none present, but also enabling the extra save records. Note
> +that at least some of the extra records should only form part of a
> +non-cooperative migration stream. For example, migrating event channel
> +state would be counter productive in a normal migration as this will
> +essentially leak event channel objects at the receiving end. Others, such
> +as grant table state, could potentially harmlessly form part of a normal
> +migration stream.
> +
> +* * *
> +[1] PV drivers are deemed to be installed if the HVM parameter
> +*HVM_PARAM_CALLBACK_IRQ* has been set to a non-zero value.
> +
> +[2] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/xenbus.h
> +
> +[3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxc-migration-stream.pandoc
> +
> +[4] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxl-migration-stream.pandoc
> +
> +[5] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/xenstore.txt
> +
> +[6] `xen-blkback` and `xen-netback` have already been modified in Linux to do
> +this.
> 

-- 
Julien Grall

